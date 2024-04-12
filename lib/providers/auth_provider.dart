import 'package:flutter/material.dart';
import 'package:hotel/domain/services/auth_service.dart';
import 'package:hotel/data/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  UserModel? _user;

  UserModel? get user => _user;

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    UserModel? createdUser =
        await _authService.createUserWithEmailAndPassword(email, password);
    if (createdUser != null) {
      _user = createdUser;
      notifyListeners();
    }
  }
}
