/*
* Developer: Abubakar Abdullahi
* Date: 03/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

/// This is like a dummy search bar. When a user tap the search bar, redirect user to search page.
class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    required this.searchTitle,
    required this.buttonLabel,
    required this.onTap,
  }) : super(key: key);

  final String searchTitle;
  final String buttonLabel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Spacing.getHeight(35),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Spacing.getHeight(25)),
          border: Border.all(
            width: 1.4,
            color: AppColorStyles.primaryColor,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding:
                  EdgeInsets.symmetric(horizontal: Spacing.getWidth(10.0)),
                  child: Icon(
                    FluentIcons.search_16_regular,
                    color: AppColorStyles.graySecondary,
                  ),
                ),
                Text(
                  searchTitle,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColorStyles.graySecondary,
                  ),
                ),
              ],
            ),
            Container(
              height: Spacing.getHeight(32),
              width: Spacing.getWidth(75),
              decoration: BoxDecoration(
                  color: AppColorStyles.primaryColor,
                  borderRadius: BorderRadius.circular(25)),
              child: Center(
                child: Text(
                  buttonLabel,
                  style: const TextStyle(fontSize: 16, color: Colors.grey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
