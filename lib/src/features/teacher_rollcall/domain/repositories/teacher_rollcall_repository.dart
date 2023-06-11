import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/failure/teacher_rollcall_failure.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_get_response.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_model.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_success_response.dart';

abstract class TeacherRollcallRepository {
  //
  Future<Either<TeacherRollcallFailure, TeacherRollcallSuccessResponse>>
      addTeacherRollcall({required TeacherRollcall rollcall});
  //
  Future<Either<TeacherRollcallFailure, TeacherRollcallGetResponse>>
      getTeacherRollcalls({
    required int schoolId,
    required double phoneNumber,
  });
}
