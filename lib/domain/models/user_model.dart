enum UserRole { admin, user }

class UserModel {
  String uid;
  String email;
  String displayName;
  String? photoURL;
  int phoneNumber;

  UserModel(
      {required this.uid,
      required this.email,
      required this.displayName,
      this.photoURL,
      required this.phoneNumber});
//serialize data to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'phoneNumber': phoneNumber,
    };
  }

//Deserialize JSON data to object received from cloud firestore
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['id'],
      email: json['email'],
      displayName: json['displayName'],
      photoURL: json['photoURL'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
