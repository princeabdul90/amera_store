/*
* Developer: Abubakar Abdullahi
* Date: 07/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({
    Key? key,
    this.radius = 40,
    this.image,
    this.child,
  }) : super(key: key);

  final double radius;
  final ImageProvider? image;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: Spacing.getHeight(radius),
      backgroundColor: AppColorStyles.grayLightColor,
      child: CircleAvatar(
        radius: Spacing.getHeight(radius - 5),
        backgroundColor: AppColorStyles.whiteColor,
        backgroundImage: image,
        child: child,
      ),
    );
  }
}
