/*
* Developer: Abubakar Abdullahi
* Date: 09/02/2023
*/

class FirebaseUserRM {
  const FirebaseUserRM( {
    required this.uid,
    this.email,
    this.name,
    this.photoUrl,
    this.isAnonymous,
  });


  final String uid;
  final String? email;
  final String? name;
  final String? photoUrl;
  final bool? isAnonymous;
}