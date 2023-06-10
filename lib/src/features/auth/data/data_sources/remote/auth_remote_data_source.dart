import 'package:api_service/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';

abstract class AuthRemoteDataSource {
  Future<Either<DioException, Response<Map<String, dynamic>>>> otpHandshake(
      {required double phoneNumber});
  Future<Either<DioException, Response<Map<String, dynamic>>>> getAccountData(
      {required double phoneNumber});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.apiService);
  final ApiService apiService;

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> otpHandshake(
      {required double phoneNumber}) {
    return apiService.postMethod<Map<String, dynamic>>(
      '${GeneralConstants.host}api/v1/LogIn',
      body: {
        "phoneNumber": phoneNumber,
      },
    );
  }

  @override
  Future<Either<DioException, Response<Map<String, dynamic>>>> getAccountData(
      {required double phoneNumber}) {
    return apiService.getMethod<Map<String, dynamic>>(
      '${GeneralConstants.host}api/v1/LogIn/$phoneNumber',
    );
  }
}
