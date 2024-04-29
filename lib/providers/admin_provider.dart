import 'package:flutter/material.dart';
import 'package:hotel/domain/services/admin_service.dart';

import '../domain/models/admin_model.dart';

class AdminProvider extends ChangeNotifier {
  final AdminService _adminService = AdminService();
  AdminModel? _user;
  String? _errorMessage;
  AdminModel? get user => _user;
  String? get errorMessage => _errorMessage;
  Future setAdmin(admin) async {
    await _adminService.setAdmin(admin);
  }

  Future signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    AdminModel? createdUser = await _adminService.signInWithEmailAndPassword(
        context, AdminModel(email: email, password: password));
    //debugPrint('createdUser: $createdUser');
    if (createdUser != null) {
      _user = createdUser;
      _errorMessage = null;
      notifyListeners();
    } else {
      _errorMessage = "An error occurred while creating the user.";
      notifyListeners();
    }
  }
}
