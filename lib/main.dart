import 'package:amera_store/l10n/app_localizations.dart';
import 'package:amera_store/routing_table.dart';
import 'package:category/category.dart';
import 'package:component_library/component_library.dart';
import 'package:dashboard/dashboard.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:home/home.dart';
import 'package:routemaster/routemaster.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:seller_sign_in/seller_sign_in.dart';
import 'package:seller_sign_up/seller_sign_up.dart';
import 'package:sign_in/sign_in.dart';
import 'package:sign_up/sign_up.dart';
import 'package:upload/upload.dart';
import 'package:user_repository/user_repository.dart';
import 'package:welcome/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebasePackage();

  runApp(const AmeraApp());
}

class AmeraApp extends StatefulWidget {
  const AmeraApp({super.key});

  @override
  State<AmeraApp> createState() => _AmeraAppState();
}

class _AmeraAppState extends State<AmeraApp> {
  // This widget is the root of your application.

  final _firebaseService = AuthenticationService();

  late final _userRepository = UserRepository(dataSource: _firebaseService);

  late final dynamic _routerDelegate = RoutemasterDelegate(
    routesBuilder: (context) {
      return RouteMap(
        routes: buildRoutingTable(
          routerDelegate: _routerDelegate,
          userRepository: _userRepository,
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Amera Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      supportedLocales: const [
        Locale("en", ''),
      ],
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        AppLocalizations.delegate,
        ComponentLibraryLocalizations.delegate,
        SignUpLocalizations.delegate,
        SignInLocalizations.delegate,
        SellerSignInLocalizations.delegate,
        SellerSignUpLocalizations.delegate,
        WelcomeScreenLocalizations.delegate,
        HomeScreenLocalizations.delegate,
        CategoryScreenLocalizations.delegate,
        DashboardScreenLocalizations.delegate,
        UploadScreenLocalizations.delegate,
      ],
      routerDelegate: _routerDelegate,
      routeInformationParser: const RoutemasterParser(),
    );
  }
}
