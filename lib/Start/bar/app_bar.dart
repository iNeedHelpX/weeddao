import 'package:flutter/material.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weeddao/colors/colours_list.dart';

AppBar curvedTopBar() {
  return AppBar(
    elevation: 15,
    flexibleSpace: ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(60),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: FlutterGradients.perfectBlue(tileMode: TileMode.clamp),
        ),
      ),
    ),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(60),
      ),
    ),
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Blaze Up!",
                  style: GoogleFonts.nothingYouCouldDo(
                      color: textturq2,
                      fontSize: 45,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    ),
  );
}
