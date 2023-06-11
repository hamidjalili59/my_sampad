// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'teacher_rollcall_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TeacherRollcallState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<TeacherRollcall> get rollcalls => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, List<TeacherRollcall> rollcalls)
        idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<TeacherRollcall> rollcalls)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<TeacherRollcall> rollcalls)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TeacherRollcallStateCopyWith<TeacherRollcallState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherRollcallStateCopyWith<$Res> {
  factory $TeacherRollcallStateCopyWith(TeacherRollcallState value,
          $Res Function(TeacherRollcallState) then) =
      _$TeacherRollcallStateCopyWithImpl<$Res, TeacherRollcallState>;
  @useResult
  $Res call({bool isLoading, List<TeacherRollcall> rollcalls});
}

/// @nodoc
class _$TeacherRollcallStateCopyWithImpl<$Res,
        $Val extends TeacherRollcallState>
    implements $TeacherRollcallStateCopyWith<$Res> {
  _$TeacherRollcallStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? rollcalls = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      rollcalls: null == rollcalls
          ? _value.rollcalls
          : rollcalls // ignore: cast_nullable_to_non_nullable
              as List<TeacherRollcall>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IdleCopyWith<$Res>
    implements $TeacherRollcallStateCopyWith<$Res> {
  factory _$$_IdleCopyWith(_$_Idle value, $Res Function(_$_Idle) then) =
      __$$_IdleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<TeacherRollcall> rollcalls});
}

/// @nodoc
class __$$_IdleCopyWithImpl<$Res>
    extends _$TeacherRollcallStateCopyWithImpl<$Res, _$_Idle>
    implements _$$_IdleCopyWith<$Res> {
  __$$_IdleCopyWithImpl(_$_Idle _value, $Res Function(_$_Idle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? rollcalls = null,
  }) {
    return _then(_$_Idle(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      rollcalls: null == rollcalls
          ? _value._rollcalls
          : rollcalls // ignore: cast_nullable_to_non_nullable
              as List<TeacherRollcall>,
    ));
  }
}

/// @nodoc

class _$_Idle implements _Idle {
  const _$_Idle(
      {this.isLoading = false,
      final List<TeacherRollcall> rollcalls = const []})
      : _rollcalls = rollcalls;

  @override
  @JsonKey()
  final bool isLoading;
  final List<TeacherRollcall> _rollcalls;
  @override
  @JsonKey()
  List<TeacherRollcall> get rollcalls {
    if (_rollcalls is EqualUnmodifiableListView) return _rollcalls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rollcalls);
  }

  @override
  String toString() {
    return 'TeacherRollcallState.idle(isLoading: $isLoading, rollcalls: $rollcalls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Idle &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality()
                .equals(other._rollcalls, _rollcalls));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_rollcalls));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdleCopyWith<_$_Idle> get copyWith =>
      __$$_IdleCopyWithImpl<_$_Idle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, List<TeacherRollcall> rollcalls)
        idle,
  }) {
    return idle(isLoading, rollcalls);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<TeacherRollcall> rollcalls)? idle,
  }) {
    return idle?.call(isLoading, rollcalls);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<TeacherRollcall> rollcalls)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(isLoading, rollcalls);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Idle value)? idle,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements TeacherRollcallState {
  const factory _Idle(
      {final bool isLoading, final List<TeacherRollcall> rollcalls}) = _$_Idle;

  @override
  bool get isLoading;
  @override
  List<TeacherRollcall> get rollcalls;
  @override
  @JsonKey(ignore: true)
  _$$_IdleCopyWith<_$_Idle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TeacherRollcallEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int schoolId, double phoneNumber) getRollcalls,
    required TResult Function(TeacherRollcall rollcalls) addRollcall,
    required TResult Function() onStartPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int schoolId, double phoneNumber)? getRollcalls,
    TResult? Function(TeacherRollcall rollcalls)? addRollcall,
    TResult? Function()? onStartPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int schoolId, double phoneNumber)? getRollcalls,
    TResult Function(TeacherRollcall rollcalls)? addRollcall,
    TResult Function()? onStartPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRollcalls value) getRollcalls,
    required TResult Function(_AddRollcall value) addRollcall,
    required TResult Function(_OnStartPage value) onStartPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRollcalls value)? getRollcalls,
    TResult? Function(_AddRollcall value)? addRollcall,
    TResult? Function(_OnStartPage value)? onStartPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRollcalls value)? getRollcalls,
    TResult Function(_AddRollcall value)? addRollcall,
    TResult Function(_OnStartPage value)? onStartPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TeacherRollcallEventCopyWith<$Res> {
  factory $TeacherRollcallEventCopyWith(TeacherRollcallEvent value,
          $Res Function(TeacherRollcallEvent) then) =
      _$TeacherRollcallEventCopyWithImpl<$Res, TeacherRollcallEvent>;
}

