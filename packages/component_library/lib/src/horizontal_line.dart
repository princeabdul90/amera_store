/*
* Developer: Abubakar Abdullahi
* Date: 05/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  const HorizontalLine({
    Key? key,
    this.padding = 40.0,
    this.thickness = 1,
    this.color,
  }) : super(key: key);

  final double padding;
  final double thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spacing.getWidth(40.0)),
      child: Divider(
        thickness: thickness,
        color: color ?? AppColorStyles.primaryColor,
      ),
    );
  }
}
