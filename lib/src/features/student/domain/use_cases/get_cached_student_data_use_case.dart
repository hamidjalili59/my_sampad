import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/use_case.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/student/domain/failure/student_failure.dart';
import 'package:my_sampad/src/features/student/domain/models/student_get_response.dart';
import 'package:my_sampad/src/features/student/domain/repositories/student_repository.dart';

class GetCachedStudentDataUseCase
    implements UseCase<StudentFailure, StudentGetResponse, tuple.Tuple0> {
  const GetCachedStudentDataUseCase(this.repo);

  final StudentRepository repo;

  @override
  Future<Either<StudentFailure, StudentGetResponse>> call(
          {tuple.Tuple0? param}) =>
      (param == null)
          ? Future.value(left(const StudentFailure.nullParam()))
          : repo.getCachedStudentData();
}
