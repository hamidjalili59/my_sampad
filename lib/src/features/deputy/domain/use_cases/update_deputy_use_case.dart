import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/use_case.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/deputy/domain/failure/deputy_failure.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_success_response.dart';
import 'package:my_sampad/src/features/deputy/domain/repositories/deputy_repository.dart';

class UpdateDeputyUseCase
    implements
        UseCase<DeputyFailure, DeputySuccessResponse,
            tuple.Tuple4<String, int, double, int>> {
  const UpdateDeputyUseCase(this.repo);

  final DeputyRepository repo;

  @override
  Future<Either<DeputyFailure, DeputySuccessResponse>> call(
          {tuple.Tuple4<String, int, double, int>? param}) =>
      (param == null)
          ? Future.value(left(const DeputyFailure.nullParam()))
          : repo.updateDeputy(
              name: param.value1,
              schoolId: param.value2,
              phoneNumber: param.value3,
              deputyId: param.value4);
}
