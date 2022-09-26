import 'package:flutter/material.dart';

//maps page
class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          SafeArea(
            child: Column(),
          ),
        ],
      ),
    );
  }
}