/// @nodoc
class _$TeacherRollcallEventCopyWithImpl<$Res,
        $Val extends TeacherRollcallEvent>
    implements $TeacherRollcallEventCopyWith<$Res> {
  _$TeacherRollcallEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetRollcallsCopyWith<$Res> {
  factory _$$_GetRollcallsCopyWith(
          _$_GetRollcalls value, $Res Function(_$_GetRollcalls) then) =
      __$$_GetRollcallsCopyWithImpl<$Res>;
  @useResult
  $Res call({int schoolId, double phoneNumber});
}

/// @nodoc
class __$$_GetRollcallsCopyWithImpl<$Res>
    extends _$TeacherRollcallEventCopyWithImpl<$Res, _$_GetRollcalls>
    implements _$$_GetRollcallsCopyWith<$Res> {
  __$$_GetRollcallsCopyWithImpl(
      _$_GetRollcalls _value, $Res Function(_$_GetRollcalls) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schoolId = null,
    Object? phoneNumber = null,
  }) {
    return _then(_$_GetRollcalls(
      null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int,
      null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_GetRollcalls implements _GetRollcalls {
  const _$_GetRollcalls(this.schoolId, this.phoneNumber);

  @override
  final int schoolId;
  @override
  final double phoneNumber;

  @override
  String toString() {
    return 'TeacherRollcallEvent.getRollcalls(schoolId: $schoolId, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetRollcalls &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schoolId, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetRollcallsCopyWith<_$_GetRollcalls> get copyWith =>
      __$$_GetRollcallsCopyWithImpl<_$_GetRollcalls>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int schoolId, double phoneNumber) getRollcalls,
    required TResult Function(TeacherRollcall rollcalls) addRollcall,
    required TResult Function() onStartPage,
  }) {
    return getRollcalls(schoolId, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int schoolId, double phoneNumber)? getRollcalls,
    TResult? Function(TeacherRollcall rollcalls)? addRollcall,
    TResult? Function()? onStartPage,
  }) {
    return getRollcalls?.call(schoolId, phoneNumber);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int schoolId, double phoneNumber)? getRollcalls,
    TResult Function(TeacherRollcall rollcalls)? addRollcall,
    TResult Function()? onStartPage,
    required TResult orElse(),
  }) {
    if (getRollcalls != null) {
      return getRollcalls(schoolId, phoneNumber);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRollcalls value) getRollcalls,
    required TResult Function(_AddRollcall value) addRollcall,
    required TResult Function(_OnStartPage value) onStartPage,
  }) {
    return getRollcalls(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRollcalls value)? getRollcalls,
    TResult? Function(_AddRollcall value)? addRollcall,
    TResult? Function(_OnStartPage value)? onStartPage,
  }) {
    return getRollcalls?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRollcalls value)? getRollcalls,
    TResult Function(_AddRollcall value)? addRollcall,
    TResult Function(_OnStartPage value)? onStartPage,
    required TResult orElse(),
  }) {
    if (getRollcalls != null) {
      return getRollcalls(this);
    }
    return orElse();
  }
}

abstract class _GetRollcalls implements TeacherRollcallEvent {
  const factory _GetRollcalls(final int schoolId, final double phoneNumber) =
      _$_GetRollcalls;

