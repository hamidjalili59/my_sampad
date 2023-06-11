// ignore_for_file: depend_on_referenced_packages
import 'package:database_service/database_service.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_sampad/src/features/core/failures/failure.dart';

part 'deputy_failure.freezed.dart';

@freezed
class DeputyFailure extends Failure with _$DeputyFailure {
  ///
  const factory DeputyFailure.missingToken() = _MissingToken;

  ///
  const factory DeputyFailure.api(DioException failure) = _Api;
  const factory DeputyFailure.nullParam() = _NullParam;
  const factory DeputyFailure.database(DatabaseError failure) = _Database;
}
