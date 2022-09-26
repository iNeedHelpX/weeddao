import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:weeddao/Models/user_model.dart';
import 'package:weeddao/Pages/login_pg.dart';
import 'package:weeddao/Start/app_setup.dart';
import 'package:weeddao/globalvars.dart';

//for authentication
class AuthController extends GetxController {
  static AuthController instance = Get.find();

  final RxBool admin = false.obs;
  // final FirebaseFirestore _db = FirebaseFirestore.instance;
  Rxn<User> firebaseUser = Rxn<User>();

  Rxn<UserModel> firestoreUser = Rxn<UserModel>();
  GoogleSignIn googleSignIn = GoogleSignIn();
  Rx<UserModel> userModel = UserModel().obs;
  String usersCollection = "weedusers";

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onReady() async {
    //run every time auth state changes
    firebaseUser = Rxn<User>();
    firebaseUser.bindStream(user);
    ever(firebaseUser, handleAuthChanged);

    super.onReady();
  }

  handleAuthChanged(firebaseUser) async {
    //get user data from firestore
    if (firebaseUser?.uid != null) {
      firestoreUser.bindStream(streamFirestoreUser());
      print("This user is named ${firebaseUser.displayName}");
      await isAdmin();
    }
    //this is to determine if the user is logged in to firebase
    if (firebaseUser == null) {
      print('Send to signin');
      Get.offAll(const LoginPage());
    } else {
      Get.offAll(const AppSetup());
    }
  }

  // Firebase user one-time fetch
  Future<User> get getUser async => auth.currentUser!;

  // Firebase user a realtime stream
  Stream<User?> get user => auth.authStateChanges();

  //Streams the firestore user from the firestore collection
  Stream<UserModel> streamFirestoreUser() {
    print('streamFirestoreUser()');

    return firebaseFirestore
        .doc('/users/${firebaseUser.value!.uid}')
        .snapshots()
        .map((snapshot) => UserModel.fromSnapshot(snapshot));
  }

  //get the firestore user from the firestore collection
  Future<UserModel> getFirestoreUser() {
    return firebaseFirestore
        .doc('/users/${firebaseUser.value!.uid}')
        .get()
        .then((documentSnapshot) => UserModel.fromSnapshot(documentSnapshot));
  }

  // User registration using email and password
  void googleLogin(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.accessToken != null && googleAuth.idToken != null) {
        try {
          await auth
              .signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleAuth.idToken,
                accessToken: googleAuth.accessToken),
          )
              .then((result) async {
            print('uid: ' + result.user!.uid.toString());
            print('email: ' + result.user!.email.toString());

            //create the new user object from the login modelled data
            UserModel _newUser = UserModel(
              id: result.user!.uid,
              email: result.user!.email!,
              name: result.user!.displayName,
              photoURL: result.user!.photoURL,
              // cart: [],
            );
            _addUserToFirestore(_newUser, result.user!);
          });
        } on FirebaseAuthException catch (error) {
          Get.snackbar('auth.signUpErrorTitle'.tr, error.message!,
              snackPosition: SnackPosition.BOTTOM,
              duration: const Duration(seconds: 10),
              backgroundColor: Get.theme.snackBarTheme.backgroundColor,
              colorText: Get.theme.snackBarTheme.actionTextColor);
        }
      }
    }
  }

  // a function to update the user details
  Future<void> updateUser(BuildContext context, UserModel user, String oldEmail,
      String password) async {
    String _authUpdateUserNoticeTitle = 'auth.updateUserSuccessNoticeTitle'.tr;
    String _authUpdateUserNotice = 'auth.updateUserSuccessNotice'.tr;
    try {
      try {
        await auth
            .signInWithEmailAndPassword(email: oldEmail, password: password)
            .then((_firebaseUser) async {
          await _firebaseUser.user!
              .updateEmail(user.email!)
              .then((value) => _updateUserFirestore(user, _firebaseUser.user!));
        });
      } catch (err) {
        print('Caught error: $err');
        //not yet working, see this issue https://github.com/delay/flutter_starter/issues/21
        if (err.toString() ==
            "[firebase_auth/email-already-in-use] The email address is already in use by another account.") {
          _authUpdateUserNoticeTitle = 'auth.updateUserEmailInUse'.tr;
          _authUpdateUserNotice = 'auth.updateUserEmailInUse'.tr;
        } else {
          _authUpdateUserNoticeTitle = 'auth.wrongPasswordNotice'.tr;
          _authUpdateUserNotice = 'auth.wrongPasswordNotice'.tr;
        }
      }

      Get.snackbar(_authUpdateUserNoticeTitle, _authUpdateUserNotice,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    } on PlatformException catch (error) {
      //List<String> errors = error.toString().split(',');
      // print("Error: " + errors[1]);

      print(error.code);
      String authError;
      switch (error.code) {
        case 'ERROR_WRONG_PASSWORD':
          authError = 'auth.wrongPasswordNotice'.tr;
          break;
        default:
          authError = 'auth.unknownError'.tr;
          break;
      }
      Get.snackbar('auth.wrongPasswordNoticeTitle'.tr, authError,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 10),
          backgroundColor: Get.theme.snackBarTheme.backgroundColor,
          colorText: Get.theme.snackBarTheme.actionTextColor);
    }
  }

  updateUserData(Map<String, dynamic> data) {
    logger.i("UPDATED");
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value!.uid)
        .update(data);
  }

  //check if user is an admin user
  isAdmin() async {
    await getUser.then((user) async {
      DocumentSnapshot adminRef =
          await firebaseFirestore.collection('admin').doc(user.uid).get();
      if (adminRef.exists) {
        admin.value = true;
      } else {
        admin.value = false;
      }
      update();
    });
  }

  // Sign out
  Future<void> signOut() async {
    await googleSignIn.signOut();
    return auth.signOut();
  }

  //updates the firestore user in users collection
  void _updateUserFirestore(UserModel user, User firebaseUser) {
    firebaseFirestore.doc('/users/${firebaseUser.uid}').update(user.toJson());
    update();
  }

//adds the user to firestore!
  void _addUserToFirestore(UserModel user, User firebaseUser) {
    firebaseFirestore.collection(usersCollection).doc(user.id).set({
      "name": firebaseUser.displayName,
      "photoURL": user.photoURL,
      "uid": user.id,
      "email": user.email,
      "cart": []
    });
  }
}
