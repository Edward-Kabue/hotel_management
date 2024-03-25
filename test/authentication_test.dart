import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  group('User Login Tests', () {
    test('Login as Admin', () async {
      // Implement the login logic for admin user
      FirebaseAuth auth = FirebaseAuth.instance;
      String adminEmail = 'admin@example.com';
      String adminPassword = 'admin123';

      await auth.signInWithEmailAndPassword(
          email: adminEmail, password: adminPassword);

      // Add assertions to verify the login result
      expect(auth.currentUser, isNotNull);
    });

    test('Login as Client', () async {
      // Implement the login logic for client user
      FirebaseAuth auth = FirebaseAuth.instance;
      String clientEmail = 'admin@example.com';
      String clientPassword = 'admin123';
      await auth.signInWithEmailAndPassword(
          email: clientEmail, password: clientPassword);

      //Add assertions to verify the login result
      expect(auth.currentUser, isNotNull);
    });
  });
}
