import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fruit/features/auth/domain/entites/user_entity.dart';
part 'sinup_state.freezed.dart';

@freezed
class SinUpState <T> with _$SinUpState<T>
{
  const factory SinUpState.initial()=Initial;
  const factory SinUpState.loading()=Loading;
  const factory SinUpState.success(UserEntity userEntity)=Success;
  const factory SinUpState.error({required String error})=Error;
}





