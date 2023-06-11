import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_model.dart';

part 'teacher_rollcall_get_response.g.dart';

@HiveType(typeId: 47)
@JsonSerializable()
class TeacherRollcallGetResponse {
  @HiveField(0, defaultValue: [])
  @JsonKey(name: 'rollcalls')
  final List<TeacherRollcall> rollcalls;

  TeacherRollcallGetResponse({required this.rollcalls});

  factory TeacherRollcallGetResponse.fromJson(Map<String, dynamic> json) =>
      _$TeacherRollcallGetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TeacherRollcallGetResponseToJson(this);
}
