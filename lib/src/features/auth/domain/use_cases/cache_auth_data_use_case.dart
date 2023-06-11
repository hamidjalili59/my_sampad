import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/auth/domain/failures/auth_failure.dart';
import 'package:my_sampad/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/core/models/use_case.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';
import 'package:my_sampad/src/features/parent/domain/models/parent_model/parent.dart';
import 'package:my_sampad/src/features/school/domain/models/principal.dart';
import 'package:my_sampad/src/features/teacher/domain/models/teacher.dart';

class CacheAuthDataUseCase
    implements
        UseCase<
            AuthFailure,
            void,
            tuple.Tuple8<String, String, int, Parent, Teacher, Principal,
                Deputy, double>> {
  const CacheAuthDataUseCase(this.repo);

  final AuthRepository repo;

  @override
  Future<Either<AuthFailure, void>> call(
          {tuple.Tuple8<String, String, int, Parent, Teacher, Principal, Deputy,
                  double>?
              param}) =>
      (param == null)
          ? Future.value(left(const AuthFailure.nullParam()))
          : repo.cacheAuthData(
              token: param.value1,
              typeOfUser: param.value2,
              code: param.value3,
              parent: param.value4,
              teacher: param.value5,
              principal: param.value6,
              deputy: param.value7,
              phoneNumber: param.value8,
            );
}
