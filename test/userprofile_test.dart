import 'package:flutter_test/flutter_test.dart';
import 'package:hotel/user_profile.dart';

void main() {
  test('Test user profile modification', () {
    // Create a user profile instance
    UserProfile userProfile = UserProfile();

    // Log in the user
    userProfile.login();

    // Modify the user profile
    userProfile.modifyProfile();

    // Assert that the user profile has been modified
    expect(userProfile.isProfileModified, true);
  });
}
