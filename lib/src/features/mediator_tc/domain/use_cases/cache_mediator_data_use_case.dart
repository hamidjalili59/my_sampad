import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/use_case.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/mediator_tc/domain/failure/mediator_failure.dart';
import 'package:my_sampad/src/features/mediator_tc/domain/models/mediator.dart';
import 'package:my_sampad/src/features/mediator_tc/domain/repositories/mediator_repository.dart';

class CacheMediatorDataUseCase
    implements UseCase<MediatorFailure, void, tuple.Tuple1<List<Mediator>>> {
  const CacheMediatorDataUseCase(this.repo);

  final MediatorRepository repo;

  @override
  Future<Either<MediatorFailure, void>> call(
          {tuple.Tuple1<List<Mediator>>? param}) =>
      (param == null)
          ? Future.value(left(const MediatorFailure.nullParam()))
          : repo.cacheMediatorsData(mediators: param.value1);
}
