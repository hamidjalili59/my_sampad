import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/use_case.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/mediator_tc/domain/failure/mediator_failure.dart';
import 'package:my_sampad/src/features/mediator_tc/domain/models/mediator_add_success_response.dart';
import 'package:my_sampad/src/features/mediator_tc/domain/repositories/mediator_repository.dart';

class RemoveMediatorUseCase
    implements
        UseCase<MediatorFailure, MediatorAddSuccessResponse,
            tuple.Tuple1<int>> {
  const RemoveMediatorUseCase(this.repo);

  final MediatorRepository repo;

  @override
  Future<Either<MediatorFailure, MediatorAddSuccessResponse>> call(
          {tuple.Tuple1<int>? param}) =>
      (param == null)
          ? Future.value(left(const MediatorFailure.nullParam()))
          : repo.removeMediator(mediatorId: param.value1);
}
