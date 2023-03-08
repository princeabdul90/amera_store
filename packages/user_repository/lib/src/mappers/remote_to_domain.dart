/*
* Developer: Abubakar Abdullahi
* Date: 09/02/2023
*/

import 'package:domain_models/domain_models.dart';
import 'package:firebase/firebase.dart';

extension UserCustomerRMToDomain on FirebaseUserRM {
  Customer toCustomerDomainModel() {
    return Customer(
      cid: uid,
      email: email,
      name: name,
      profile_image: photoUrl,
    );
  }
}

extension UserSellerRMToDomain on FirebaseUserRM {
  Seller toSellerDomainModel() {
    return Seller(
      sid: uid,
      email: email,
      company_name: name,
      image_url: photoUrl,
    );
  }
}
