import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:my_sampad/src/features/student/domain/models/student_model/student.dart';

part 'student_success_response.g.dart';

@HiveType(typeId: 40)
@JsonSerializable()
class StudentSuccessResponse {
  @HiveField(0)
  @JsonKey(name: 'Student')
  final Student student;

  StudentSuccessResponse({required this.student});

  factory StudentSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentSuccessResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentSuccessResponseToJson(this);
}
