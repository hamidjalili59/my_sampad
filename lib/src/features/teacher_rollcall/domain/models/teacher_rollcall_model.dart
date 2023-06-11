// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'teacher_rollcall_model.freezed.dart';
part 'teacher_rollcall_model.g.dart';

@Freezed(
  makeCollectionsUnmodifiable: false,
  copyWith: true,
  fromJson: true,
  toJson: true,
  equal: true,
)
@HiveType(typeId: 48)

/// asd
class TeacherRollcall with _$TeacherRollcall {
  ///adsasd
  factory TeacherRollcall({
    // account email
    @HiveField(0, defaultValue: 0)
    @JsonKey(name: 'rollCall_ID')
    @Default(0)
    int rolecallId,
    //
    @HiveField(1, defaultValue: 0)
    @JsonKey(name: 'school_ID')
    @Default(0)
    int schoolId,
    // basic Information
    @HiveField(2, defaultValue: 0.0)
    @JsonKey(name: 'phoneNumber')
    @Default(0.0)
    double phoneNumber,
    // basic Information
    @HiveField(3, defaultValue: false)
    @JsonKey(name: 'absent')
    @Default(false)
    bool absent,
    // basic Information
    @HiveField(4, defaultValue: '')
    @JsonKey(name: 'date')
    @Default('')
    String date,
  }) = _TeacherRollcall;

  ///das
  factory TeacherRollcall.fromJson(Map<String, Object?> json) =>
      _$TeacherRollcallFromJson(json);
}
