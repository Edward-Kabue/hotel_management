import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel/domain/models/user_model.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getCurrentUser() async {
    // Assuming you have a 'users' collection in Firestore
    QuerySnapshot querySnapshot =
        await _firestore.collection('users').limit(1).get();

    if (querySnapshot.docs.isNotEmpty) {
      DocumentSnapshot userDoc = querySnapshot.docs.first;
      return UserModel.fromJson(userDoc.data() as Map<String, dynamic>);
    }

    throw Exception('User not found');
  }

  Future<void> setAdmin(users) async {
    // Add dummy data
    for (UserModel user in users) {
      await _firestore.collection('hotels').add(user.toJson());
    }
  }
}
