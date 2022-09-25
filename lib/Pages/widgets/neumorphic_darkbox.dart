import 'package:flutter/material.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weeddao/colors/colours_list.dart';

class NeuromorphicBoxDark extends StatefulWidget {
  final String boomtitle;
  final String subtext;
  const NeuromorphicBoxDark(
      {Key? key, required this.boomtitle, required this.subtext})
      : super(key: key);

  @override
  State<NeuromorphicBoxDark> createState() => _NeuromorphicBoxDarkState();
}

class _NeuromorphicBoxDarkState extends State<NeuromorphicBoxDark> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          //pads the box from the side of the screen
          padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Container(
            //sets size of box
            width: size.width,

            padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 145, 125, 238),
              borderRadius: BorderRadius.circular(31),
              gradient: FlutterGradients.nightSky(),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 223, 217, 246),
                  offset: Offset(-12.0, -12.0),
                  blurRadius: 35,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 40, 34, 63),
                  offset: Offset(12.0, 12.0),
                  blurRadius: 34,
                  spreadRadius: 0.0,
                ),
              ],
            ),
            child: Column(children: [
              _title(),
              _subtext(),
            ]),
          ),
        ),
      ],
    );
  }

  //description
  Align _subtext() {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.subtext,
              style: GoogleFonts.cherryCreamSoda(
                color: lightblue,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //title
  Align _title() {
    return Align(
      alignment: Alignment.topCenter,
      child: Text(
        widget.boomtitle,
        style: GoogleFonts.nothingYouCouldDo(
          fontSize: 40,
          fontWeight: FontWeight.w800,
          color: textturq2,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
