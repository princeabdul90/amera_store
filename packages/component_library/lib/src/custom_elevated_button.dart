/*
* Developer: Abubakar Abdullahi
* Date: 05/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.minWidth = 0.6,
    this.color,
    this.textColor,
    this.radius = 25,
    this.fontsize = 18,
    this.elevation = 0.0,

  }) : super(key: key);

  final VoidCallback onPressed;
  final String title;
  final double minWidth;
  final Color? color;
  final Color? textColor;
  final double radius;
  final double fontsize;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    final size = Spacing.getSize(context);
    return Material(
      elevation: elevation,
      color: color ?? AppColorStyles.lightBlueColor,
      borderRadius: BorderRadius.circular(Spacing.getHeight(radius)),
      child: MaterialButton(
        minWidth: size.width * minWidth,
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(
              fontSize: Spacing.getHeight(fontsize),
              color: textColor ?? Colors.white),
        ),
      ),
    );
  }
}
