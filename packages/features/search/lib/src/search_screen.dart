/*
* Developer: Abubakar Abdullahi
* Date: 03/02/2023
*/

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key, required this.onPressBack}) : super(key: key);

  final VoidCallback onPressBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const CupertinoSearchTextField(),
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black,),
            onPressed: onPressBack,
          )

      ),
    );
  }
}