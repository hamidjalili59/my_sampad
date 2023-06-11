import 'dart:convert';

import 'package:api_service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/features/teacher_rollcall/data/data_sources/remote/teacher_rollcall_end_points.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_model.dart';

abstract class TeacherRollcallRemoteDataSource {
  Future<Either<DioException, Response<Map<String, dynamic>>>>
      addTeacherRollcall({required TeacherRollcall rollcall});

  Future<Either<DioException, Response<Map<String, dynamic>>>>
      getTeacherRollcalls({required int schoolId, required double phoneNumber});
}

//

class TeacherRollcallRemoteDataSourceImpl
    implements TeacherRollcallRemoteDataSource {
  TeacherRollcallRemoteDataSourceImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>>
      addTeacherRollcall({required TeacherRollcall rollcall}) =>
          apiService.postMethod<Map<String, dynamic>>(
            GeneralConstants.host + TeacherRollcallEndpoints.addLink,
            body: jsonEncode(rollcall),
          );

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>>
      getTeacherRollcalls(
          {required int schoolId, required double phoneNumber}) {
    return apiService.getMethod(
      '${GeneralConstants.host}${TeacherRollcallEndpoints.getLink}$schoolId?phonenumber=$phoneNumber',
    );
  }
}
