// coverage:ignore-file
import 'package:detrack_test/core/utils/helpers/errors/error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
class Result<T> with _$Result<T> {
  Result._();

  factory Result.success(T result) = Success<T>;

  factory Result.failure(CustomError error) = Failure<T>;

  bool get isSuccess => this is Success<T>;

  bool get isFailure => this is Failure<T>;

  T? get valueOrNull => (this is Success<T>) ? (this as Success<T>).result : null;

  CustomError? get errorOrNull => (this is Failure<T>) ? (this as Failure<T>).error : null;
}
