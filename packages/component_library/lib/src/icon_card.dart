/*
* Developer: Abubakar Abdullahi
* Date: 06/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  const IconCard(
      {Key? key,
      required this.onTap,
      required this.title,
      required this.icon,
      this.iconSize = 30,
      this.fontsize = 20,
      this.height = 50,
      this.width = 50,
      this.color,
      })
      : super(key: key);

  final VoidCallback onTap;
  final String title;
  final double height;
  final double width;
  final IconData icon;
  final double iconSize;
  final double fontsize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Spacing.getHeight(10)),
        height: Spacing.getHeight(height),
        width: Spacing.getWidth(width),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Spacing.getHeight(20)),
            color: AppColorStyles.whiteColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              size: iconSize,
              color: color,
            ),
            Text(
              title,
              style:  TextStyle(
                  fontSize: fontsize,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Tajawal"),
            )
          ],
        ),
      ),
    );
  }
}
