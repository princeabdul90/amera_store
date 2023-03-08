/*
* Developer: Abubakar Abdullahi
* Date: 06/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:upload/upload.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({Key? key, required this.onTappedLogout}) : super(key: key);

  final VoidCallback onTappedLogout;

  @override
  Widget build(BuildContext context) {
    return UploadView(onTappedLogout: onTappedLogout,);
  }
}


@visibleForTesting
class UploadView extends StatelessWidget {
  const UploadView({Key? key, required this.onTappedLogout}) : super(key: key);

  final VoidCallback onTappedLogout;

  @override
  Widget build(BuildContext context) {
    final l10n = UploadScreenLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColorStyles.whiteColor,
        centerTitle: true,
        title:  AppBarTitle(title: l10n.pageTitle,),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0, ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: IconButton(
                    onPressed: onTappedLogout,
                    icon:  Icon(FluentIcons.arrow_exit_20_regular, color: AppColorStyles.grayDarkColor,),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text("Logout", style: TextStyle( fontSize: 12, color: AppColorStyles.grayDarkColor,),),
                )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        child: Text("Upload"),
      ),
    );
  }
}
