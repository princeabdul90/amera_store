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

class SellerTabContainerScreen extends StatelessWidget {
  const SellerTabContainerScreen({Key? key}) : super(key: key);

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
                label: l10n.sellerHomeBottomNavigationBarItemLabel,
                icon: const Icon(FluentIcons.home_16_regular),
                activeIcon: const Icon(FluentIcons.home_16_filled),
              ),
              BottomNavigationBarItem(
                label: l10n.sellerCategoryBottomNavigationBarItemLabel,
                icon: const Icon(FluentIcons.search_16_regular),
                activeIcon: const Icon(FluentIcons.search_16_filled),
              ),
              BottomNavigationBarItem(
                label: l10n.sellerStoresBottomNavigationBarItemLabel,
                icon: const Icon(FluentIcons.building_shop_20_regular),
                activeIcon: const Icon(FluentIcons.building_shop_20_filled),
              ),
              BottomNavigationBarItem(
                label: l10n.sellerDashboardBottomNavigationBarItemLabel,
                icon: const Icon(FluentIcons.glance_20_regular),
                activeIcon: const Icon(FluentIcons.glance_20_filled),
              ),
              BottomNavigationBarItem(
                label: l10n.sellerUploadBottomNavigationBarItemLabel,
                icon: const Icon(FluentIcons.cloud_arrow_up_20_regular),
                activeIcon: const Icon(FluentIcons.cloud_arrow_up_20_filled),
              ),
            ],
        ),
    );
  }
}
