import 'package:api_service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/features/deputy/data/data_sources/remote/deputy_end_points.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';

abstract class DeputyRemoteDataSource {
  Future<Either<DioException, Response<Map<String, dynamic>>>> getDeputy(
      {required int deputyId});

  Future<Either<DioException, Response<Map<String, dynamic>>>> addDeputy(
      {required Deputy deputy});

  Future<Either<DioException, Response<Map<String, dynamic>>>> deleteDeputy(
      {required int deputyId});

  Future<Either<DioException, Response<Map<String, dynamic>>>> updateDeputy({
    required int schoolId,
    required int deputyId,
    required String name,
    required double phoneNumber,
  });
}

//

class DeputyRemoteDataSourceImpl implements DeputyRemoteDataSource {
  DeputyRemoteDataSourceImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> getDeputy(
      {required int deputyId}) {
    return apiService.getMethod(
      GeneralConstants.host,
    );
  }

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> deleteDeputy(
      {required int deputyId}) {
    return apiService.deleteMethod(
      GeneralConstants.host + DeputyEndpoints.deleteLink + deputyId.toString(),
    );
  }

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> updateDeputy({
    required int schoolId,
    required int deputyId,
    required String name,
    required double phoneNumber,
  }) =>
      apiService.putMethod<Map<String, dynamic>>(
          GeneralConstants.host + DeputyEndpoints.editLink,
          body: {
            'deputy_id': deputyId,
            'school_id': schoolId,
            'name': name,
            'phone_number': phoneNumber,
          });

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> addDeputy(
          {required Deputy deputy}) =>
      apiService.putMethod<Map<String, dynamic>>(
          GeneralConstants.host + DeputyEndpoints.addLink,
          body: {
            'deputy_id': '',
            'school_id': '',
            'name': '',
            'phone_number': '',
          });
}
