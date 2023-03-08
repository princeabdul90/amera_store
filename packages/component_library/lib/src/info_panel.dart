/*
* Developer: Abubakar Abdullahi
* Date: 05/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class InfoPanel extends StatelessWidget {
  const InfoPanel({
    Key? key,

    this.titleHeight = 260,

    this.firstLeadingTile,
    required this.firstTitleTile,
    this.firstSubtitleTile,
    this.firstOnTap,

    this.secondLeadingTile,
    required this.secondTitleTile,
    this.secondSubtitleTile,
    this.secondOnTap,

    this.thirdLeadingTile,
    required this.thirdTitleTile,
    this.thirdSubtitleTile,
    this.thirdOnTap,
  }) : super(key: key);

  final double titleHeight;

  final Widget? firstLeadingTile;
  final Widget firstTitleTile;
  final Widget? firstSubtitleTile;
  final VoidCallback? firstOnTap;

  final Widget? secondLeadingTile;
  final Widget secondTitleTile;
  final Widget? secondSubtitleTile;
  final VoidCallback? secondOnTap;

  final Widget? thirdLeadingTile;
  final Widget thirdTitleTile;
  final Widget? thirdSubtitleTile;
  final VoidCallback? thirdOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(
        Spacing.getHeight(15),
      ),
      child: Container(
        height: Spacing.getHeight(titleHeight),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              Spacing.getHeight(16),
            )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              onTap: firstOnTap,
              leading: firstLeadingTile,
              title: firstTitleTile,
              subtitle: firstSubtitleTile,
            ),
            const HorizontalLine(),
            ListTile(
              onTap: secondOnTap,
              leading: secondLeadingTile,
              title: secondTitleTile,
              subtitle: secondSubtitleTile,
            ),
            const HorizontalLine(),
            ListTile(
                onTap: thirdOnTap,
                leading: thirdLeadingTile,
                title: thirdTitleTile,
                subtitle: thirdSubtitleTile,
            ),
          ],
        ),
      ),
    );
  }
}
