import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_sampad/src/features/core/models/basic_info_model.dart';

part 'principal.g.dart';

@HiveType(typeId: 40)
@JsonSerializable()
class Principal {
  @HiveField(0)
  @JsonKey(name: 'school_ID')
  final int schoolId;
  @HiveField(1)
  @JsonKey(name: 'basic_Info')
  final BasicInfoModel basicInfo;

  Principal({
    required this.schoolId,
    required this.basicInfo,
  });

  factory Principal.fromJson(Map<String, dynamic> json) =>
      _$PrincipalFromJson(json);

  Map<String, dynamic> toJson() => _$PrincipalToJson(this);
}
