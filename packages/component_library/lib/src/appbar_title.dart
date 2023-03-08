/*
* Developer: Abubakar Abdullahi
* Date: 05/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({Key? key, required this.title, this.fontsize = 28})
      : super(key: key);

  final String title;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          color: AppColorStyles.grayDarkColor,
          fontSize: fontsize, fontFamily: 'Tajawal', letterSpacing: 1.5),
    );
  }
}
