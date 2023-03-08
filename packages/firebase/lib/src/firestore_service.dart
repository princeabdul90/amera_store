/*
* Developer: Abubakar Abdullahi
* Date: 16/02/2023
*/

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase/firebase.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';



/// Wrapper around [FirebaseFirestore].
class FirestoreService {
   FirestoreService({
    @visibleForTesting FirebaseFirestore? firestore,
}) : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;


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

      if(!data.exists){
        return collection.doc(userId).set(user);
      }else{
        return collection.doc(userId).update(user);
      }
    }catch (error) {
      throw UnknownErrorFirebaseException();
    }

  }

}






class FirebaseConstants {
  static const String customers     = "customers";
  static const String sellers       = "sellers";
  static const String products      = "products";
  static const String categories    = "categories";
  static const String subcategories = "sub_categories";
}