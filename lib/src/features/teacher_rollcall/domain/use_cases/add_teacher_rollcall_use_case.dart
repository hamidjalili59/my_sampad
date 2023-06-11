import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/use_case.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/teacher_rollcall/domain/failure/teacher_rollcall_failure.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_model.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_success_response.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/repositories/teacher_rollcall_repository.dart';

class AddTeacherRollcallUseCase
    implements
        UseCase<TeacherRollcallFailure, TeacherRollcallSuccessResponse,
            tuple.Tuple1<TeacherRollcall>> {
  const AddTeacherRollcallUseCase(this.repo);

  final TeacherRollcallRepository repo;

  @override
  Future<Either<TeacherRollcallFailure, TeacherRollcallSuccessResponse>> call(
          {tuple.Tuple1<TeacherRollcall>? param}) =>
      (param == null)
          ? Future.value(left(const TeacherRollcallFailure.nullParam()))
          : repo.addTeacherRollcall(rollcall: param.value1);
}
