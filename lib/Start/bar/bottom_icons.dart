import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'package:weeddao/icons/resized_joint.dart';
import 'package:weeddao/icons/resized_sci.dart';

List<RollingBottomBarItem> get bottomBarItems {
  return const [
    RollingBottomBarItem(JointMJIcon(),
        label: 'About', activeColor: Colors.black),
    RollingBottomBarItem(MdiIcons.spiderThread,
        label: 'Spiders', activeColor: Colors.black),
    RollingBottomBarItem(MdiIcons.rodent,
        label: 'Rats', activeColor: Colors.black),
  ];
}

List<Widget> listBarIcons() {
  return const <Widget>[
    //icon list
    JointMJIcon(),
    SciIcon(),
  ];
}
