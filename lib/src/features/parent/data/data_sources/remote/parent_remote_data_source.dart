import 'package:api_service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';

abstract class ParentRemoteDataSource {
  Future<Either<DioException, Response<Map<String, dynamic>>>> getParent(
      {required int parentId});

  Future<Either<DioException, Response<Map<String, dynamic>>>> updateParent({
    required int schoolId,
    required int parentId,
    required String name,
    required double phoneNumber,
  });
}

//

class ParentRemoteDataSourceImpl implements ParentRemoteDataSource {
  ParentRemoteDataSourceImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> getParent(
      {required int parentId}) {
    return apiService.getMethod(
      GeneralConstants.host,
    );
  }

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> updateParent({
    required int schoolId,
    required int parentId,
    required String name,
    required double phoneNumber,
  }) =>
      apiService.putMethod<Map<String, dynamic>>(GeneralConstants.host, body: {
        'parent_id': parentId,
        'school_id': schoolId,
        'name': name,
        'phone_number': phoneNumber,
      });
}
