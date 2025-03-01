import 'dart:convert';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit/core/helpers/constants.dart';
import 'package:fruit/core/networking/exceptions.dart';
import 'package:fruit/core/networking/firebase_service/firebase_store_service.dart';
import 'package:fruit/features/auth/data/models/user_model.dart';
import '../../../../core/helpers/shared_perfrance_helper.dart';
import '../../../../core/networking/fir_result.dart';
import '../../../../core/networking/firebase_service/firebase_auth_service.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/repos/repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService _firebaseAuthService;
  final FirebaseStoreService _firebasrStoreService;

  AuthRepoImpl(this._firebaseAuthService, this._firebasrStoreService);

  @override
  Future<FirResult<UserEntity>> register(
      {required String name,
      required String email,
      required String password}) async {
    User? response;
    try {
      response = await _firebaseAuthService.createUser(
          email: email, password: password);
      //add data to firestore
      await addUserData(
          user: UserModel(uid: response.uid, name: name, email: email));
      return FirResult.success(UserModel.fromFirebaseUser(response));
    } on CustomException catch (e) {
      if (response != null) {
        await response.delete();
      }
      return FirResult.failure(e.message);
    } catch (e) {
      if (response != null) {
        await response.delete();
      }
      log("Exception in register fun in auth repo : ${e.toString()}");

      return FirResult.failure("An error occurred. Please try again later.");
    }
  }

  @override
  Future<FirResult<UserEntity>> login(
      {required String email, required String password}) async {
    try {
      final response =
          await _firebaseAuthService.signIn(email: email, password: password);
      var user = await getUserData(docId: response.uid);
      await saveUser(user: user);
      return FirResult.success(user);
    } on CustomException catch (e) {
      return FirResult.failure(e.message);
    } catch (e) {
      log("Exception in login fun in auth repo : ${e.toString()}");

      return FirResult.failure("An error occurred. Please try again later.");
    }
  }

  @override
  Future<FirResult<UserEntity>> googleLogin() async {
    User? user;
    try {
      user = await _firebaseAuthService.signInWithGoogle();
      var UserData = UserModel.fromFirebaseUser(user);
      final userExist = await _firebasrStoreService.checkIfDataExist(path: BackendEndpoint.checkIfDataExist, docId: user.uid);
      await saveUser(user: UserData);
      if (userExist) {
        await getUserData(docId: user.uid);
      }else{
        await addUserData(user: UserData);
      }
      return FirResult.success(UserData);
    } on CustomException catch (e) {
      if (user != null) {
        await user.delete();
      }
      return FirResult.failure(e.message);
    } catch (e) {
      log("Exception in googleLogin fun in auth repo : ${e.toString()}");

      return FirResult.failure("An error occurred. Please try again later.");
    }
  }

  @override
  Future<FirResult<UserEntity>> facebookLogin() async {
    User? user;
    try {
      final user = await _firebaseAuthService.signInWithFacebook();

      var UserData = UserModel.fromFirebaseUser(user);
      final userExist = await _firebasrStoreService.checkIfDataExist(path: BackendEndpoint.checkIfDataExist, docId: user.uid);

      // await saveUser(user: UserData);
      if (userExist) {
        await getUserData(docId: user.uid);
      }else{
        await addUserData(user: UserData);
      }
      return FirResult.success(UserData);
    } on CustomException catch (e) {
      if (user != null) {
        user.delete();
      }
      return FirResult.failure(e.message);
    } catch (e) {
      log("Exception in facebookLogin fun in auth repo : ${e.toString()}");

      return FirResult.failure("An error occurred. Please try again later.");
    }
  }

  @override
  Future addUserData({required UserModel user}) async {
    await _firebasrStoreService.addData(
        path: BackendEndpoint.addUserData, data: user.toMap(), docId: user.uid);
  }

  @override
  Future<UserModel> getUserData({required String docId}) async {
    var userData = await _firebasrStoreService.getData(
        path: BackendEndpoint.getUserData, docId: docId);
    return UserModel.fromJson(userData);
  }



  bool isUserLogin() {
    return _firebaseAuthService.isUserLoggedIn();
  }

  @override
  Future saveUser({required UserModel user}) async {
    var jsonData = jsonEncode(user.toMap());
    await SharedPrefHelper.setData(SharedPrefKeys.kUser, jsonData);
  }

}
