/*
* Developer: Abubakar Abdullahi
* Date: 02/02/2023
*/


import 'package:amera_store/seller_tab_container_screen.dart';
import 'package:cart/cart.dart';
import 'package:category/category.dart';
import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:profile/profile.dart';
import 'package:routemaster/routemaster.dart';
import 'package:amera_store/tab_container_screen.dart';
import 'package:home/home.dart';
import 'package:search/search.dart';
import 'package:seller_sign_in/seller_sign_in.dart';
import 'package:seller_sign_up/seller_sign_up.dart';
import 'package:sign_in/sign_in.dart';
import 'package:sign_up/sign_up.dart';
import 'package:store/store.dart';
import 'package:sub_category/sub_category.dart';
import 'package:upload/upload.dart';
import 'package:user_repository/user_repository.dart';
import 'package:welcome/welcome.dart';

Map<String, PageBuilder> buildRoutingTable({
  required RoutemasterDelegate routerDelegate,
  required UserRepository userRepository
}) {
  return {
    /*------------------------------------------*/
    // Welcome Screen
    _PathConstants.rootPath: (_) {
      return MaterialPage(
        name: 'welcome',
        child: WelcomeScreen(
          /*----- Seller SignUp Button ----*/
          onTappedSellerSignUp: () {
            routerDelegate.push(_PathConstants.sellerSignUpPath);
          },
          /*----- Seller SignIn Button ----*/
          onTappedSellerLogin: () {
            routerDelegate.push(_PathConstants.sellerSignInPath);
          },
          /*----- Customer SignUp Button ----*/
          onTappedCustomerSignUp: () {
            routerDelegate.push(_PathConstants.signUpPath);
          },
          /*----- Customer SignIn Button ----*/
          onTappedCustomerLogin: () {
            routerDelegate.replace(_PathConstants.signInPath);
          },
          /*----- SignIn Guest Button ----*/
          onTappedGuestSignIn: () {
            userRepository.anonymousSignIn();
          },

          /*----- SignIn Google Button ----*/
          onTappedGoogleSignIn: () {},

          /*----- SignIn Facebook Button ----*/
          onTappedFacebookSignIn: () {},
        ),
      );
    },
    /*---- Welcome Screen Ends   ----*/

    /* ---------------------------------------------
    *  ============= CUSTOMERS ROUTE PATHS ===========
    * ----------------------------------------------*/

    /*----    NAVIGATION TABS   ----*/
    // Customer Path
    _PathConstants.customerPath: (_) => CupertinoTabPage(
          child: const TabContainerScreen(),
          paths: [
            _PathConstants.homeScreenPath,
            _PathConstants.categoryScreenPath,
            _PathConstants.storeScreenPath,
            _PathConstants.cartScreenPath,
            _PathConstants.profileScreenPath,
          ],
        ),

    // Sign Up Screen
    _PathConstants.signUpPath: (_) {
      return MaterialPage(
        name: 'sign-up',
        child: SignUpScreen(
          onTapSignIn: () {
            routerDelegate.replace(_PathConstants.signInPath);
          },
          onTapSignUp: () {
            routerDelegate.replace(_PathConstants.signInPath);
          },
          userRepository: userRepository,
        ),
      );
    },
    // Sign In Screen
    _PathConstants.signInPath: (_) {
      return MaterialPage(
        name: 'sign-in',
        fullscreenDialog: true,
        child: Builder (
          builder: (context) {
            return  SignInScreen(
              userRepository: userRepository,
              onTapSignIn: () {
                //routerDelegate.pop();
                routerDelegate.replace(_PathConstants.customerPath);
              },
              onTapSignUp: () {
                routerDelegate.replace(_PathConstants.signUpPath);
              },
              onTapForgotPassword: () {},

            );
          },
        ),
      );
    },

    // Search Screen
    _PathConstants.searchScreenPath: (_) {
      return MaterialPage(
          name: 'search',
          child: SearchScreen(
            onPressBack: () {
              routerDelegate.pop();
            },
          ));
    },
    // Home Screen
    _PathConstants.homeScreenPath: (_) {
      return MaterialPage(
          name: 'home',
          child: HomeScreen(
            onTapSearch: () {
              routerDelegate.push(_PathConstants.searchScreenPath);
            },
          ));
    },
    // Category Screen
    _PathConstants.categoryScreenPath: (_) {
      return MaterialPage(
        name: 'category',
        child: CategoryScreen(
          onTapSearch: () {
            routerDelegate.push(_PathConstants.searchScreenPath);
          },
          onTapCategoryItem: () {
            routerDelegate.push(_PathConstants.subCategoryScreenPath);
          },
        ),
      );
    },
    // Sub Category Screen
    _PathConstants.subCategoryScreenPath: (_) {
      return MaterialPage(
        name: 'sub-category',
        child: SubCategoryScreen(
          mainCategoryName: 'Sub Category Title',
          subCategoryName: 'Sub Category',
          onPressBack: () {
            routerDelegate.pop();
          },
        ),
      );
    },
    // Store Screen
    _PathConstants.storeScreenPath: (_) {
      return const MaterialPage(name: 'store', child: StoreScreen());
    },
    // Cart Screen
    _PathConstants.cartScreenPath: (_) {
      return MaterialPage(
          name: 'cart',
          child: CartScreen(
            onPressedContinueShopping: () {
              routerDelegate.push(_PathConstants.homeScreenPath);
            },
          ));
    },
    // Profile Screen
    _PathConstants.profileScreenPath: (_) {
      return MaterialPage(
          name: 'profile',
          child: ProfileScreen(
            userRepository: userRepository,
            onTapCart: () {
              routerDelegate.push(_PathConstants.cartScreenPath);
            },
            onTapOrder: () {},
            onTapWishlist: () {},
            onTapEdit: () {},
            onTapPasswordChange: () {},
            onTapLogout: () {
              routerDelegate.replace(_PathConstants.rootPath);
              //routerDelegate.push(_PathConstants.rootPath);
            },
          ));
    },

    /* ---------------------------------------------
    *  ============= SELLERS ROUTE PATHS ===========
    * ----------------------------------------------*/

    /*----    NAVIGATION TABS   ----*/
    // Seller Path
    _PathConstants.sellerPath: (_) => CupertinoTabPage(
          child: const SellerTabContainerScreen(),
          paths: [
            _PathConstants.homeScreenPath,
            _PathConstants.categoryScreenPath,
            _PathConstants.storeScreenPath,
            _PathConstants.dashboardScreenPath,
            _PathConstants.uploadScreenPath,
          ],
        ),

    // Sign Up Screen
    _PathConstants.sellerSignUpPath: (_) {
      return MaterialPage(
        name: 'seller-sign-up',
        child: SellerSignUpScreen(
          onTapSignIn: () {
            routerDelegate.replace(_PathConstants.sellerSignInPath);
          },
          onTapSignUp: () {
            routerDelegate.replace(_PathConstants.sellerPath);
          },
        ),
      );
    },
    // Sign Up Screen
    _PathConstants.sellerSignInPath: (_) {
      return MaterialPage(
        name: 'seller-sign-in',
        child: SellerSignInScreen(
          onTapSignIn: () {
            routerDelegate.replace(_PathConstants.sellerPath);
          },
          onTapSignUp: () {
            routerDelegate.replace(_PathConstants.sellerSignUpPath);
          },
          onTapForgotPassword: () {},
        ),
      );
    },

    // Dashboard Screen
    _PathConstants.dashboardScreenPath: (_) {
      return MaterialPage(
        name: 'dashboard',
        child: DashboardScreen(
          onTappedLogout: () {
            routerDelegate.replace(_PathConstants.rootPath);
          },
        ),
      );
    },
    // Upload Screen
    _PathConstants.uploadScreenPath: (_) {
      return MaterialPage(
        name: 'upload',
        child: UploadScreen(
          onTappedLogout: () {
            routerDelegate.replace(_PathConstants.rootPath);
          },
        ),
      );
    },
    // Search Screen
    _PathConstants.sellerSearchScreenPath: (_) {
      return MaterialPage(
          name: 'search',
          child: SearchScreen(
            onPressBack: () {
              routerDelegate.pop();
            },
          ));
    },
    // Home Screen
    _PathConstants.sellerHomeScreenPath: (_) {
      return MaterialPage(
          name: 'home',
          child: HomeScreen(
            onTapSearch: () {
              routerDelegate.push(_PathConstants.searchScreenPath);
            },
          ));
    },
    // Category Screen
    _PathConstants.sellerCategoryScreenPath: (_) {
      return MaterialPage(
        name: 'category',
        child: CategoryScreen(
          onTapSearch: () {
            routerDelegate.push(_PathConstants.searchScreenPath);
          },
          onTapCategoryItem: () {
            routerDelegate.push(_PathConstants.subCategoryScreenPath);
          },
        ),
      );
    },
    // Store Screen
    _PathConstants.sellerStoreScreenPath: (_) {
      return const MaterialPage(name: 'store', child: StoreScreen());
    },
  };
}

