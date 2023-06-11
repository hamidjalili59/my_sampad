import 'package:hive/hive.dart';
// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

import 'deputy_model/deputy.dart';

part 'deputy_get_response.g.dart';

@HiveType(typeId: 17)
@JsonSerializable()
class DeputyGetResponse {
  @HiveField(0)
  final Deputy deputys;

  DeputyGetResponse({required this.deputys});

  factory DeputyGetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeputyGetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DeputyGetResponseToJson(this);
}
