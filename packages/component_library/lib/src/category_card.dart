/*
* Developer: Abubakar Abdullahi
* Date: 05/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

const String emptyImage = "assets/images/no_image.jpg";

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {Key? key,
      required this.title,
        this.imagePath,
        this.radius = 10,
        this.fontsize = 10,
      })
      : super(key: key);

  final String? imagePath;
  final String title;
  final double radius;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Spacing.getHeight(100),
      width: Spacing.getWidth(100),
      padding: EdgeInsets.symmetric(
          vertical: Spacing.getHeight(10), horizontal: Spacing.getWidth(10)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(Spacing.getHeight(radius)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              height: Spacing.getHeight(70),
              width: Spacing.getWidth(70),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(imagePath ?? emptyImage),
                fit: BoxFit.contain,
              )),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: Spacing.getHeight(8.0)),
            child: Text(
              title,
              style: TextStyle(fontSize: Spacing.getHeight(fontsize)),
            ),
          ),
        ],
      ),
    );
  }
}
