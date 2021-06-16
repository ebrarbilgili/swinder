import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kartal/kartal.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../extensions/locale_extensions.dart';
import '../../lang/locale_key.g.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  BottomNavigationBarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: buildPaddingEdgeInsets(context),
      margin: buildMarginEdgeInsets(context),
      decoration: buildBoxDecoration(context),
      child: buildSalomonBottomBar(context),
    );
  }

  SalomonBottomBar buildSalomonBottomBar(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: currentIndex,
      selectedItemColor: context.colorScheme.primary,
      itemPadding: context.paddingNormal,
      onTap: onTap,
      unselectedItemColor: context.colorScheme.secondary,
      items: items,
    );
  }

  List<SalomonBottomBarItem> get items {
    return [
      buildSalomonBottomBarItem(
        FontAwesomeIcons.home,
        LocaleKeys.home,
      ),
      buildSalomonBottomBarItem(
        FontAwesomeIcons.solidUser,
        LocaleKeys.profile_settings,
      ),
    ];
  }

  EdgeInsets buildPaddingEdgeInsets(BuildContext context) {
    return EdgeInsets.only(
      // bottom: context.dynamicHeight(0.016),
      left: context.dynamicHeight(0.04),
      right: context.dynamicHeight(0.04),
    );
  }

  EdgeInsets buildMarginEdgeInsets(BuildContext context) {
    return EdgeInsets.only(
      bottom: context.dynamicHeight(0.05),
      top: context.dynamicHeight(0.01),
      left: context.dynamicHeight(0.04),
      right: context.dynamicHeight(0.04),
    );
  }

  BoxDecoration buildBoxDecoration(BuildContext context) {
    return BoxDecoration(
      color: context.colorScheme.surface,
      border: Border.all(color: context.colorScheme.secondary, width: 0.5),
      boxShadow: [
        BoxShadow(
          color: context.colorScheme.secondary,
          offset: Offset(0.0, 0.0), //(x,y)
          blurRadius: 4.0,
        )
      ],
      borderRadius: BorderRadius.all(context.normalRadius),
    );
  }

  SalomonBottomBarItem buildSalomonBottomBarItem(
      IconData iconData, String title) {
    return SalomonBottomBarItem(
      icon: FaIcon(iconData),
      title: AutoSizeText(title.locale),
    );
  }
}
