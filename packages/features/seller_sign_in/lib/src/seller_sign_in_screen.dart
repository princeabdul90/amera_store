/*
* Developer: Abubakar Abdullahi
* Date: 07/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seller_sign_in/seller_sign_in.dart';

class SellerSignInScreen extends StatelessWidget {
  const SellerSignInScreen(
      {Key? key,
      required this.onTapSignIn,
      required this.onTapSignUp,
      required this.onTapForgotPassword})
      : super(key: key);

  final VoidCallback onTapSignIn;
  final VoidCallback onTapSignUp;
  final VoidCallback onTapForgotPassword;

  @override
  Widget build(BuildContext context) {
    return SellerSignInView(
      onTapSignIn: onTapSignIn,
      onTapSignUp: onTapSignUp,
      onTapForgotPassword: onTapForgotPassword,
    );
  }
}

@visibleForTesting
class SellerSignInView extends StatelessWidget {
  const SellerSignInView(
      {Key? key,
      required this.onTapSignIn,
      required this.onTapSignUp,
      required this.onTapForgotPassword})
      : super(key: key);

  final VoidCallback onTapSignIn;
  final VoidCallback onTapSignUp;
  final VoidCallback onTapForgotPassword;

  @override
  Widget build(BuildContext context) {
    final l10n = SellerSignInLocalizations.of(context);
    return Scaffold(
      backgroundColor: AppColorStyles.greyPrimary,
      body: SingleChildScrollView(
        reverse: true,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Padding(
          padding: const EdgeInsets.all(
            8.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Gap(Spacing.getHeight(150)),
              Text(
                l10n.appBarTitle,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              Gap(Spacing.getHeight(50)),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: fieldStyle.copyWith(
                  labelText: l10n.emailTextFieldLabel,
                  prefixIcon: Icon(
                    FluentIcons.mention_16_regular,
                    color: AppColorStyles.grayDarkColor,
                  ),
                ),
              ),
              Gap(Spacing.getHeight(10)),
              TextField(
                obscureText: true,
                textInputAction: TextInputAction.next,
                decoration: fieldStyle.copyWith(
                  labelText: l10n.passwordTextFieldLabel,
                  prefixIcon: Icon(
                    FluentIcons.password_16_regular,
                    color: AppColorStyles.grayDarkColor,
                  ),
                  suffixIcon: Icon(
                    FluentIcons.eye_off_16_regular,
                    color: AppColorStyles.grayDarkColor,
                  ),
                ),
              ),
              TextButton(
                onPressed: onTapForgotPassword,
                child: Text(l10n.forgotMyPasswordButtonLabel),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(l10n.signUpOpeningText),
                  TextButton(
                      onPressed: onTapSignUp,
                      child: Text(l10n.signUpButtonLabel))
                ],
              ),
              Gap(Spacing.getHeight(5)),
              CustomButton(
                width: 0.70,
                height: 45,
                color: AppColorStyles.accentIndigoColor,
                onPressed: onTapSignIn,
                child: Text(
                  l10n.signUpButtonLabel,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColorStyles.whiteColor,
                  ),
                ),
              ),
              Gap(Spacing.getHeight(10)),
            ],
          ),
        ),
      ),
    );
  }
}
