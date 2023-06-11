// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deputy.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Deputy _$DeputyFromJson(Map<String, dynamic> json) {
  return _Deputy.fromJson(json);
}

/// @nodoc
mixin _$Deputy {
// account email
  @HiveField(0)
  @JsonKey(name: 'deputyId', defaultValue: 0)
  int get deputyId => throw _privateConstructorUsedError; // account password
  @HiveField(1)
  @JsonKey(name: 'schoolId', defaultValue: 0)
  int get schoolId => throw _privateConstructorUsedError; // basic Information
  @HiveField(2)
  @JsonKey(name: 'basicInfo')
  BasicInfoModel? get basicInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeputyCopyWith<Deputy> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeputyCopyWith<$Res> {
  factory $DeputyCopyWith(Deputy value, $Res Function(Deputy) then) =
      _$DeputyCopyWithImpl<$Res, Deputy>;
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'deputyId', defaultValue: 0) int deputyId,
      @HiveField(1) @JsonKey(name: 'schoolId', defaultValue: 0) int schoolId,
      @HiveField(2) @JsonKey(name: 'basicInfo') BasicInfoModel? basicInfo});
}

/// @nodoc
class _$DeputyCopyWithImpl<$Res, $Val extends Deputy>
    implements $DeputyCopyWith<$Res> {
  _$DeputyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deputyId = null,
    Object? schoolId = null,
    Object? basicInfo = freezed,
  }) {
    return _then(_value.copyWith(
      deputyId: null == deputyId
          ? _value.deputyId
          : deputyId // ignore: cast_nullable_to_non_nullable
              as int,
      schoolId: null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int,
      basicInfo: freezed == basicInfo
          ? _value.basicInfo
          : basicInfo // ignore: cast_nullable_to_non_nullable
              as BasicInfoModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeputyCopyWith<$Res> implements $DeputyCopyWith<$Res> {
  factory _$$_DeputyCopyWith(_$_Deputy value, $Res Function(_$_Deputy) then) =
      __$$_DeputyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) @JsonKey(name: 'deputyId', defaultValue: 0) int deputyId,
      @HiveField(1) @JsonKey(name: 'schoolId', defaultValue: 0) int schoolId,
      @HiveField(2) @JsonKey(name: 'basicInfo') BasicInfoModel? basicInfo});
}

/// @nodoc
class __$$_DeputyCopyWithImpl<$Res>
    extends _$DeputyCopyWithImpl<$Res, _$_Deputy>
    implements _$$_DeputyCopyWith<$Res> {
  __$$_DeputyCopyWithImpl(_$_Deputy _value, $Res Function(_$_Deputy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deputyId = null,
    Object? schoolId = null,
    Object? basicInfo = freezed,
  }) {
    return _then(_$_Deputy(
      deputyId: null == deputyId
          ? _value.deputyId
          : deputyId // ignore: cast_nullable_to_non_nullable
              as int,
      schoolId: null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int,
      basicInfo: freezed == basicInfo
          ? _value.basicInfo
          : basicInfo // ignore: cast_nullable_to_non_nullable
              as BasicInfoModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Deputy implements _Deputy {
  _$_Deputy(
      {@HiveField(0)
      @JsonKey(name: 'deputyId', defaultValue: 0)
          this.deputyId = 0,
      @HiveField(1)
      @JsonKey(name: 'schoolId', defaultValue: 0)
          this.schoolId = 0,
      @HiveField(2)
      @JsonKey(name: 'basicInfo')
          this.basicInfo});

  factory _$_Deputy.fromJson(Map<String, dynamic> json) =>
      _$$_DeputyFromJson(json);

// account email
  @override
  @HiveField(0)
  @JsonKey(name: 'deputyId', defaultValue: 0)
  final int deputyId;
// account password
  @override
  @HiveField(1)
  @JsonKey(name: 'schoolId', defaultValue: 0)
  final int schoolId;
// basic Information
  @override
  @HiveField(2)
  @JsonKey(name: 'basicInfo')
  final BasicInfoModel? basicInfo;

  @override
  String toString() {
    return 'Deputy(deputyId: $deputyId, schoolId: $schoolId, basicInfo: $basicInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Deputy &&
            (identical(other.deputyId, deputyId) ||
                other.deputyId == deputyId) &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            (identical(other.basicInfo, basicInfo) ||
                other.basicInfo == basicInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, deputyId, schoolId, basicInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeputyCopyWith<_$_Deputy> get copyWith =>
      __$$_DeputyCopyWithImpl<_$_Deputy>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeputyToJson(
      this,
    );
  }
}

abstract class _Deputy implements Deputy {
  factory _Deputy(
      {@HiveField(0)
      @JsonKey(name: 'deputyId', defaultValue: 0)
          final int deputyId,
      @HiveField(1)
      @JsonKey(name: 'schoolId', defaultValue: 0)
          final int schoolId,
      @HiveField(2)
      @JsonKey(name: 'basicInfo')
          final BasicInfoModel? basicInfo}) = _$_Deputy;

  factory _Deputy.fromJson(Map<String, dynamic> json) = _$_Deputy.fromJson;

  @override // account email
  @HiveField(0)
  @JsonKey(name: 'deputyId', defaultValue: 0)
  int get deputyId;
  @override // account password
  @HiveField(1)
  @JsonKey(name: 'schoolId', defaultValue: 0)
  int get schoolId;
  @override // basic Information
  @HiveField(2)
  @JsonKey(name: 'basicInfo')
  BasicInfoModel? get basicInfo;
  @override
  @JsonKey(ignore: true)
  _$$_DeputyCopyWith<_$_Deputy> get copyWith =>
      throw _privateConstructorUsedError;
}
