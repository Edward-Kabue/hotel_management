import 'package:flutter/material.dart';
import 'package:hotel/domain/services/auth_service.dart';
import 'package:hotel/domain/models/user_model.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _authService = AuthService();
  late final UserModel _user;
  String? _errorMessage;
  bool _isLoggedIn = false;

  UserModel? get user => _user;
  String? get errorMessage => _errorMessage;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> createUserWithEmailAndPassword(
      BuildContext context,
      String email,
      String password,
      String displayName,
      int phoneNumber) async {
    UserModel? createdUser = await _authService.createUserWithEmailAndPassword(
        context, email, password, displayName, phoneNumber);
    if (createdUser != null) {
      _user = createdUser;
      _errorMessage = null;
      _isLoggedIn = true;
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
      _isLoggedIn = true;
      notifyListeners();
    } else {
      _errorMessage = "An error occurred while signing in.";
      notifyListeners();
    }
  }

  Future signOut(BuildContext context) async {
    await _authService.signOut(context);
    // ignore: use_build_context_synchronously
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    _isLoggedIn = false;
    notifyListeners();
  }
}
