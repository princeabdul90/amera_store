/*
* Developer: Abubakar Abdullahi
* Date: 02/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

import 'l10n/app_localizations.dart';

class TabContainerScreen extends StatelessWidget {
  const TabContainerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final tabState = CupertinoTabPage.of(context);
    return CupertinoTabScaffold(
        controller: tabState.controller,
        tabBuilder: tabState.tabBuilder,
        tabBar: CupertinoTabBar(
            activeColor: AppColorStyles.accentOrangeColor,
            inactiveColor: Colors.grey,
            items:  [
              BottomNavigationBarItem(
                label: l10n.homeBottomNavigationBarItemLabel,
                icon: const Icon(FluentIcons.home_16_regular),
                activeIcon: const Icon(FluentIcons.home_16_filled),
              ),
              BottomNavigationBarItem(
                label: l10n.categoryBottomNavigationBarItemLabel,
                icon: const Icon(FluentIcons.search_16_regular),
                activeIcon: const Icon(FluentIcons.search_16_filled),
              ),
              BottomNavigationBarItem(
                label: l10n.storesBottomNavigationBarItemLabel,
                icon: const Icon(FluentIcons.building_shop_16_regular),
                activeIcon: const Icon(FluentIcons.building_shop_16_filled),
              ),
              BottomNavigationBarItem(
                label: l10n.cartBottomNavigationBarItemLabel,
                icon: const Icon(FluentIcons.cart_16_regular),
                activeIcon: const Icon(FluentIcons.cart_16_filled),
              ),
              BottomNavigationBarItem(
                label: l10n.profileBottomNavigationBarItemLabel,
                icon: const Icon(FluentIcons.person_16_regular),
                activeIcon: const Icon(FluentIcons.person_16_filled),
              ),
            ],
        ),
    );
  }
}
