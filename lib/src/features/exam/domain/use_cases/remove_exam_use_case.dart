import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/use_case.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/exam/domain/failure/exam_failure.dart';
import 'package:my_sampad/src/features/exam/domain/models/exam_remove_response.dart';
import 'package:my_sampad/src/features/exam/domain/repositories/exam_repository.dart';

class RemoveExamUseCase
    implements UseCase<ExamFailure, ExamRemoveResponse, tuple.Tuple1<int>> {
  const RemoveExamUseCase(this.repo);

  final ExamRepository repo;

  @override
  Future<Either<ExamFailure, ExamRemoveResponse>> call(
          {tuple.Tuple1<int>? param}) =>
      (param == null)
          ? Future.value(left(const ExamFailure.nullParam()))
          : repo.removeExam(examId: param.value1);
}
