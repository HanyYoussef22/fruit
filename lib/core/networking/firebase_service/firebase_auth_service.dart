import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit/core/networking/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUser(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        throw CustomException(message: 'User is null after successful sign-in.');
      }
      return user;
    } on FirebaseAuthException catch (e) {
      log("Exception in register fun in firebase auth : ${e.toString()}");
      if (e.code == 'weak-password') {
        throw CustomException(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            message: 'The account already exists for that email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'Please check your internet connection');
      } else {
        throw CustomException(
            message: 'An error occurred: ${e.message} and ${e.code}');
      }
    } catch (e) {
      log("Exception in register fun in firebase auth : ${e.toString()}  ");
      throw CustomException(message: 'An error occurred while registering');
    }
  }

  //Sining in with email and password
  //--------------------------------------------------------------------------

  Future<User> signIn({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final user = credential.user;
      if (user == null) {
        throw CustomException(message: 'User is null after successful sign-in.');
      }
      return user;
    } on FirebaseAuthException catch (e) {
      log("Exception in signIn fun in firebase auth : ${e.toString()}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'Please check your internet connection');
      } else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'Wrong password provided for that user.');
      } else {
        log("Exception in signIn fun in firebase auth : ${e.toString()}  ");
        throw CustomException(message: 'An error occurred: ${e.message}');
      }
    } catch (e) {
      log("Exception in signIn fun in firebase auth : ${e.toString()}  ");
      throw CustomException(message: 'An error occurred while signing in');
    }
  }


}
