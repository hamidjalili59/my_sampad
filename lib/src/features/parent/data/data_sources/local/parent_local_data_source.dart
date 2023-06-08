import 'package:database_service/database_service.dart';
import 'package:my_sampad/src/features/parent/domain/models/parent_model/parent.dart';

class ParentLocalDataSource extends DatabaseCommonOperations<Parent> {
  final DatabaseService dbService;

  ParentLocalDataSource(this.dbService)
      : super(
          boxName: 'ParentDataSource',
          databaseService: dbService,
        );
}
