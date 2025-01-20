import 'dart:developer';

import 'package:fruit/core/networking/exceptions.dart';
import 'package:fruit/features/auth/data/models/user_model.dart';
import '../../../../core/networking/fir_result.dart';
import '../../../../core/networking/firebase_service/firebase_auth_service.dart';
import '../../domain/entites/user_entity.dart';
import '../../domain/repos/repo.dart';

class AuthRepoImpl implements AuthRepo {
  final FirebaseAuthService _firebaseAuthService;

  AuthRepoImpl(this._firebaseAuthService);

  @override
  Future<FirResult<UserEntity>> register({required String name,required String email,required String password}) async {
    try {
      final response = await _firebaseAuthService.createUser(email: email, password: password);
      return FirResult.success(UserModel.fromFirebaseUser(response));
    } on CustomException catch (e) {
      return FirResult.failure(e.message);
    } catch (e) {
      log("Exception in register fun in auth repo : ${e.toString()}");

      return FirResult.failure("An error occurred. Please try again later.");
    }
  }

  @override
  Future<FirResult<UserEntity>> login({required String email, required String password})async {
    try{

      final  response =await _firebaseAuthService.signIn(email: email, password: password);
      return FirResult.success(UserModel.fromFirebaseUser(response));

    }on CustomException catch (e){
     return FirResult.failure(e.message);
    }catch (e){
      log("Exception in login fun in auth repo : ${e.toString()}");

      return FirResult.failure("An error occurred. Please try again later.");
    }


  }

  @override
  Future<FirResult<UserEntity>> googleLogin() async{
    try{
      final response= await _firebaseAuthService.signInWithGoogle();
      return FirResult.success(UserModel.fromFirebaseUser(response));

    }on  CustomException catch (e){
      return FirResult.failure(e.message);

    }
    catch(e){
      log("Exception in googleLogin fun in auth repo : ${e.toString()}");

      return FirResult.failure("An error occurred. Please try again later.");
    }
  }

  @override
  Future<FirResult<UserEntity>> facebookLogin() async{
    try{
       final response= await _firebaseAuthService.signInWithFacebook();
       return FirResult.success(UserModel.fromFirebaseUser(response));
    }on CustomException catch (e){
      return FirResult.failure(e.message);
  }
    catch(e){
      log("Exception in facebookLogin fun in auth repo : ${e.toString()}");

      return FirResult.failure("An error occurred. Please try again later.");
    }
  }
}