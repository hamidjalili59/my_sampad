import 'package:api_service/api_service.dart';
import 'package:database_service/database_service.dart';
import 'package:injectable/injectable.dart';
import 'package:my_sampad/src/features/deputy/data/data_sources/local/deputy_local_data_source.dart';
import 'package:my_sampad/src/features/deputy/data/data_sources/remote/deputy_remote_data_source.dart';
import 'package:my_sampad/src/features/deputy/data/repositories/deputy_repository_impl.dart';
import 'package:my_sampad/src/features/deputy/domain/repositories/deputy_repository.dart';
import 'package:my_sampad/src/features/deputy/domain/use_cases/add_deputy_use_case.dart';
import 'package:my_sampad/src/features/deputy/domain/use_cases/cache_deputy_data_use_case.dart';
import 'package:my_sampad/src/features/deputy/domain/use_cases/get_cached_deputy_data_use_case.dart';
import 'package:my_sampad/src/features/deputy/domain/use_cases/get_deputy_use_case.dart';
import 'package:my_sampad/src/features/deputy/domain/use_cases/remove_deputy_use_case.dart';
import 'package:my_sampad/src/features/deputy/domain/use_cases/update_deputy_use_case.dart';
import 'package:my_sampad/src/injectable/injectable.dart';

@module
abstract class DeputyFeatureModule {
  DeputyRemoteDataSource get remoteDS => DeputyRemoteDataSourceImpl(
        getIt.get<ApiService>(),
      );
  DeputyLocalDataSource get localDS => DeputyLocalDataSource(
        getIt.get<DatabaseService>(),
      );

  DeputyRepository get repo => DeputyRepositoryImpl(remoteDS, localDS);

  AddDeputyUseCase get getDeputyUseCase => AddDeputyUseCase(repo);
  CacheDeputyDataUseCase get cacheDeputyDataUseCase =>
      CacheDeputyDataUseCase(repo);
  GetCachedDeputyDataUseCase get getCachedDeputyDataUseCase =>
      GetCachedDeputyDataUseCase(repo);
  GetDeputyUseCase get getDeputysUseCase => GetDeputyUseCase(repo);
  RemoveDeputyUseCase get removeDeputyUseCase => RemoveDeputyUseCase(repo);
  UpdateDeputyUseCase get updateDeputyUseCase => UpdateDeputyUseCase(repo);
}
