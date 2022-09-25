import 'package:flutter/material.dart';

LinearGradient yellowPinkGrad() {
  return LinearGradient(colors: [
    Color.fromARGB(255, 252, 243, 217),
    Color.fromARGB(255, 252, 223, 137),
    Color.fromARGB(255, 255, 59, 213)
  ], begin: Alignment.topLeft, end: Alignment.bottomRight);
}
