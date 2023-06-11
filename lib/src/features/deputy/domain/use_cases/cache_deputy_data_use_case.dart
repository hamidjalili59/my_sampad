import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/use_case.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/deputy/domain/failure/deputy_failure.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';
import 'package:my_sampad/src/features/deputy/domain/repositories/deputy_repository.dart';

class CacheDeputyDataUseCase
    implements UseCase<DeputyFailure, void, tuple.Tuple1<List<Deputy>>> {
  const CacheDeputyDataUseCase(this.repo);

  final DeputyRepository repo;

  @override
  Future<Either<DeputyFailure, void>> call(
          {tuple.Tuple1<List<Deputy>>? param}) =>
      (param == null)
          ? Future.value(left(const DeputyFailure.nullParam()))
          : repo.cacheDeputysData(deputy: param.value1);
}
