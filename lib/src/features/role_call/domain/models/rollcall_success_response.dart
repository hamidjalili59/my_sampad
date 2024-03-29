import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
import 'package:my_sampad/src/features/role_call/domain/models/rollcall_model.dart';

part 'rollcall_success_response.g.dart';

@HiveType(typeId: 31)
@JsonSerializable()
class RollcallSuccessResponse {
  @HiveField(0)
  @JsonKey(name: 'RollCalls')
  final List<Rollcall> rollcall;

  RollcallSuccessResponse({required this.rollcall});

  factory RollcallSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$RollcallSuccessResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RollcallSuccessResponseToJson(this);
}
