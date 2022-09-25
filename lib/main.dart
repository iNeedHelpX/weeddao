import 'package:flutter/material.dart';
import 'package:weeddao/Start/start.dart';
import 'package:weeddao/globalvars.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
//place controller access in here
  });
  runApp(Start());
}
