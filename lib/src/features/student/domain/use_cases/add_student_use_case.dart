import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/use_case.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/student/domain/failure/student_failure.dart';
import 'package:my_sampad/src/features/student/domain/models/student_model/student.dart';
import 'package:my_sampad/src/features/student/domain/models/student_success_response.dart';
import 'package:my_sampad/src/features/student/domain/repositories/student_repository.dart';

class AddStudentUseCase
    implements
        UseCase<StudentFailure, StudentSuccessResponse,
            tuple.Tuple3<Student, String, bool>> {
  const AddStudentUseCase(this.repo);

  final StudentRepository repo;

  @override
  Future<Either<StudentFailure, StudentSuccessResponse>> call(
          {tuple.Tuple3<Student, String, bool>? param}) =>
      (param == null)
          ? Future.value(left(const StudentFailure.nullParam()))
          : repo.addStudent(
              student: param.value1,
              parentName: param.value2,
              sendSms: param.value3);
}
