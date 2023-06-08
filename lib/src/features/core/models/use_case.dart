import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart';

abstract class UseCase<F, S, Params extends Tuple> {
  Future<Either<F, S>> call({Params? param});
}