  int get schoolId;
  double get phoneNumber;
  @JsonKey(ignore: true)
  _$$_GetRollcallsCopyWith<_$_GetRollcalls> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddRollcallCopyWith<$Res> {
  factory _$$_AddRollcallCopyWith(
          _$_AddRollcall value, $Res Function(_$_AddRollcall) then) =
      __$$_AddRollcallCopyWithImpl<$Res>;
  @useResult
  $Res call({TeacherRollcall rollcalls});

  $TeacherRollcallCopyWith<$Res> get rollcalls;
}

/// @nodoc
class __$$_AddRollcallCopyWithImpl<$Res>
    extends _$TeacherRollcallEventCopyWithImpl<$Res, _$_AddRollcall>
    implements _$$_AddRollcallCopyWith<$Res> {
  __$$_AddRollcallCopyWithImpl(
      _$_AddRollcall _value, $Res Function(_$_AddRollcall) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rollcalls = null,
  }) {
    return _then(_$_AddRollcall(
      null == rollcalls
          ? _value.rollcalls
          : rollcalls // ignore: cast_nullable_to_non_nullable
              as TeacherRollcall,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TeacherRollcallCopyWith<$Res> get rollcalls {
    return $TeacherRollcallCopyWith<$Res>(_value.rollcalls, (value) {
      return _then(_value.copyWith(rollcalls: value));
    });
  }
}

/// @nodoc

class _$_AddRollcall implements _AddRollcall {
  const _$_AddRollcall(this.rollcalls);

  @override
  final TeacherRollcall rollcalls;

  @override
  String toString() {
    return 'TeacherRollcallEvent.addRollcall(rollcalls: $rollcalls)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddRollcall &&
            (identical(other.rollcalls, rollcalls) ||
                other.rollcalls == rollcalls));
  }

  @override
  int get hashCode => Object.hash(runtimeType, rollcalls);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddRollcallCopyWith<_$_AddRollcall> get copyWith =>
      __$$_AddRollcallCopyWithImpl<_$_AddRollcall>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int schoolId, double phoneNumber) getRollcalls,
    required TResult Function(TeacherRollcall rollcalls) addRollcall,
    required TResult Function() onStartPage,
  }) {
    return addRollcall(rollcalls);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int schoolId, double phoneNumber)? getRollcalls,
    TResult? Function(TeacherRollcall rollcalls)? addRollcall,
    TResult? Function()? onStartPage,
  }) {
    return addRollcall?.call(rollcalls);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int schoolId, double phoneNumber)? getRollcalls,
    TResult Function(TeacherRollcall rollcalls)? addRollcall,
    TResult Function()? onStartPage,
    required TResult orElse(),
  }) {
    if (addRollcall != null) {
      return addRollcall(rollcalls);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRollcalls value) getRollcalls,
    required TResult Function(_AddRollcall value) addRollcall,
    required TResult Function(_OnStartPage value) onStartPage,
  }) {
    return addRollcall(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRollcalls value)? getRollcalls,
    TResult? Function(_AddRollcall value)? addRollcall,
    TResult? Function(_OnStartPage value)? onStartPage,
  }) {
    return addRollcall?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRollcalls value)? getRollcalls,
    TResult Function(_AddRollcall value)? addRollcall,
    TResult Function(_OnStartPage value)? onStartPage,
    required TResult orElse(),
  }) {
    if (addRollcall != null) {
      return addRollcall(this);
    }
    return orElse();
  }
}

abstract class _AddRollcall implements TeacherRollcallEvent {
  const factory _AddRollcall(final TeacherRollcall rollcalls) = _$_AddRollcall;

  TeacherRollcall get rollcalls;
  @JsonKey(ignore: true)
  _$$_AddRollcallCopyWith<_$_AddRollcall> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_OnStartPageCopyWith<$Res> {
  factory _$$_OnStartPageCopyWith(
          _$_OnStartPage value, $Res Function(_$_OnStartPage) then) =
      __$$_OnStartPageCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnStartPageCopyWithImpl<$Res>
    extends _$TeacherRollcallEventCopyWithImpl<$Res, _$_OnStartPage>
    implements _$$_OnStartPageCopyWith<$Res> {
  __$$_OnStartPageCopyWithImpl(
      _$_OnStartPage _value, $Res Function(_$_OnStartPage) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OnStartPage implements _OnStartPage {
  const _$_OnStartPage();

  @override
  String toString() {
    return 'TeacherRollcallEvent.onStartPage()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnStartPage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int schoolId, double phoneNumber) getRollcalls,
    required TResult Function(TeacherRollcall rollcalls) addRollcall,
    required TResult Function() onStartPage,
  }) {
    return onStartPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int schoolId, double phoneNumber)? getRollcalls,
    TResult? Function(TeacherRollcall rollcalls)? addRollcall,
    TResult? Function()? onStartPage,
  }) {
    return onStartPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int schoolId, double phoneNumber)? getRollcalls,
    TResult Function(TeacherRollcall rollcalls)? addRollcall,
    TResult Function()? onStartPage,
    required TResult orElse(),
  }) {
    if (onStartPage != null) {
      return onStartPage();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetRollcalls value) getRollcalls,
    required TResult Function(_AddRollcall value) addRollcall,
    required TResult Function(_OnStartPage value) onStartPage,
  }) {
    return onStartPage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetRollcalls value)? getRollcalls,
    TResult? Function(_AddRollcall value)? addRollcall,
    TResult? Function(_OnStartPage value)? onStartPage,
  }) {
    return onStartPage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetRollcalls value)? getRollcalls,
    TResult Function(_AddRollcall value)? addRollcall,
    TResult Function(_OnStartPage value)? onStartPage,
    required TResult orElse(),
  }) {
    if (onStartPage != null) {
      return onStartPage(this);
    }
    return orElse();
  }
}

abstract class _OnStartPage implements TeacherRollcallEvent {
  const factory _OnStartPage() = _$_OnStartPage;
}
