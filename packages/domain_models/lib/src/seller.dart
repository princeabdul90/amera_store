/*
* Developer: Abubakar Abdullahi
* Date: 08/02/2023
*/

class Seller {
  Seller({
    required this.sid,
    this.email,
    this.logo,
    this.address,
    this.phone,
    this.company_name,
    this.cover_photo,
    this.image_url
  });

  final String sid;
  final String? email;
  final String? logo;
  final String? address;
  final String? phone;
  final String? company_name;
  final String? cover_photo;
  final String? image_url;
}
