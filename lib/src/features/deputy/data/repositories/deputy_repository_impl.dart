import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/deputy/data/data_sources/local/deputy_local_data_source.dart';
import 'package:my_sampad/src/features/deputy/data/data_sources/remote/deputy_remote_data_source.dart';
import 'package:my_sampad/src/features/deputy/domain/failure/deputy_failure.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_get_response.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_success_response.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';
import 'package:my_sampad/src/features/deputy/domain/repositories/deputy_repository.dart';
import 'package:my_sampad/src/features/core/models/base_response.dart';

class DeputyRepositoryImpl extends DeputyRepository {
  final DeputyRemoteDataSource _remoteDS;
  final DeputyLocalDataSource _localDS;
  final String tokenFieldKey = 'token';

  DeputyRepositoryImpl(this._remoteDS, this._localDS);

  @override
  Future<Either<DeputyFailure, void>> cacheDeputysData(
      {required Deputy deputy}) {
    return _localDS.cacheData(fieldKey: 'deputy', value: deputy).then(
          (value) => value.fold(
            (l) => left<DeputyFailure, void>(DeputyFailure.database(l)),
            (r) => right<DeputyFailure, void>(null),
          ),
        );
  }

  @override
  Future<Either<DeputyFailure, DeputyGetResponse>> getCachedDeputyData() {
    return _localDS.getCachedData(fieldKey: 'deputys').then(
          (value) => value.fold(
            (l) => left<DeputyFailure, DeputyGetResponse>(
                DeputyFailure.database(l)),
            (r) => right<DeputyFailure, DeputyGetResponse>(
                DeputyGetResponse(deputys: r ?? Deputy())),
          ),
        );
  }

  @override
  Future<Either<DeputyFailure, DeputyGetResponse>> getDeputy(
      {required int deputyId}) {
    return _remoteDS.getDeputy(deputyId: deputyId).then(
          (value) => value.fold(
            (l) => left<DeputyFailure, DeputyGetResponse>(
              DeputyFailure.api(l),
            ),
            (r) async {
              try {
                final deputysDataFromServer = DeputyGetResponse.fromJson(
                  BaseResponse.fromJson(r.data ?? {}).toJson(),
                );
                return right<DeputyFailure, DeputyGetResponse>(
                  deputysDataFromServer,
                );
              } catch (e) {
                return left<DeputyFailure, DeputyGetResponse>(
                    const DeputyFailure.nullParam());
              }
            },
          ),
        );
  }

  @override
  Future<Either<DeputyFailure, DeputySuccessResponse>> updateDeputy({
    required int schoolId,
    required int deputyId,
    required String name,
    required double phoneNumber,
  }) {
    return _remoteDS
        .updateDeputy(
          deputyId: deputyId,
          schoolId: schoolId,
          phoneNumber: phoneNumber,
          name: name,
        )
        .then(
          (value) => value.fold(
            (l) => left<DeputyFailure, DeputySuccessResponse>(
              DeputyFailure.api(l),
            ),
            (r) async {
              try {
                final updateDeputyOnServer = DeputySuccessResponse.fromJson(
                  BaseResponse.fromJson(r.data ?? {}).toJson(),
                );
                return right<DeputyFailure, DeputySuccessResponse>(
                  updateDeputyOnServer,
                );
              } catch (e) {
                return left<DeputyFailure, DeputySuccessResponse>(
                    const DeputyFailure.nullParam());
              }
            },
          ),
        );
  }

  @override
  Future<Either<DeputyFailure, DeputySuccessResponse>> addDeputy(
      {required Deputy deputy}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<DeputyFailure, DeputySuccessResponse>> removeDeputy(
      {required int deputyId}) {
    throw UnimplementedError();
  }
}
