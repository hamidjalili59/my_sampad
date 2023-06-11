import 'package:api_service/api_service.dart';
import 'package:injectable/injectable.dart';
import 'package:my_sampad/src/features/teacher_rollcall/data/data_sources/remote/teacher_rollcall_remote_data_source.dart';
import 'package:my_sampad/src/features/teacher_rollcall/data/repositories/teacher_rollcall_repository_impl.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/repositories/teacher_rollcall_repository.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/use_cases/add_teacher_rollcall_use_case.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/use_cases/get_teacher_rollcalls_use_case.dart';
import 'package:my_sampad/src/injectable/injectable.dart';

@module
abstract class TeacherRollcallFeatureModule {
  TeacherRollcallRemoteDataSource get remoteDS =>
      TeacherRollcallRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      );

  TeacherRollcallRepository get repo => TeacherRollcallRepositoryImpl(remoteDS);

  AddTeacherRollcallUseCase get getTeacherRollcallUseCase =>
      AddTeacherRollcallUseCase(repo);
  GetTeacherRollCallsUseCase get getTeacherRollcallsUseCase =>
      GetTeacherRollCallsUseCase(repo);
}
