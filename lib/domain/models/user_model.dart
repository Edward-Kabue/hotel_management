enum UserRole { admin, user }

class UserModel {
  String uid;
  String email;
  String displayName;
  String? photoURL;
 

  UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
    this.photoURL,
   
  });
//serialize data to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
    
    };
  }

//Deserialize JSON data to object received from cloud firestore
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['id'],
      email: json['email'],
      displayName: json['displayName'],
      photoURL: json['photoURL'],
  
    );
  }
}
