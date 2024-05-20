// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hotel/domain/models/user_model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create user with email and password
  Future<UserModel?> createUserWithEmailAndPassword(
      BuildContext context,
      String email,
      String password,
      String displayName,
      int phoneNumber) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user;
      //debugPrint('user: $user');
      final userModel = UserModel(
        uid: userCredential.user!.uid,
        email: userCredential.user!.email ?? '',
        displayName: displayName,
        phoneNumber: phoneNumber,
      );
      // Create a new user document in Firestore
      try {
        await _firestore
            .collection('users')
            .doc(user!.uid)
            .set(userModel.toJson());
        debugPrint('done');
      } catch (e) {
        // Handle Firestore error
        debugPrint('Error creating user document: $e');
        rethrow;
      }
      return UserModel(
        uid: user.uid,
        email: user.email ?? '',
        displayName: displayName,
        phoneNumber: phoneNumber,
      );
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthException errors
      String errorMessage = '';
      switch (e.code) {
        case 'weak-password':
          errorMessage = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          errorMessage = 'The account already exists for that email.';
          break;
        default:
          errorMessage = 'An error occurred while creating the user.';
      }
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: errorMessage,
        btnOkOnPress: () {},
      ).show();
      return null;
    }
  }

  // Sign in with email and password
  Future<UserModel?> signInWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      User? user = userCredential.user;
      String uid = user?.uid ?? '';
      String userEmail = user?.email ?? '';
      String displayName = user?.displayName ?? '';
      int phoneNumber = (user?.phoneNumber ?? 0) as int;

      // Regular user flow
      return UserModel(
        uid: uid,
        email: userEmail,
        displayName: displayName,
        phoneNumber: phoneNumber,
      );
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthException errors
      String errorMessage = '';
      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No user found with that email.';
          break;
        case 'wrong-password':
          errorMessage = 'Wrong password provided for that user.';
          break;
        default:
          errorMessage = 'An error occurred while signing in.';
      }
      AwesomeDialog(
        context: context,
        dialogType: DialogType.info,
        animType: AnimType.rightSlide,
        title: 'Error',
        desc: errorMessage,
        btnOkOnPress: () {},
      ).show();
      return null;
    }
  }

  //sign out
  Future<UserModel?> signOut(BuildContext context) async {
    try {
      await _auth.signOut();
      return null;
    } catch (e) {
      debugPrint('Error signing out: $e');
      rethrow;
    }
  }
}
