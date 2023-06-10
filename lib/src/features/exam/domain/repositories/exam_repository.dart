import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/exam/domain/failure/exam_failure.dart';
import 'package:my_sampad/src/features/exam/domain/models/exam_get_response.dart';
import 'package:my_sampad/src/features/exam/domain/models/exam_model.dart';
import 'package:my_sampad/src/features/exam/domain/models/exam_remove_response.dart';
import 'package:my_sampad/src/features/exam/domain/models/exam_success_response.dart';

abstract class ExamRepository {
  //
  Future<Either<ExamFailure, ExamSuccessResponse>> addExam(
      {required Exam exam});
  //
  Future<Either<ExamFailure, ExamSuccessResponse>> updateExam({
    required Exam exam,
  });
  //
  Future<Either<ExamFailure, ExamRemoveResponse>> removeExam({
    required int examId,
  });
  //
  Future<Either<ExamFailure, ExamGetResponse>> getExams({
    required int classId,
  });
  //
  Future<Either<ExamFailure, ExamGetResponse>> getSingleExam({
    required int examId,
  });
  //
  Future<Either<ExamFailure, void>> cacheExamsData({
    required List<Exam> exams,
  });
  //
  Future<Either<ExamFailure, ExamGetResponse>> getCachedExamData();
  //
}
