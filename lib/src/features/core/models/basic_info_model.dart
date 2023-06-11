import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'basic_info_model.g.dart';

@HiveType(typeId: 8)
@JsonSerializable()
class BasicInfoModel {
  @HiveField(0)
  @JsonKey(name: 'name')
  final String name;
  @HiveField(1)
  @JsonKey(name: 'phoneNumber')
  final double phoneNumber;

  BasicInfoModel({
    required this.name,
    required this.phoneNumber,
  });

  factory BasicInfoModel.fromJson(Map<String, dynamic> json) =>
      _$BasicInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$BasicInfoModelToJson(this);
}
