import 'package:flutter/material.dart';

LinearGradient lightGrad() {
  return LinearGradient(colors: [
    Color.fromARGB(255, 127, 255, 236),
    Color.fromARGB(255, 89, 254, 255),
    Color.fromARGB(255, 101, 228, 157)
  ], begin: Alignment.bottomRight, end: Alignment.topLeft);
}
