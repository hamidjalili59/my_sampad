import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/use_case.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/teacher_rollcall/domain/failure/teacher_rollcall_failure.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_get_response.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/repositories/teacher_rollcall_repository.dart';

class GetTeacherRollCallsUseCase
    implements
        UseCase<TeacherRollcallFailure, TeacherRollcallGetResponse,
            tuple.Tuple2<int, double>> {
  const GetTeacherRollCallsUseCase(this.repo);

  final TeacherRollcallRepository repo;

  @override
  Future<Either<TeacherRollcallFailure, TeacherRollcallGetResponse>> call(
          {tuple.Tuple2<int, double>? param}) =>
      (param == null)
          ? Future.value(left(const TeacherRollcallFailure.nullParam()))
          : repo.getTeacherRollcalls(
              schoolId: param.value1,
              phoneNumber: param.value2,
            );
}
