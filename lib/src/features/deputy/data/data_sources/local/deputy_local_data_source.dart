import 'package:database_service/database_service.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';

class DeputyLocalDataSource extends DatabaseCommonOperations<List<Deputy>> {
  final DatabaseService dbService;

  DeputyLocalDataSource(this.dbService)
      : super(
          boxName: 'DeputyDataSource',
          databaseService: dbService,
        );
}
