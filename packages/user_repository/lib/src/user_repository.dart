/*
* Developer: Abubakar Abdullahi
* Date: 08/02/2023
*/

import 'package:domain_models/domain_models.dart';
import 'package:firebase/firebase.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:user_repository/src/mappers/remote_to_domain.dart';
import 'package:user_repository/src/user_secure_storage.dart';

class UserRepository {
  UserRepository({
    required this.dataSource,
    @visibleForTesting UserSecureStorage? secureStorage,
  }) : _secureStorage = secureStorage ?? const UserSecureStorage();

  final AuthenticationService dataSource;
  final UserSecureStorage _secureStorage;
  final BehaviorSubject<Customer?> _customerSubject = BehaviorSubject();
  final BehaviorSubject<Customer?> _sellerSubject = BehaviorSubject();


  Future<void> signInCustomer(String email, String password) async {
    try {
      final firebaseUser = await dataSource.signInAmeraStore(email, password);
      await _secureStorage.upsertUserInfo(
        userId: firebaseUser.uid,
        name: firebaseUser.name,
        email: firebaseUser.email,
        userType: 'customer',
      );

      print(firebaseUser.uid);
      print(firebaseUser.email);
      print(_secureStorage.getUserId());
      print(_secureStorage.getUserId.toString());

      final domainCustomerUser = firebaseUser.toCustomerDomainModel();
      print(domainCustomerUser.cid);
      print(domainCustomerUser.email);

      _customerSubject.add(domainCustomerUser);

    } catch (error) {
      if (error is UserNotFoundFirebaseException) {
        throw UserNotFoundException();
      } else if (error is WrongPasswordFirebaseException) {
        throw WrongPasswordException();
      } else if (error is UnknownErrorFirebaseException) {
        throw UnknownErrorException();
      }
      rethrow;
    }
  }

  Future<void> signUpCustomer(String email, String password) async {
    try {
      final firebaseUser = await dataSource.signUpAmeraStore(email, password);
      await _secureStorage.upsertUserInfo(
        userId: firebaseUser.uid,
        name: firebaseUser.name,
        email: firebaseUser.email,
        userType: 'customer',
      );

      final domainCustomerUser = firebaseUser.toCustomerDomainModel();
      print(domainCustomerUser.cid);
      print(domainCustomerUser.email);

      _customerSubject.add(domainCustomerUser);

    } catch (error) {
      if (error is EmailAlreadyInUseFirebaseException) {
        throw EmailAlreadyInUseFirebaseException();
      } else if (error is WeakPasswordFirebaseException) {
        throw WeakPasswordException();
      } else if (error is UnknownErrorFirebaseException) {
        throw UnknownErrorException();
      }
      rethrow;
    }
  }

  Future<void> anonymousSignIn() async {
    try {
      final firebaseUser = await dataSource.anonymousAuth();
      final local = await _secureStorage.upsertUserInfo(
        userId: firebaseUser.uid,
      );
      print(_secureStorage.getUserId.toString());

    } catch (error) {
      if (error is OperationNotAllowedFirebaseException) {
        throw OperationNotAllowedException();
      } else if (error is UnknownErrorFirebaseException) {
        throw UnknownErrorException();
      }
      rethrow;
    }
  }

  Future<void> signOut() async {
    await dataSource.signOut();
    if (_secureStorage.getUserType.toString() == 'customer') {
      await _secureStorage.deleteUserInfo();
      _customerSubject.add(null);
    } else {
      await _secureStorage.deleteUserInfo();
      _sellerSubject.add(null);
    }
  }

  Stream<Customer?> getUser() async* {
    if(!_customerSubject.hasValue) {
      final userInfo = await Future.wait([
        _secureStorage.getUserId(),
        _secureStorage.getUserEmail(),
        _secureStorage.getUserType(),
      ]);
      final id = userInfo[0];
      final email = userInfo[1];
      final userType = userInfo[2];

      if(id != null && email != null ) {
        _customerSubject.add(
          Customer(cid: id, email: email, name: userType),
        );
      }else {
        _customerSubject.add(null);
      }

    }

    yield* _customerSubject.stream;
  }

  Future<Customer?> getCustomer() async {
    if(!_customerSubject.hasValue) {
      final userInfo = await Future.wait([
        _secureStorage.getUserId(),
        _secureStorage.getUserEmail(),
        _secureStorage.getUserType(),
      ]);
      final id = userInfo[0];
      final email = userInfo[1];
      final userType = userInfo[2];

      if(id != null && email != null ) {
         _customerSubject.add(
          Customer(cid: id, email: email, name: userType),
        );
      }else {
         _customerSubject.add(null);
      }
      return null;
    }

  }

  Future<String?> getUserId() {
    return _secureStorage.getUserId();
  }


}
