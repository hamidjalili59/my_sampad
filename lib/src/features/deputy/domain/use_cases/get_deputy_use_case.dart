import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/use_case.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/deputy/domain/failure/deputy_failure.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_get_response.dart';
import 'package:my_sampad/src/features/deputy/domain/repositories/deputy_repository.dart';

class GetDeputyUseCase
    implements UseCase<DeputyFailure, DeputyGetResponse, tuple.Tuple1<int>> {
  const GetDeputyUseCase(this.repo);

  final DeputyRepository repo;

  @override
  Future<Either<DeputyFailure, DeputyGetResponse>> call(
          {tuple.Tuple1<int>? param}) =>
      (param == null)
          ? Future.value(left(const DeputyFailure.nullParam()))
          : repo.getDeputy(deputyId: param.value1);
}
