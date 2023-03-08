/*
* Developer: Abubakar Abdullahi
* Date: 07/02/2023
*/

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase/src/firestore_service.dart';
import 'package:firebase/src/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

/// Wrapper around [FirebaseAuth].
class AuthenticationService {
  AuthenticationService({
    @visibleForTesting FirebaseAuth? auth,
    @visibleForTesting FirebaseFirestore? firestore,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  Future<String> getCurrentUid() async => _auth.currentUser!.uid;

  Future<bool> isSignedIn() async => _auth.currentUser?.uid != null;

  Future<void> signOut() async {
    return await _auth.signOut();
  }

  Future<FirebaseUserRM> anonymousAuth() async {
    try {
      await _auth.signInAnonymously();

      final user = _auth.currentUser;

      if (user != null) {
        final userRM =
            FirebaseUserRM(uid: user.uid, isAnonymous: user.isAnonymous);
        return userRM;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'operation-not-allowed') {
        throw OperationNotAllowedFirebaseException();
      } else {
        throw UnknownErrorFirebaseException();
      }
    }
    throw UnknownErrorFirebaseException();
  }

  Future<FirebaseUserRM> signInAmeraStore(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = _auth.currentUser;

      if (user != null) {
        final userRM = FirebaseUserRM(
          uid: user.uid,
          email: user.email,
          name: user.displayName,
          photoUrl: user.photoURL,
        );
        return userRM;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFoundFirebaseException();
      } else if (e.code == 'wrong-password') {
        throw WrongPasswordFirebaseException();
      }
      rethrow;
    }
    throw UnknownErrorFirebaseException();
  }

  Future<FirebaseUserRM> signUpAmeraStore(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final user = _auth.currentUser;

      if (user != null) {
        final userRM = FirebaseUserRM(
          uid: user.uid,
          email: user.email,
          name: user.displayName,
          photoUrl: user.photoURL,
        );
        return userRM;
      }
      //TODO: Create seller/customer account
      //     .then((value) async {
      //   if (value.user?.uid != null) {
      //     //TODO: Create seller/customer account
      //   }
      // });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordFirebaseException();
      } else if (e.code == 'email-already-in-use') {
        EmailAlreadyInUseFirebaseException();
      }
      rethrow;
    }
    throw UnknownErrorFirebaseException();
  }

  Future<FirebaseUserRM> signUpCustomer(CustomerInfoRM customer, profileImage) async {
    try {
      final newAuthUser = await _auth.createUserWithEmailAndPassword(
        email: customer.email,
        password: customer.password!,
      );

      final cid = await getCurrentUid();

      if (newAuthUser.user?.uid != null) {
        final user = await createCustomer(cid, customer, profileImage);

        final userRM = FirebaseUserRM(
          uid: user.uid,
          email: user.email,
          photoUrl: user.photoURL,
        );
        return userRM;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw WeakPasswordFirebaseException();
      } else if (e.code == 'email-already-in-use') {
        EmailAlreadyInUseFirebaseException();
      }
      rethrow;
    }
    throw UnknownErrorFirebaseException();
  }

  Future createCustomer(String userId, CustomerInfoRM customer, imageFile) async {
    final collection = _firestore.collection(FirebaseConstants.customers);

    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref('customer-images/${customer.email}.jpg');

    await ref.putFile(File(imageFile.path));
    var image = await ref.getDownloadURL();

    try {
      final data = await collection.doc(userId).get();
      final user = CustomerInfoRM(
        cid: userId,
        name: customer.name,
        email: customer.email,
        phone_number: customer.phone_number,
        address: customer.address,
        profile_image: image,
      ).toJson();

      if (!data.exists) {
        return collection.doc(userId).set(user);
      } else {
        return collection.doc(userId).update(user);
      }
    } catch (error) {
      throw UnknownErrorFirebaseException();
    }
  }




}
