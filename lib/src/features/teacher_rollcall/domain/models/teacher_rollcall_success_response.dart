import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_model.dart';

part 'teacher_rollcall_success_response.g.dart';

@HiveType(typeId: 49)
@JsonSerializable()
class TeacherRollcallSuccessResponse {
  @HiveField(0)
  @JsonKey(name: 'rollcall')
  final TeacherRollcall rollcall;

  TeacherRollcallSuccessResponse({required this.rollcall});

  factory TeacherRollcallSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$TeacherRollcallSuccessResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherRollcallSuccessResponseToJson(this);
}
