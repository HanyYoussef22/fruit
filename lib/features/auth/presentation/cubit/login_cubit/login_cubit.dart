
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/features/auth/data/models/user_model.dart';
import 'package:fruit/features/auth/domain/entites/user_entity.dart';

import '../../../../../core/helpers/constants.dart';
import '../../../../../core/helpers/shared_perfrance_helper.dart';
import '../../../data/repos/auth_repo.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepoImpl _authRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  LoginCubit(this._authRepo) : super(const LoginState.initial());
  void login() async {
    emit(LoginState.loading());
    final response =await _authRepo.login(email: emailController.text, password: passController.text);
    response.when(success: (response){
      emit(LoginState.success(response));
      userIsLogin(response.uid);
    }
        , failure: (error){
      emit(LoginState.error(error: error));
        }
    );
  }
  void loginWithGoogle()async{
    //cmd comment to config android is gradlew signingReport
    emit(LoginState.loading());
    final response =await _authRepo.googleLogin();
    response.when(success: (response){
      emit(LoginState.success(response));
      userIsLogin(response.uid);
    }, failure: (error){
      emit(LoginState.error(error: error));
    });
  }
  void loginWithFacebook()async{
    emit(LoginState.loading());
    final response =await _authRepo.facebookLogin();
    response.when(success: (response){
      emit(LoginState.success(response));
      userIsLogin(response.uid);
    }, failure: (error){
      emit(LoginState.error(error: error));
    });
  }
  Future<void> userIsLogin(String user) async {
    bool isLoggedIn = await _authRepo.isUserLoggedIn(user);

    await SharedPrefHelper.setData(SharedPrefKeys.isUserLogin, isLoggedIn);
  }

}
