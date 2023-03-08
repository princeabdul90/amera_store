/*
* Developer: Abubakar Abdullahi
* Date: 07/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:flutter/material.dart';

 InputDecoration fieldStyle = InputDecoration(
    labelStyle: TextStyle(color: AppColorStyles.graySecondary,),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25)
    ),
    enabledBorder: OutlineInputBorder(
        borderSide:  BorderSide(color: AppColorStyles.graySecondary, width: 1),
        borderRadius: BorderRadius.circular(25)
    ),
    focusedBorder: OutlineInputBorder(
        borderSide:  BorderSide(
          color: AppColorStyles.graySecondary,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(25)
    )
);