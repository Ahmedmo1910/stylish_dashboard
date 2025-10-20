import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stylish_dashboard/core/errors/exceptions.dart';


class FireBaseAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future deleteUser() async {
    FirebaseAuth.instance.currentUser!.delete();
  }


  Future<User> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log('[Login Error] ${e.code}: ${e.message}');
      switch (e.code) {
        case 'user-not-found':
        case 'wrong-password':
          throw CustomException(message: 'Invalid email or password.');
        case 'invalid-email':
          throw CustomException(message: 'The email address is not valid.');
        case 'network-request-failed':
          throw CustomException(message: 'Network error. Please try again.');
        default:
          throw CustomException(message: 'An unknown error occurred');
      }
    } catch (e) {
      log('[Login Unknown Error]: $e');
      throw CustomException(message: 'An unknown error occurred: $e');
    }
  }


  bool isLoggedIn() {
    return FirebaseAuth.instance.currentUser != null;
  }
}
