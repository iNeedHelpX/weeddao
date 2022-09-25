import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weeddao/Controllers/auth_controller.dart';
import 'package:weeddao/Start/start.dart';
import 'package:weeddao/globalvars.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value) {
//place controller access in here
    Get.put(AuthController());
  });
  runApp(Start());
}
