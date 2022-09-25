import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'package:weeddao/icons/resized_joint.dart';
import 'package:weeddao/icons/resized_sci.dart';

List<RollingBottomBarItem> get bottomBarItems {
  return const [
    RollingBottomBarItem(IcoFontIcons.weed,
        label: 'Weed', activeColor: Colors.black),
    RollingBottomBarItem(MdiIcons.accountEye,
        label: 'Eye', activeColor: Colors.black),
    RollingBottomBarItem(MdiIcons.walletMembership,
        label: 'Wallet', activeColor: Colors.black),
  ];
}

List<Widget> listBarIcons() {
  return const <Widget>[
    //icon list
    JointMJIcon(),
    SciIcon(),
  ];
}
