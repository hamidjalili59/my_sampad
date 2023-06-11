// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_rollcall_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TeacherRollcall _$TeacherRollcallFromJson(Map<String, dynamic> json) {
  return _TeacherRollcall.fromJson(json);
}

/// @nodoc
mixin _$TeacherRollcall {
// account email
  @HiveField(0, defaultValue: 0)
  @JsonKey(name: 'rollCall_ID')
  int get rolecallId => throw _privateConstructorUsedError; //
  @HiveField(1, defaultValue: 0)
  @JsonKey(name: 'school_ID')
  int get schoolId => throw _privateConstructorUsedError; // basic Information
  @HiveField(2, defaultValue: 0.0)
  @JsonKey(name: 'phoneNumber')
  double get phoneNumber =>
      throw _privateConstructorUsedError; // basic Information
  @HiveField(3, defaultValue: false)
  @JsonKey(name: 'absent')
  bool get absent => throw _privateConstructorUsedError; // basic Information
  @HiveField(4, defaultValue: '')
  @JsonKey(name: 'date')
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TeacherRollcallCopyWith<TeacherRollcall> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherRollcallCopyWith<$Res> {
  factory $TeacherRollcallCopyWith(
          TeacherRollcall value, $Res Function(TeacherRollcall) then) =
      _$TeacherRollcallCopyWithImpl<$Res, TeacherRollcall>;
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: 0)
      @JsonKey(name: 'rollCall_ID')
          int rolecallId,
      @HiveField(1, defaultValue: 0)
      @JsonKey(name: 'school_ID')
          int schoolId,
      @HiveField(2, defaultValue: 0.0)
      @JsonKey(name: 'phoneNumber')
          double phoneNumber,
      @HiveField(3, defaultValue: false)
      @JsonKey(name: 'absent')
          bool absent,
      @HiveField(4, defaultValue: '')
      @JsonKey(name: 'date')
          String date});
}

/// @nodoc
class _$TeacherRollcallCopyWithImpl<$Res, $Val extends TeacherRollcall>
    implements $TeacherRollcallCopyWith<$Res> {
  _$TeacherRollcallCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rolecallId = null,
    Object? schoolId = null,
    Object? phoneNumber = null,
    Object? absent = null,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      rolecallId: null == rolecallId
          ? _value.rolecallId
          : rolecallId // ignore: cast_nullable_to_non_nullable
              as int,
      schoolId: null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as double,
      absent: null == absent
          ? _value.absent
          : absent // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TeacherRollcallCopyWith<$Res>
    implements $TeacherRollcallCopyWith<$Res> {
  factory _$$_TeacherRollcallCopyWith(
          _$_TeacherRollcall value, $Res Function(_$_TeacherRollcall) then) =
      __$$_TeacherRollcallCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0, defaultValue: 0)
      @JsonKey(name: 'rollCall_ID')
          int rolecallId,
      @HiveField(1, defaultValue: 0)
      @JsonKey(name: 'school_ID')
          int schoolId,
      @HiveField(2, defaultValue: 0.0)
      @JsonKey(name: 'phoneNumber')
          double phoneNumber,
      @HiveField(3, defaultValue: false)
      @JsonKey(name: 'absent')
          bool absent,
      @HiveField(4, defaultValue: '')
      @JsonKey(name: 'date')
          String date});
}

