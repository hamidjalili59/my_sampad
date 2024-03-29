import 'package:api_service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/features/student/data/data_sources/remote/student_end_points.dart';
import 'package:my_sampad/src/features/student/domain/models/student_model/student.dart';
import 'package:my_sampad/src/injectable/injectable.dart';

abstract class StudentRemoteDataSource {
  Future<Either<DioException, Response<Map<String, dynamic>>>> addStudent({
    required Student student,
    required String parentName,
    required bool sendSms,
  });

  Future<Either<DioException, Response<Map<String, dynamic>>>> getStudents(
      {required int classId});

  Future<Either<DioException, Response<Map<String, dynamic>>>>
      getStudentsParent({required double phonenumber});

  Future<Either<DioException, Response<Map<String, dynamic>>>> removeStudent(
      {required int studentId});

  Future<Either<DioException, Response<Map<String, dynamic>>>> updateStudent({
    required Student student,
  });
}

//

class StudentRemoteDataSourceImpl implements StudentRemoteDataSource {
  StudentRemoteDataSourceImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> addStudent({
    required Student student,
    required String parentName,
    required bool sendSms,
  }) =>
      apiService.postMethod<Map<String, dynamic>>(
          GeneralConstants.host + StudentEndpoints.addLink,
          body: {
            'name': student.basicInfo!.name,
            'phoneNumber': student.basicInfo!.phoneNumber,
            'class_ID': student.classId,
            'parent_Name': parentName,
            'school_ID': getIt.get<Classroom>().schoolId,
            'sendSMS': sendSms,
          });

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> getStudents(
      {required int classId}) {
    return apiService.getMethod(
      GeneralConstants.host + StudentEndpoints.getLink + classId.toString(),
    );
  }

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> removeStudent(
      {required int studentId}) {
    return apiService.deleteMethod(GeneralConstants.host +
        StudentEndpoints.deleteLink +
        studentId.toString());
  }

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> updateStudent({
    required Student student,
  }) =>
      apiService.putMethod<Map<String, dynamic>>(
          GeneralConstants.host +
              StudentEndpoints.editLink +
              student.studentId.toString(),
          body: {
            'class_ID': student.classId,
            'name': student.basicInfo!.name,
            'phoneNumber': student.basicInfo!.phoneNumber,
            'sendSMS': student.sendSMS,
          });

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>>
      getStudentsParent({required double phonenumber}) {
    return apiService.getMethod(
      GeneralConstants.host +
          StudentEndpoints.getParentLink +
          phonenumber.toString(),
    );
  }
}
