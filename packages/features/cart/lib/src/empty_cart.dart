/*
* Developer: Abubakar Abdullahi
* Date: 05/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key, required this.onPressed}) : super(key: key);

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Your Cart is Empty!",
          style: TextStyle(fontSize: Spacing.getHeight(30)),
        ),
        Gap(Spacing.getHeight(50)),

        CustomElevatedButton(
            minWidth: 0.5,
            onPressed: onPressed, title: "Continue Shopping"),

      ],
    );
  }
}
