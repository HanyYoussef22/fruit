import 'package:fruit/core/networking/fir_result.dart';
import 'package:fruit/features/auth/data/models/user_model.dart';
import 'package:fruit/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  // Future<FirResult<UserEntity>> login(String email, String password);
  Future<FirResult<UserEntity>> register({required String name,required String email,required String password});
  Future<FirResult<UserEntity>> login({required String email,required String password});
  Future<FirResult<UserEntity>> googleLogin();
  Future<FirResult<UserEntity>> facebookLogin();
  Future addUserData({required UserModel user});
  Future<UserModel> getUserData({required String docId});



}