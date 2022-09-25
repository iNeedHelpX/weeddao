import 'package:flurry_navigation/flurry_menu.dart';
import 'package:flurry_navigation/flurry_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradients_reborn/flutter_gradients_reborn.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:weeddao/Pages/home_pg.dart';
import 'package:weeddao/Start/bar/bottom_icons.dart';
import 'package:weeddao/Start/bar/top_appbar.dart';
import 'package:weeddao/colors/colours_list.dart';

class AppSetup extends StatefulWidget {
  const AppSetup({Key? key}) : super(key: key);

  @override
  AppSetupState createState() => AppSetupState();
}

class AppSetupState extends State<AppSetup> {
  final _controller = PageController();
  int selectedpage = 1;
  PageView pageViews() {
    return PageView(
      controller: _controller,
      children: const <Widget>[
        HomePage(),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: FlutterGradients.confidentCloud(
          type: GradientType.linear,
          tileMode: TileMode.values[0],
        ),
      ),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: myTopBar(context),
        body: pageViews(),
        extendBody: true,
        bottomNavigationBar: RollingBottomBar(
          color: barback1,
          itemColor: textturq2,
          controller: _controller,
          useActiveColorByDefault: false,
          items: bottomBarItems,
          enableIconRotation: true,
          onTap: (index) {
            _controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
            );
          },
        ),
      ),
    );
  }
}
