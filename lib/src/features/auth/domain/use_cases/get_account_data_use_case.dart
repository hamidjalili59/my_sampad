import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/auth/domain/failures/auth_failure.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/core/models/use_case.dart';

class GetAccountDataUseCase
    implements
        UseCase<AuthFailure, OtpHandshakeResponse, tuple.Tuple1<double>> {
  const GetAccountDataUseCase(this.repo);

  final AuthRepository repo;

  @override
  Future<Either<AuthFailure, OtpHandshakeResponse>> call(
          {tuple.Tuple1<double>? param}) =>
      (param == null)
          ? Future.value(left(const AuthFailure.nullParam()))
          : repo.getAccountData(phoneNumber: param.value1);
}