class _PathConstants {
  const _PathConstants._();

  static String get rootPath => '/';

  static String get signInPath => '${rootPath}sign-in';

  static String get signUpPath => '${rootPath}sign-up';

  static String get customerPath => '${rootPath}customer';

  static String get homeScreenPath => '$customerPath/home';

  static String get searchScreenPath => '$customerPath/search';

  static String get categoryScreenPath => '$customerPath/category';

  static String get storeScreenPath => '$customerPath/store';

  static String get cartScreenPath => '$customerPath/cart';

  static String get profileScreenPath => '$customerPath/profile';

  static String get subCategoryScreenPath => '$categoryScreenPath/sub-category';

  /* ---------------------------------------------
    *  ============= SELLERS ROUTE PATHS ===========
    * ----------------------------------------------*/

  static String get sellerSignInPath => '${rootPath}seller-sign-in';

  static String get sellerSignUpPath => '${rootPath}seller-sign-up';

  static String get sellerPath => '${rootPath}seller';

  static String get sellerHomeScreenPath => '$sellerPath/home';

  static String get sellerSearchScreenPath => '$sellerPath/search';

  static String get sellerCategoryScreenPath => '$sellerPath/category';

  static String get sellerStoreScreenPath => '$sellerPath/store';

  static String get dashboardScreenPath => '$sellerPath/dashboard';

  static String get uploadScreenPath => '$sellerPath/upload';
}
