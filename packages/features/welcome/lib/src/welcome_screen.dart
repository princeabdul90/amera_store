/*
* Developer: Abubakar Abdullahi
* Date: 06/02/2023
*/

import 'package:component_library/component_library.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:welcome/src/l10n/welcome_localization.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen(
      {Key? key,
      required this.onTappedSellerSignUp,
      required this.onTappedSellerLogin,
      required this.onTappedCustomerSignUp,
      required this.onTappedCustomerLogin,
      required this.onTappedGuestSignIn,
      required this.onTappedGoogleSignIn,
      required this.onTappedFacebookSignIn})
      : super(key: key);

  final VoidCallback onTappedSellerSignUp;
  final VoidCallback onTappedSellerLogin;
  final VoidCallback onTappedCustomerSignUp;
  final VoidCallback onTappedCustomerLogin;

  final VoidCallback onTappedGuestSignIn;
  final VoidCallback onTappedGoogleSignIn;
  final VoidCallback onTappedFacebookSignIn;

  @override
  Widget build(BuildContext context) {
    return  WelcomeView(
      onTappedSellerSignUp: onTappedSellerSignUp,
      onTappedSellerLogin:onTappedSellerLogin,
      onTappedCustomerSignUp: onTappedCustomerSignUp,
      onTappedCustomerLogin: onTappedCustomerLogin,
      onTappedGuestSignIn: onTappedGuestSignIn,
      onTappedGoogleSignIn: onTappedGoogleSignIn,
      onTappedFacebookSignIn: onTappedFacebookSignIn,

    );
  }
}

@visibleForTesting
class WelcomeView extends StatelessWidget {
  const WelcomeView({
    Key? key,
    required this.onTappedSellerSignUp,
    required this.onTappedSellerLogin,
    required this.onTappedCustomerSignUp,
    required this.onTappedCustomerLogin,
    required this.onTappedGuestSignIn,
    required this.onTappedGoogleSignIn,
    required this.onTappedFacebookSignIn,
  }) : super(key: key);

  final VoidCallback onTappedSellerSignUp;
  final VoidCallback onTappedSellerLogin;
  final VoidCallback onTappedCustomerSignUp;
  final VoidCallback onTappedCustomerLogin;

  final VoidCallback onTappedGuestSignIn;
  final VoidCallback onTappedGoogleSignIn;
  final VoidCallback onTappedFacebookSignIn;

  @override
  Widget build(BuildContext context) {
    final l10n = WelcomeScreenLocalizations.of(context);
    final size = Spacing.getSize(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "assets/images/inapp/bgimage.jpg",
                ),
                fit: BoxFit.cover)),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.welcomePageTitle.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
                const SizedBox(
                  height: 120,
                  width: 200,
                  child:
                      Image(image: AssetImage("assets/images/inapp/logo.jpg")),
                ),
                Text(
                  "Shop".toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              l10n.sellerTitle,
                              style: const TextStyle(
                                  color: Colors.yellow, fontSize: 25),
                            ),
                          ),
                        ),
                        const Gap(6),
                        Container(
                            height: 50,
                            width: size.width * 0.9,
                            decoration: const BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    bottomLeft: Radius.circular(25))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Image(
                                    image: AssetImage(
                                        "assets/images/inapp/logo.jpg")),
                                CustomButton(
                                  width: 0.25,
                                  onPressed: onTappedSellerLogin,
                                  color: Colors.yellowAccent,
                                  child: Text(
                                    l10n.sellerSignInButtonLabel,
                                    style: TextStyle(
                                      color: AppColorStyles.grayDarkColor,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 12.0),
                                  child: CustomButton(
                                    width: 0.25,
                                    onPressed: onTappedSellerSignUp,
                                    color: Colors.yellowAccent,
                                    child: Text(
                                      l10n.sellerSignUpButtonLabel,
                                      style: TextStyle(
                                        color: AppColorStyles.grayDarkColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        height: 50,
                        width: size.width * 0.9,
                        decoration: const BoxDecoration(
                            color: Colors.white38,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(50),
                                bottomRight: Radius.circular(50))),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: CustomButton(
                                width: 0.25,
                                onPressed: onTappedCustomerLogin,
                                color: Colors.yellowAccent,
                                child: Text(
                                  l10n.customerSignInButtonLabel,
                                  style: TextStyle(
                                    color: AppColorStyles.grayDarkColor,
                                  ),
                                ),

                              ),
                            ),
                            CustomButton(
                              width: 0.25,
                              onPressed: onTappedCustomerSignUp,
                              color: Colors.yellowAccent,
                              child: Text(
                                l10n.customerSignUpButtonLabel,
                                style: TextStyle(
                                  color: AppColorStyles.grayDarkColor,
                                ),
                              ),
                            ),
                            const Image(
                                image:
                                    AssetImage("assets/images/inapp/logo.jpg")),
                          ],
                        )),
                  ],
                ),
                Container(
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SocialIcon(
                            title: l10n.googleSignInLabel,
                            onTap: onTappedGoogleSignIn,
                            widget: const Image(
                                image: AssetImage(
                                    "assets/images/inapp/google.jpg")),
                            textColor: Colors.white,
                          ),
                          SocialIcon(
                            title: l10n.facebookSignInLabel,
                            onTap: onTappedFacebookSignIn,
                            widget: const Image(
                                image: AssetImage(
                                    "assets/images/inapp/facebook.jpg")),
                            textColor: Colors.white,
                          ),
                          SocialIcon(
                            title: l10n.guestSignInLabel,
                            onTap: onTappedGuestSignIn,
                            widget: Icon(
                              FluentIcons.person_16_filled,
                              size: 50,
                              color: AppColorStyles.greyPrimary,
                            ),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    )),
              ]),
        ),
      ),
    );
  }
}
