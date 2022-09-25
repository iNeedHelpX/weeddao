import 'package:flutter/material.dart';
import 'package:weeddao/Start/asset_path.dart';
import 'package:weeddao/Start/loading.dart';
import 'package:weeddao/colors/colours_list.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              logo,
              width: 120,
            ),
            const SizedBox(
              height: 10,
            ),
            const Loading()
          ],
        ),
      ),
    );
  }
}
