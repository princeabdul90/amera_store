/*
* Developer: Abubakar Abdullahi
* Date: 05/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.onPressed,
    required this.child,
    this.width = 0.45,
    this.height = 35,
    this.color,
    this.radius = 25,
  }) : super(key: key);

   CustomButton.inProgress({
     final Color? color,
     final double? width,
     final double? height,
     final Color? loadingColor,

    Key? key
}) : this(
     color: color,
    width: width!,
    height: height!,
    child: Transform.scale(
      scale: 0.5,
      child: CircularProgressIndicator(color: loadingColor,),
    ),
    key: key,
  );

  final VoidCallback? onPressed;
  final Widget child;
  final double width;
  final double height;
  final Color? color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final size = Spacing.getSize(context);
    return Container(
      width: size.width * width,
      height: Spacing.getHeight(height),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Spacing.getHeight(radius)),
        color: color ?? AppColorStyles.yellowLightColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
