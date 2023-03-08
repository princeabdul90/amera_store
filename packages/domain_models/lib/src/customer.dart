/*
* Developer: Abubakar Abdullahi
* Date: 08/02/2023
*/

class Customer {
  Customer({
    required this.cid,
    required this.email,
    this.name,
    this.address,
    this.profile_image,
    this.phone_number,
  });

  final String cid;
  final String? email;
  final String? name;
  final String? address;
  final String? profile_image;
  final String? phone_number;
}
