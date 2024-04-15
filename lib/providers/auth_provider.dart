import 'package:flutter/material.dart';
import 'package:hotel/domain/services/auth_service.dart';
import 'package:hotel/domain/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;
  String? _errorMessage;

  UserModel? get user => _user;
  String? get errorMessage => _errorMessage; // Expose the error message

  Future<void> createUserWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    // Pass the context to the AuthService so it can show the dialog
    UserModel? createdUser = await _authService.createUserWithEmailAndPassword(
        context, email, password);
    if (createdUser != null) {
      _user = createdUser;
      _errorMessage = null; // Clear any previous error message
      notifyListeners();
    } else {
      // Assuming the AuthService returns null on error
      // Since the error is handled in the AuthService, you might not need to set an error message here
      // However, if you want to handle errors differently, you can do so here
      _errorMessage = "An error occurred while creating the user.";
      notifyListeners(); // Notify listeners to update the UI with the error message
    }
  }
}
