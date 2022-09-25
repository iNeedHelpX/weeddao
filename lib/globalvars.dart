// ignore_for_file: constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:logger/logger.dart';
import 'package:weeddao/Controllers/auth_controller.dart';
import 'package:weeddao/Controllers/weedproducts_controller.dart';

// for firebase
final Future<FirebaseApp> initialization = Firebase.initializeApp();
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;

//controllers
AuthController authController = AuthController.instance;
WeedController weedController = WeedController.instance;

//other variables
Logger logger = Logger();