/// @nodoc
class __$$_TeacherRollcallCopyWithImpl<$Res>
    extends _$TeacherRollcallCopyWithImpl<$Res, _$_TeacherRollcall>
    implements _$$_TeacherRollcallCopyWith<$Res> {
  __$$_TeacherRollcallCopyWithImpl(
      _$_TeacherRollcall _value, $Res Function(_$_TeacherRollcall) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rolecallId = null,
    Object? schoolId = null,
    Object? phoneNumber = null,
    Object? absent = null,
    Object? date = null,
  }) {
    return _then(_$_TeacherRollcall(
      rolecallId: null == rolecallId
          ? _value.rolecallId
          : rolecallId // ignore: cast_nullable_to_non_nullable
              as int,
      schoolId: null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as double,
      absent: null == absent
          ? _value.absent
          : absent // ignore: cast_nullable_to_non_nullable
              as bool,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TeacherRollcall implements _TeacherRollcall {
  _$_TeacherRollcall(
      {@HiveField(0, defaultValue: 0)
      @JsonKey(name: 'rollCall_ID')
          this.rolecallId = 0,
      @HiveField(1, defaultValue: 0)
      @JsonKey(name: 'school_ID')
          this.schoolId = 0,
      @HiveField(2, defaultValue: 0.0)
      @JsonKey(name: 'phoneNumber')
          this.phoneNumber = 0.0,
      @HiveField(3, defaultValue: false)
      @JsonKey(name: 'absent')
          this.absent = false,
      @HiveField(4, defaultValue: '')
      @JsonKey(name: 'date')
          this.date = ''});

  factory _$_TeacherRollcall.fromJson(Map<String, dynamic> json) =>
      _$$_TeacherRollcallFromJson(json);

// account email
  @override
  @HiveField(0, defaultValue: 0)
  @JsonKey(name: 'rollCall_ID')
  final int rolecallId;
//
  @override
  @HiveField(1, defaultValue: 0)
  @JsonKey(name: 'school_ID')
  final int schoolId;
// basic Information
  @override
  @HiveField(2, defaultValue: 0.0)
  @JsonKey(name: 'phoneNumber')
  final double phoneNumber;
// basic Information
  @override
  @HiveField(3, defaultValue: false)
  @JsonKey(name: 'absent')
  final bool absent;
// basic Information
  @override
  @HiveField(4, defaultValue: '')
  @JsonKey(name: 'date')
  final String date;

  @override
  String toString() {
    return 'TeacherRollcall(rolecallId: $rolecallId, schoolId: $schoolId, phoneNumber: $phoneNumber, absent: $absent, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TeacherRollcall &&
            (identical(other.rolecallId, rolecallId) ||
                other.rolecallId == rolecallId) &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.absent, absent) || other.absent == absent) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, rolecallId, schoolId, phoneNumber, absent, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TeacherRollcallCopyWith<_$_TeacherRollcall> get copyWith =>
      __$$_TeacherRollcallCopyWithImpl<_$_TeacherRollcall>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TeacherRollcallToJson(
      this,
    );
  }
}

abstract class _TeacherRollcall implements TeacherRollcall {
  factory _TeacherRollcall(
      {@HiveField(0, defaultValue: 0)
      @JsonKey(name: 'rollCall_ID')
          final int rolecallId,
      @HiveField(1, defaultValue: 0)
      @JsonKey(name: 'school_ID')
          final int schoolId,
      @HiveField(2, defaultValue: 0.0)
      @JsonKey(name: 'phoneNumber')
          final double phoneNumber,
      @HiveField(3, defaultValue: false)
      @JsonKey(name: 'absent')
          final bool absent,
      @HiveField(4, defaultValue: '')
      @JsonKey(name: 'date')
          final String date}) = _$_TeacherRollcall;

  factory _TeacherRollcall.fromJson(Map<String, dynamic> json) =
      _$_TeacherRollcall.fromJson;

  @override // account email
  @HiveField(0, defaultValue: 0)
  @JsonKey(name: 'rollCall_ID')
  int get rolecallId;
  @override //
  @HiveField(1, defaultValue: 0)
  @JsonKey(name: 'school_ID')
  int get schoolId;
  @override // basic Information
  @HiveField(2, defaultValue: 0.0)
  @JsonKey(name: 'phoneNumber')
  double get phoneNumber;
  @override // basic Information
  @HiveField(3, defaultValue: false)
  @JsonKey(name: 'absent')
  bool get absent;
  @override // basic Information
  @HiveField(4, defaultValue: '')
  @JsonKey(name: 'date')
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_TeacherRollcallCopyWith<_$_TeacherRollcall> get copyWith =>
      throw _privateConstructorUsedError;
}
