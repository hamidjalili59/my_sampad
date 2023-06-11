import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/core/models/base_response.dart';
import 'package:my_sampad/src/features/teacher_rollcall/data/data_sources/remote/teacher_rollcall_remote_data_source.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/failure/teacher_rollcall_failure.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_get_response.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_model.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_success_response.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/repositories/teacher_rollcall_repository.dart';

class TeacherRollcallRepositoryImpl extends TeacherRollcallRepository {
  final TeacherRollcallRemoteDataSource _remoteDS;
  final String tokenFieldKey = 'token';

  TeacherRollcallRepositoryImpl(this._remoteDS);

  @override
  Future<Either<TeacherRollcallFailure, TeacherRollcallSuccessResponse>>
      addTeacherRollcall({required TeacherRollcall rollcall}) {
    return _remoteDS.addTeacherRollcall(rollcall: rollcall).then(
          (value) => value.fold(
            (l) => left<TeacherRollcallFailure, TeacherRollcallSuccessResponse>(
                TeacherRollcallFailure.api(l)),
            (r) async {
              try {
                final rollcallAddSuccessResponse =
                    TeacherRollcallSuccessResponse.fromJson(
                  BaseResponse.fromJson(r.data ?? {}).payload,
                );
                return right<TeacherRollcallFailure,
                    TeacherRollcallSuccessResponse>(
                  rollcallAddSuccessResponse,
                );
              } catch (e) {
                return left<TeacherRollcallFailure,
                        TeacherRollcallSuccessResponse>(
                    const TeacherRollcallFailure.nullParam());
              }
            },
          ),
        );
  }

  @override
  Future<Either<TeacherRollcallFailure, TeacherRollcallGetResponse>>
      getTeacherRollcalls(
          {required int schoolId, required double phoneNumber}) {
    return _remoteDS
        .getTeacherRollcalls(schoolId: schoolId, phoneNumber: phoneNumber)
        .then(
          (value) => value.fold(
            (l) => left<TeacherRollcallFailure, TeacherRollcallGetResponse>(
              TeacherRollcallFailure.api(l),
            ),
            (r) async {
              try {
                final rollcallsDataFromServer =
                    TeacherRollcallGetResponse.fromJson(
                  BaseResponse.fromJson(r.data ?? {}).payload,
                );
                return right<TeacherRollcallFailure,
                    TeacherRollcallGetResponse>(
                  rollcallsDataFromServer,
                );
              } catch (e) {
                return left<TeacherRollcallFailure, TeacherRollcallGetResponse>(
                    const TeacherRollcallFailure.nullParam());
              }
            },
          ),
        );
  }
}
