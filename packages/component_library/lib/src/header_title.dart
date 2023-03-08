/*
* Developer: Abubakar Abdullahi
* Date: 05/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    Key? key,
    required this.name,
    this.fontsize = 24,
    this.verticalPadding = 20,
    this.horizontalPadding = 30,
  }) : super(key: key);

  final String name;
  final double fontsize;
  final double verticalPadding;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: Spacing.getHeight(verticalPadding),
          horizontal: Spacing.getWidth(horizontalPadding),
      ),
      child: Text(
        name,
        style: TextStyle(
            fontSize: Spacing.getHeight(fontsize),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5),
      ),
    );
  }
}
