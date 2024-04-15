import 'package:flutter/material.dart';
import 'package:hotel/domain/services/auth_service.dart';
import 'package:hotel/domain/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;
  String? _errorMessage;
  bool _isLoggedIn = false; // Add a boolean variable to track login status

  UserModel? get user => _user;
  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _isLoggedIn; // Expose the login status

  Future<void> createUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    UserModel? createdUser = await _authService.createUserWithEmailAndPassword(
        context, email, password);
    if (createdUser != null) {
      _user = createdUser;
      _errorMessage = null;
      _isLoggedIn = true; // Set isLoggedIn to true after successful sign up
      notifyListeners();
    } else {
      _errorMessage = "An error occurred while creating the user.";
      notifyListeners();
    }
  }

  Future<void> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    UserModel? signedInUser =
        await _authService.signInWithEmailAndPassword(context, email, password);
    if (signedInUser != null) {
      _user = signedInUser;
      _errorMessage = null;
      _isLoggedIn = true; // Set isLoggedIn to true after successful sign in
      notifyListeners();
    } else {
      _errorMessage = "An error occurred while signing in.";
      notifyListeners();
    }
  }
}
