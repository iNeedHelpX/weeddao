import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weeddao/colors/colours_list.dart';

class NeuromorphicWarningBox extends StatefulWidget {
  final String boomtitle;
  final String subtext;
  const NeuromorphicWarningBox(
      {Key? key, required this.boomtitle, required this.subtext})
      : super(key: key);

  @override
  State<NeuromorphicWarningBox> createState() => _NeuromorphicWarningBoxState();
}

class _NeuromorphicWarningBoxState extends State<NeuromorphicWarningBox> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          //pads the box from the side of the screen
          padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
          child: Container(
            //sets size of box
            width: size.width,

            padding: const EdgeInsets.fromLTRB(10, 15, 10, 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 239, 230, 235),
              borderRadius: BorderRadius.circular(31),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 197, 182, 185),
                  Color.fromARGB(255, 239, 230, 235)
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 242, 227, 234),
                  offset: Offset(-12.0, -12.0),
                  blurRadius: 35,
                  spreadRadius: 0.0,
                ),
                BoxShadow(
                  color: Color.fromARGB(255, 197, 182, 185),
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
              style: GoogleFonts.sniglet(
                color: bg,
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
        style: GoogleFonts.lemon(
            fontSize: 22, fontWeight: FontWeight.w500, color: barback3),
        textAlign: TextAlign.center,
      ),
    );
  }
}
