/*
* Developer: Abubakar Abdullahi
* Date: 06/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:dashboard/dashboard.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key, required this.onTappedLogout}) : super(key: key);

  final VoidCallback onTappedLogout;

  @override
  Widget build(BuildContext context) {
    return  DashboardView(onTappedLogout: onTappedLogout);
  }
}


@visibleForTesting
class DashboardView extends StatelessWidget {
  const DashboardView({Key? key, required this.onTappedLogout}) : super(key: key);

  final VoidCallback onTappedLogout;

  @override
  Widget build(BuildContext context) {
    final l10n = DashboardScreenLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColorStyles.yellowLightColor,
      appBar: AppBar(
        backgroundColor: AppColorStyles.whiteColor,
        elevation: 0.0,
        centerTitle: true,
        title: AppBarTitle(title: l10n.pageTitle,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                      onPressed: onTappedLogout,
                      icon:  Icon(FluentIcons.arrow_exit_20_regular, color: AppColorStyles.grayDarkColor,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Logout", style: TextStyle( fontSize: 12, color: AppColorStyles.grayDarkColor,),),
                )
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25, top: 80),
        child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            children:  [
              IconCard(
                onTap: () {  },
                title: l10n.storeCardTitle.toUpperCase(),
                icon:FluentIcons.building_shop_20_regular,
                color: AppColorStyles.accentIndigoColor,
              ),
              IconCard(
                onTap: () {  },
                title: l10n.ordersCardTitle.toUpperCase(),
                icon:FluentIcons.tray_item_add_20_regular,
                color: AppColorStyles.accentIndigoColor,
              ),
              IconCard(
                onTap: () {  },
                title: l10n.profileCardTitle.toUpperCase(),
                icon:FluentIcons.edit_20_regular,
                color: AppColorStyles.accentIndigoColor,
              ),
              IconCard(
                onTap: () {  },
                title: l10n.productsCardTitle.toUpperCase(),
                icon:FluentIcons.edit_settings_20_regular,
                color: AppColorStyles.accentIndigoColor,
              ),
              IconCard(
                onTap: () {  },
                title: l10n.balanceCardTitle.toUpperCase(),
                //icon:FluentIcons.wallet_credit_card_20_regular,
                icon:FluentIcons.money_20_regular,
                color: AppColorStyles.accentIndigoColor,
              ),
              IconCard(
                onTap: () {  },
                title: l10n.statisticCardTitle.toUpperCase(),
                icon:FluentIcons.poll_20_regular,
                color: AppColorStyles.accentIndigoColor,
              ),

            ],
        ),
      ),
    );
  }
}




