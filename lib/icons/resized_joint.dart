import 'package:flutter/material.dart';

class JointMJIcon extends StatelessWidget {
  const JointMJIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: 40,
        child: Image.asset(
          'assets/icons/jointmj.png',
          height: 25,
        ));
  }
}
