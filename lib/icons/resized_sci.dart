import 'package:flutter/material.dart';

class SciIcon extends StatelessWidget {
  const SciIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 40,
        child: Image.asset(
          'assets/icons/entourage-effect.png',
          height: 25,
        ));
  }
}
