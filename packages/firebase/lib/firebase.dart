import 'package:firebase_core/firebase_core.dart';

export 'src/models/models.dart';
export 'src/models/exceptions.dart';
export 'src/authentication_service.dart';

Future<void> initializeFirebasePackage() => Firebase.initializeApp();