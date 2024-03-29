import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/auth/data/data_sources/local/auth_local_data_source.dart';
import 'package:my_sampad/src/features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import 'package:my_sampad/src/features/auth/domain/failures/auth_failure.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';
import 'package:my_sampad/src/features/parent/domain/models/parent_model/parent.dart';
import 'package:my_sampad/src/features/school/domain/models/principal.dart';
import 'package:my_sampad/src/features/teacher/domain/models/teacher.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:device_info_plus/device_info_plus.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _remoteDS;
  final AuthLocalDataSource _localDS;
  final String tokenFieldKey = 'token';

  AuthRepositoryImpl(this._remoteDS, this._localDS);

  @override
  Future<Either<AuthFailure, OtpHandshakeResponse>> otpHandshake(
      {required double phoneNumber}) async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String mobileId =
        await deviceInfo.androidInfo.then((value) => value.fingerprint);
    return _remoteDS
        .otpHandshake(phoneNumber: phoneNumber, mobileId: mobileId)
        .then((response) {
      return response.fold(
        (l) => left<AuthFailure, OtpHandshakeResponse>(AuthFailure.api(l)),
        (r) {
          try {
            r.data!['phoneNumber'] = phoneNumber;
            return right<AuthFailure, OtpHandshakeResponse>(
              OtpHandshakeResponse.fromJson(r.data ?? {}),
            );
          } catch (e) {
            return left<AuthFailure, OtpHandshakeResponse>(
                const AuthFailure.nullParam());
          }
        },
      );
    });
  }

  @override
  Future<Either<AuthFailure, void>> cacheAuthData({
    required String token,
    required String typeOfUser,
    required double phoneNumber,
    required Parent parent,
    required Deputy deputy,
    required Teacher teacher,
    required Principal principal,
    required int code,
  }) {
    return _localDS
        .cacheData(
            fieldKey: tokenFieldKey,
            value: OtpHandshakeResponse(
              code: code,
              token: token,
              typeOfUser: typeOfUser,
              parent: parent,
              principal: principal,
              teacher: teacher,
              deputy: deputy,
              phoneNumber: getIt.get<double>(),
            ))
        .then(
          (value) => value.fold(
            (l) => left<AuthFailure, void>(AuthFailure.database(l)),
            (r) => right<AuthFailure, void>(null),
          ),
        );
  }

  @override
  Future<Either<AuthFailure, OtpHandshakeResponse?>> getCachedAuthData() =>
      _localDS.getCachedData(fieldKey: tokenFieldKey).then(
            (value) => value.fold(
              (l) => left<AuthFailure, OtpHandshakeResponse?>(
                  AuthFailure.database(l)),
              (r) => right<AuthFailure, OtpHandshakeResponse?>(r),
            ),
          );

  @override
  Future<Either<AuthFailure, void>> logout() {
    return _localDS
        .removeData(
          fieldKey: tokenFieldKey,
        )
        .then(
          (value) => value.fold(
            (l) => left<AuthFailure, void>(AuthFailure.database(l)),
            (r) => right<AuthFailure, void>(null),
          ),
        );
  }

  @override
  Future<Either<AuthFailure, OtpHandshakeResponse>> getAccountData(
      {required double phoneNumber}) {
    return _remoteDS.getAccountData(phoneNumber: phoneNumber).then((response) {
      return response.fold(
        (l) => left<AuthFailure, OtpHandshakeResponse>(AuthFailure.api(l)),
        (r) {
          try {
            r.data!['phoneNumber'] = phoneNumber;
            return right<AuthFailure, OtpHandshakeResponse>(
              OtpHandshakeResponse.fromJson(r.data ?? {}),
            );
          } catch (e) {
            return left<AuthFailure, OtpHandshakeResponse>(
                const AuthFailure.nullParam());
          }
        },
      );
    });
  }
}
