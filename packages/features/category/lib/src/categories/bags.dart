/*
* Developer: Abubakar Abdullahi
* Date: 04/02/2023
*/

import 'package:category/category.dart';
import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

class Bags extends StatelessWidget {
  const Bags({Key? key, required this.onTapCategoryItem}) : super(key: key);

  final VoidCallback onTapCategoryItem;

  @override
  Widget build(BuildContext context) {
    final l10 = CategoryScreenLocalizations.of(context);
    final size = Spacing.getSize(context);
    return Container(
      color: AppColorStyles.grayLightColor,
      child: Column(
        children: [
          HeaderTitle(
            name: l10.bagsCategoryLabel.toUpperCase(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.getWidth(8.0)),
            child: SizedBox(
              height: size.height * 0.68,
              child: GridView.count(
                mainAxisSpacing: Spacing.getWidth(30),
                crossAxisSpacing: Spacing.getHeight(15),
                crossAxisCount: 3,
                children: List.generate(bags.length - 1, (index) {
                  return GestureDetector(
                      onTap: onTapCategoryItem,
                      child: CategoryCard(
                        imagePath: "assets/images/bags/bags$index.jpg",
                        title: bags[index + 1],
                      ));
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
