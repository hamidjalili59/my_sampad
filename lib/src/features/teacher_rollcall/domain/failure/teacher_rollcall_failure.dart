import 'package:database_service/database_service.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_sampad/src/features/core/failures/failure.dart';

part 'teacher_rollcall_failure.freezed.dart';

@freezed
class TeacherRollcallFailure extends Failure with _$TeacherRollcallFailure {
  ///
  const factory TeacherRollcallFailure.missingToken() = _MissingToken;

  ///
  const factory TeacherRollcallFailure.api(DioException failure) = _Api;
  const factory TeacherRollcallFailure.nullParam() = _NullParam;
  const factory TeacherRollcallFailure.database(DatabaseError failure) =
      _Database;
}
