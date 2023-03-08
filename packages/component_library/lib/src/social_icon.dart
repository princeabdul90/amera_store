/*
* Developer: Abubakar Abdullahi
* Date: 06/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.widget,
      this.fontsize = 16,
      this.height = 50,
      this.width = 50,
      this.textColor,
      })
      : super(key: key);

  final String title;
  final VoidCallback onTap;
  final Widget widget;
  final double fontsize;
  final double height;
  final double width;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
           SizedBox(
            height: Spacing.getHeight(height),
            width: Spacing.getWidth(width),
            child: widget,
          ),
          Text(
            title,
            style: TextStyle(fontSize: fontsize, color: textColor),
          )
        ],
      ),
    );
  }
}
