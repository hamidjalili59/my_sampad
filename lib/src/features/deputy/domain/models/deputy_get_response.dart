import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'deputy_model/deputy.dart';

part 'deputy_get_response.g.dart';

@HiveType(typeId: 17)
@JsonSerializable()
class DeputyGetResponse {
  @HiveField(0, defaultValue: [])
  @JsonKey(name: 'Deputys', defaultValue: [])
  final List<Deputy> deputys;

  DeputyGetResponse({required this.deputys});

  factory DeputyGetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeputyGetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeputyGetResponseToJson(this);
}
