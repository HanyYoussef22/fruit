import 'package:freezed_annotation/freezed_annotation.dart';
import 'exceptions.dart';
part 'fir_result.freezed.dart';

@freezed
abstract class FirResult<T> with _$FirResult<T> {
  const factory FirResult.success(T data) = Success<T>;
  const factory FirResult.failure(String error) = Failure<T>;
}
