/*
* Developer: Abubakar Abdullahi
* Date: 04/02/2023
*/

import 'package:flutter/material.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({
    Key? key,
    required this.mainCategoryName,
    required this.subCategoryName,
    required this.onPressBack,
  }) : super(key: key);

  final String mainCategoryName;
  final String subCategoryName;

  final VoidCallback onPressBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: onPressBack,
            icon: const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,)
        ),
        title: Text(subCategoryName, style: const TextStyle(color: Colors.black,),),
      ),
      body: Center(
        child: Text(mainCategoryName),
      ),
    );
  }
}
