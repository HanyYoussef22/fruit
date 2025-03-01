import 'dart:convert';

import 'package:fruit/core/helpers/shared_perfrance_helper.dart';
import 'package:fruit/features/auth/data/models/user_model.dart';

import 'constants.dart';



UserModel getUser() {
  String jsonString = SharedPrefHelper.getString(SharedPrefKeys.kUser);
    var userEntity = UserModel.fromJson(jsonDecode(jsonString));
    return userEntity;
}

