import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';

part 'deputy_success_response.g.dart';

@HiveType(typeId: 18)
@JsonSerializable()
class DeputySuccessResponse {
  @HiveField(0)
  @JsonKey(name: 'Deputy')
  final Deputy deputy;

  DeputySuccessResponse({required this.deputy});

  factory DeputySuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$DeputySuccessResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeputySuccessResponseToJson(this);
}
