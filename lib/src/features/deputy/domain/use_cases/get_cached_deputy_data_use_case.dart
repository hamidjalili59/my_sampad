import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/use_case.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/deputy/domain/failure/deputy_failure.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_get_response.dart';
import 'package:my_sampad/src/features/deputy/domain/repositories/deputy_repository.dart';

class GetCachedDeputyDataUseCase
    implements UseCase<DeputyFailure, DeputyGetResponse, tuple.Tuple0> {
  const GetCachedDeputyDataUseCase(this.repo);

  final DeputyRepository repo;

  @override
  Future<Either<DeputyFailure, DeputyGetResponse>> call(
          {tuple.Tuple0? param}) =>
      (param == null)
          ? Future.value(left(const DeputyFailure.nullParam()))
          : repo.getCachedDeputyData();
}
