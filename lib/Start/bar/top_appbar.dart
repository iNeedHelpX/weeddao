import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weeddao/colors/bluepurple_gradient.dart';
import 'package:weeddao/colors/colours_list.dart';
import 'package:weeddao/colors/gradient.dart';

AppBar myTopBar(BuildContext context) {
  return AppBar(
    shadowColor: textgreyblue,

    flexibleSpace: ClipRRect(
      borderRadius: const BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: lightGrad(),
        ),
      ),
    ),
    elevation: 16,

    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(24),
        bottomRight: Radius.circular(24),
      ),
    ),
    //set size of appbar. This is sort of big
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(100),
      child: Stack(
        children: [
          Text(
            "Weed Meet",
            style: GoogleFonts.damion(
              color: bg2,
              fontWeight: FontWeight.w800,
              fontSize: 65,
              shadows: [
                Shadow(
                  offset: const Offset(8, 8.0),
                  blurRadius: 17.0,
                  color: fill2.withOpacity(0.6),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
