/*
* Developer: Abubakar Abdullahi
* Date: 02/02/2023
*/


import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class Spacing {

  static getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static getScreenHeight(){
    return Get.height;
  }

  static getScreenWidth(){
    return Get.width;
  }

  static getHeight(double pixels) {
    double x = getScreenHeight() / pixels;
    return getScreenHeight() / x;
  }

  static getWidth(double pixels) {
    double x = getScreenWidth() / pixels;
    return getScreenWidth() / x;
  }
}