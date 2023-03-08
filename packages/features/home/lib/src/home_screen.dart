/*
* Developer: Abubakar Abdullahi
* Date: 02/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key, required this.onTapSearch}) : super(key: key);

  final VoidCallback onTapSearch;

  @override
  Widget build(BuildContext context) {
    final l10n = HomeScreenLocalizations.of(context);
    return DefaultTabController(
      length: 9,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          //title: const CupertinoSearchTextField(),
          title: CustomSearchBar(
            searchTitle: l10n.searchFieldTextLabel,
            buttonLabel: l10n.searchButtonLabel,
            onTap: onTapSearch,
          ),
          bottom: TabBar(
              isScrollable: true,
              indicatorColor: AppColorStyles.primaryColor,
              indicatorWeight: 2,
              tabs: [
                CustomTab(label: l10n.menTabLabel),
                CustomTab(label: l10n.womenTabLabel),
                CustomTab(label: l10n.electronicsTabLabel),
                CustomTab(label: l10n.accessoriesTabLabel),
                CustomTab(label: l10n.shoesTabLabel),
                CustomTab(label: l10n.homeAndGardenTabLabel),
                CustomTab(label: l10n.beautyTabLabel),
                CustomTab(label: l10n.kidsTabLabel),
                CustomTab(label: l10n.bagsTabLabel),
              ]),
        ),
        body: const TabBarView(
          children: [
            Text("Men Screen"),
            Text("Women Screen"),
            Text("Electronics Screen"),
            Text("Accessories Screen"),
            Text("Shoes Screen"),
            Text("Home And Garden Screen"),
            Text("Beauty Screen"),
            Text("Kids Screen"),
            Text("Bags Screen")
          ],
        ),
      ),
    );
  }
}

class CustomTab extends StatelessWidget {
  final String label;
  const CustomTab({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: TextStyle(color: Colors.grey.shade600),
      ),
    );
  }
}

