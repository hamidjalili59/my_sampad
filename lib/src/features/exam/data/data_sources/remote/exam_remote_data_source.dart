import 'dart:convert';

import 'package:api_service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/features/exam/data/data_sources/remote/exam_end_points.dart';
import 'package:my_sampad/src/features/exam/domain/models/exam_model.dart';

abstract class ExamRemoteDataSource {
  Future<Either<DioException, Response<Map<String, dynamic>>>> addExam(
      {required Exam exam});

  Future<Either<DioException, Response<Map<String, dynamic>>>> getExams(
      {required int classId});

  Future<Either<DioException, Response<Map<String, dynamic>>>> getSingleExam(
      {required int examId});

  Future<Either<DioException, Response<Map<String, dynamic>>>> removeExam(
      {required int examId});

  Future<Either<DioException, Response<Map<String, dynamic>>>> updateExam({
    required Exam exam,
  });
}

//

class ExamRemoteDataSourceImpl implements ExamRemoteDataSource {
  ExamRemoteDataSourceImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> addExam(
          {required Exam exam}) =>
      apiService.postMethod<Map<String, dynamic>>(
        GeneralConstants.host + ExamEndpoints.addLink,
        body: jsonEncode(exam),
      );

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> getExams(
      {required int classId}) {
    return apiService.getMethod(
      GeneralConstants.host + ExamEndpoints.getLink + classId.toString(),
    );
  }

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> getSingleExam(
      {required int examId}) {
    return apiService.getMethod(
      GeneralConstants.host,
    );
  }

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> removeExam(
      {required int examId}) {
    return apiService.deleteMethod(
        GeneralConstants.host + ExamEndpoints.deleteLink + examId.toString());
  }

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> updateExam({
    required Exam exam,
  }) =>
      apiService.putMethod<Map<String, dynamic>>(
          GeneralConstants.host +
              ExamEndpoints.editLink +
              exam.examId.toString(),
          body: {
            "done": exam.isDone,
            "exam_Describtion": exam.examDescription,
            "teacher_ID": exam.teacherId,
          });
}
