import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel/domain/models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

// Create user with email and password
  Future<UserModel?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      return UserModel(uid: user?.uid, email: user?.email);
    } catch (e) {
      print('Error creating user: $e');
      return null;
    }
  }
}
