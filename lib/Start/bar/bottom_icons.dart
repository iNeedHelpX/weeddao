import 'package:flutter/material.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';
import 'package:weeddao/colors/colours_list.dart';
import 'package:weeddao/icons/resized_joint.dart';
import 'package:weeddao/icons/resized_sci.dart';

List<RollingBottomBarItem> get bottomBarItems {
  return const [
    RollingBottomBarItem(IcoFontIcons.weed, label: 'Weed', activeColor: green1),
    RollingBottomBarItem(MdiIcons.accountEye,
        label: 'Eye', activeColor: tabicon),
    RollingBottomBarItem(MdiIcons.walletMembership,
        label: 'Wallet', activeColor: medgreen),
  ];
}

List<Widget> listBarIcons() {
  return const <Widget>[
    //icon list
    JointMJIcon(),
    SciIcon(),
  ];
}
