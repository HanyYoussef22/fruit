import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/features/auth/presentation/cubit/sinup_cubit/sinup_state.dart';

import '../../../data/repos/auth_repo.dart';

class SinUpCubit extends Cubit<SinUpState> {
  final AuthRepoImpl _authRepo;
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  SinUpCubit(this._authRepo) : super(const SinUpState.initial());



  void emitSinupState() async{

   final response= await _authRepo.register(name: nameController.text, email: emailController.text, password: passController.text);
   response.when(success: (userEntity) async {
     emit(SinUpState.success(userEntity));
   },
       failure: (error)
       {
         emit(SinUpState.error(error: error));

       });

  }




}


