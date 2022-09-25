import 'package:flutter/material.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weeddao/colors/colours_list.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  // final AuthController authController = Get.find();
  // final LoginController logController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(15, 20, 15, 5),
                    decoration: BoxDecoration(
                      gradient: FlutterGradients.coldEvening(
                          tileMode: TileMode.clamp),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "No need to register. Just sign in with Google!",
                          //style info next
                          style: GoogleFonts.fjallaOne(
                            color: brighty,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        //buffer space
                        const SizedBox(
                          height: 20,
                        ),
                        SignInButton(
                          elevation: 4,
                          padding: const EdgeInsets.all(10),
                          Buttons.Google,
                          onPressed: () {
                            //sign in logic goes here

                            // logController.googleLogin();
                            // authController.googleLogin(context);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
