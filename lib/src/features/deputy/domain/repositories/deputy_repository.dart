import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/deputy/domain/failure/deputy_failure.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_get_response.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_success_response.dart';

abstract class DeputyRepository {
  //
  Future<Either<DeputyFailure, DeputySuccessResponse>> updateDeputy({
    required Deputy deputy,
  });
  //
  Future<Either<DeputyFailure, DeputyGetResponse>> getDeputy({
    required int schoolId,
  });
  //
  Future<Either<DeputyFailure, DeputySuccessResponse>> addDeputy({
    required Deputy deputy,
  });
  //
  Future<Either<DeputyFailure, DeputySuccessResponse>> removeDeputy({
    required int deputyId,
  });
  //
  Future<Either<DeputyFailure, void>> cacheDeputysData({
    required List<Deputy> deputy,
  });
  //
  Future<Either<DeputyFailure, DeputyGetResponse>> getCachedDeputyData();
  //
}
