import 'package:dartz/dartz.dart';
import 'package:my_sampad/src/features/school/domain/failure/school_failure.dart';
import 'package:my_sampad/src/features/school/domain/models/school_get_response.dart';

abstract class SchoolRepository {
  //
  Future<Either<SchoolFailure, SchoolGetResponse>> getSchool({
    required double numberPhone,
  });
  //
}
