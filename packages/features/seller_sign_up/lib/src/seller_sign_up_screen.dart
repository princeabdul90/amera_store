/*
* Developer: Abubakar Abdullahi
* Date: 07/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:seller_sign_up/seller_sign_up.dart';

class SellerSignUpScreen extends StatelessWidget {
  const SellerSignUpScreen(
      {Key? key, required this.onTapSignIn, required this.onTapSignUp})
      : super(key: key);

  final VoidCallback onTapSignIn;
  final VoidCallback onTapSignUp;

  @override
  Widget build(BuildContext context) {
    return SellerSignUpView(
      onTapSignIn: onTapSignIn,
      onTapSignUp: onTapSignUp,
    );
  }
}

@visibleForTesting
class SellerSignUpView extends StatelessWidget {
  const SellerSignUpView(
      {Key? key, required this.onTapSignIn, required this.onTapSignUp})
      : super(key: key);

  final VoidCallback onTapSignIn;
  final VoidCallback onTapSignUp;

  @override
  Widget build(BuildContext context) {
    final l10n = SellerSignUpLocalizations.of(context);
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
              Gap(Spacing.getHeight(50)),
              Text(
                l10n.appBarTitle,
                style:
                    const TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              Gap(Spacing.getHeight(40)),
              CircleImage(
                radius: 45,
                child: Icon(
                  FluentIcons.person_20_filled,
                  size: 50,
                  color: AppColorStyles.graySecondary,
                ),
              ),
              Gap(Spacing.getHeight(20)),
              TextField(
                textInputAction: TextInputAction.next,
                decoration: fieldStyle.copyWith(
                  labelText: l10n.companynameTextFieldLabel,
                  prefixIcon: Icon(
                    FluentIcons.person_16_regular,
                    color: AppColorStyles.grayDarkColor,
                  ),
                ),
              ),
              Gap(Spacing.getHeight(10)),
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
              Gap(Spacing.getHeight(10)),
              TextField(
                obscureText: true,
                textInputAction: TextInputAction.next,
                decoration: fieldStyle.copyWith(
                  labelText: l10n.passwordConfirmationTextFieldLabel,
                  prefixIcon: Icon(
                    FluentIcons.password_16_regular,
                    color: AppColorStyles.grayDarkColor,
                  ),
                  suffixIcon: Icon(
                    FluentIcons.eye_16_regular,
                    color: AppColorStyles.grayDarkColor,
                  ),
                ),
              ),
              Gap(Spacing.getHeight(10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(l10n.signInOpeningText),
                  TextButton(
                      onPressed: onTapSignIn,
                      child: Text(l10n.signInButtonLabel))
                ],
              ),
              Gap(Spacing.getHeight(10)),
              CustomButton(
                width: 0.70,
                height: 45,
                color: AppColorStyles.accentIndigoColor,
                onPressed: onTapSignUp,
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
