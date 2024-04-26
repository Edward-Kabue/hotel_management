import 'package:cloud_firestore/cloud_firestore.dart';

class AdminService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> setAdmin(admin) async {
    try {
      await _firestore.collection('admins').doc('18').set(admin.toJson());
    } catch (e) {
      print('Error setting admin: $e');
    }
  }
}
