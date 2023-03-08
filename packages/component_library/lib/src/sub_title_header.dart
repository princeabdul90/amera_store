/*
* Developer: Abubakar Abdullahi
* Date: 05/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SubTitleHeader extends StatelessWidget {
  const SubTitleHeader({Key? key, required this.title, this.fontsize = 24})
      : super(key: key);
  final String title;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Spacing.getHeight(40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: Spacing.getHeight(40),
            width: Spacing.getWidth(50),
            child: Divider(
              thickness: 1,
              color: AppColorStyles.graySecondary,
            ),
          ),
          Gap(Spacing.getWidth(5)),
          Text(
            title,
            style: TextStyle(
                color: AppColorStyles.graySecondary,
                fontSize: Spacing.getHeight(fontsize),
                fontWeight: FontWeight.w600),
          ),
          Gap(Spacing.getWidth(5)),
          SizedBox(
            height: Spacing.getHeight(40),
            width: Spacing.getWidth(50),
            child: Divider(
              thickness: 1,
              color: AppColorStyles.graySecondary,
            ),
          ),
        ],
      ),
    );
  }
}
