import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/auth/domain/failures/auth_failure.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';
import 'package:my_sampad/src/features/parent/domain/models/parent_model/parent.dart';
import 'package:my_sampad/src/features/school/domain/models/principal.dart';
import 'package:my_sampad/src/features/teacher/domain/models/teacher.dart';

abstract class AuthRepository {
  //
  Future<Either<AuthFailure, OtpHandshakeResponse>> otpHandshake(
      {required double phoneNumber});
  //
  Future<Either<AuthFailure, void>> logout();
  //
  Future<Either<AuthFailure, OtpHandshakeResponse>> getAccountData(
      {required double phoneNumber});
  //

  //
  Future<Either<AuthFailure, void>> cacheAuthData({
    required String token,
    required String typeOfUser,
    required double phoneNumber,
    required Parent parent,
    required Teacher teacher,
    required Deputy deputy,
    required Principal principal,
    required int code,
  });
  //
  Future<Either<AuthFailure, OtpHandshakeResponse?>> getCachedAuthData();
  //
}
