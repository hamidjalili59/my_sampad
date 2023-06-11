// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_sampad/src/features/core/models/basic_info_model.dart';
import 'package:hive/hive.dart';

part 'deputy.freezed.dart';
part 'deputy.g.dart';

@Freezed(
  makeCollectionsUnmodifiable: false,
  copyWith: true,
  toJson: true,
  fromJson: true,
  equal: true,
)
@HiveType(typeId: 19)

/// asd
class Deputy with _$Deputy {
  ///adsasd
  factory Deputy({
    // account email
    @HiveField(0)
    @Default(0)
    @JsonKey(name: 'deputy_ID', defaultValue: 0)
    int deputyId,

    // account password
    @HiveField(1)
    @Default(0)
    @JsonKey(name: 'school_ID', defaultValue: 0)
    int schoolId,

    // basic Information
    @HiveField(2) @JsonKey(name: 'basic_Info') BasicInfoModel? basicInfo,
  }) = _Deputy;

  ///das
  factory Deputy.fromJson(Map<String, Object?> json) => _$DeputyFromJson(json);
}
