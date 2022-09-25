import 'package:flutter/material.dart';
import 'package:weeddao/colors/colours_list.dart';

LinearGradient greenPurpleGrad() {
  return const LinearGradient(colors: [
    Color.fromARGB(255, 124, 122, 245),
    Color.fromARGB(255, 133, 255, 194)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
}
