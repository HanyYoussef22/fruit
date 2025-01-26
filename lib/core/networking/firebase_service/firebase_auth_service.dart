import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit/core/networking/exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';


class FirebaseAuthService {
  Future<User> createUser(
      {required String email, required String password}) async
  {
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
//delete user
  Future<void> deleteUser() async
  {
      await FirebaseAuth.instance.currentUser!.delete();

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
      log("Exception in signIn fun in firebase auth 1 : ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(message: 'No user found for that email.');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(message: 'Please check your internet connection');
      } else if (e.code == 'invalid-credential') {
        throw CustomException(message: 'Wrong password or email provided for that user.');
      }
      else if (e.code == 'wrong-password') {
        throw CustomException(
            message: 'Wrong password or email provided for that user.');
      } else {
        log("Exception in signIn fun in firebase auth : ${e.toString()}  ");
        throw CustomException(message: 'An error occurred: ${e.message}');
      }
    } catch (e) {
      log("Exception in signIn fun in firebase auth2 : ${e.toString()}  ");
      throw CustomException(message: 'An error occurred while signing in');
    }
  }

//sining in with google
  Future<User> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  //sing in with facebook

  Future<User> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return (await FirebaseAuth.instance.signInWithCredential(facebookAuthCredential)).user!;

  }
}
