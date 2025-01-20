import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entites/user_entity.dart';
part 'login_state.freezed.dart';

@freezed
class LoginState<T> with _$LoginState<T>
{
  const factory LoginState.initial()=_Initial;
  const factory LoginState.loading()=Loading;
  const factory LoginState.success(UserEntity userEntity)=Success;
  const factory LoginState.error({required String error})=Error;
}
