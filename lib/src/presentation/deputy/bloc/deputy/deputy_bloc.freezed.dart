// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'deputy_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DeputyState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Deputy> get deputys => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, List<Deputy> deputys) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<Deputy> deputys)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<Deputy> deputys)? idle,
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
  $DeputyStateCopyWith<DeputyState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeputyStateCopyWith<$Res> {
  factory $DeputyStateCopyWith(
          DeputyState value, $Res Function(DeputyState) then) =
      _$DeputyStateCopyWithImpl<$Res, DeputyState>;
  @useResult
  $Res call({bool isLoading, List<Deputy> deputys});
}

/// @nodoc
class _$DeputyStateCopyWithImpl<$Res, $Val extends DeputyState>
    implements $DeputyStateCopyWith<$Res> {
  _$DeputyStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? deputys = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      deputys: null == deputys
          ? _value.deputys
          : deputys // ignore: cast_nullable_to_non_nullable
              as List<Deputy>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IdleCopyWith<$Res> implements $DeputyStateCopyWith<$Res> {
  factory _$$_IdleCopyWith(_$_Idle value, $Res Function(_$_Idle) then) =
      __$$_IdleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Deputy> deputys});
}

/// @nodoc
class __$$_IdleCopyWithImpl<$Res>
    extends _$DeputyStateCopyWithImpl<$Res, _$_Idle>
    implements _$$_IdleCopyWith<$Res> {
  __$$_IdleCopyWithImpl(_$_Idle _value, $Res Function(_$_Idle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? deputys = null,
  }) {
    return _then(_$_Idle(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      deputys: null == deputys
          ? _value._deputys
          : deputys // ignore: cast_nullable_to_non_nullable
              as List<Deputy>,
    ));
  }
}

/// @nodoc

class _$_Idle implements _Idle {
  const _$_Idle({this.isLoading = false, final List<Deputy> deputys = const []})
      : _deputys = deputys;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Deputy> _deputys;
  @override
  @JsonKey()
  List<Deputy> get deputys {
    if (_deputys is EqualUnmodifiableListView) return _deputys;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deputys);
  }

  @override
  String toString() {
    return 'DeputyState.idle(isLoading: $isLoading, deputys: $deputys)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Idle &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._deputys, _deputys));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_deputys));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdleCopyWith<_$_Idle> get copyWith =>
      __$$_IdleCopyWithImpl<_$_Idle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, List<Deputy> deputys) idle,
  }) {
    return idle(isLoading, deputys);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<Deputy> deputys)? idle,
  }) {
    return idle?.call(isLoading, deputys);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<Deputy> deputys)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(isLoading, deputys);
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

abstract class _Idle implements DeputyState {
  const factory _Idle({final bool isLoading, final List<Deputy> deputys}) =
      _$_Idle;

  @override
  bool get isLoading;
  @override
  List<Deputy> get deputys;
  @override
  @JsonKey(ignore: true)
  _$$_IdleCopyWith<_$_Idle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DeputyEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int deputyId) getClasses,
    required TResult Function(Deputy deputy) addDeputy,
    required TResult Function(int deputyId) removeDeputy,
    required TResult Function(Deputy deputy) updateDeputy,
    required TResult Function(int schoolId) getDeputys,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int deputyId)? getClasses,
    TResult? Function(Deputy deputy)? addDeputy,
    TResult? Function(int deputyId)? removeDeputy,
    TResult? Function(Deputy deputy)? updateDeputy,
    TResult? Function(int schoolId)? getDeputys,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int deputyId)? getClasses,
    TResult Function(Deputy deputy)? addDeputy,
    TResult Function(int deputyId)? removeDeputy,
    TResult Function(Deputy deputy)? updateDeputy,
    TResult Function(int schoolId)? getDeputys,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetClasses value) getClasses,
    required TResult Function(_AddDeputy value) addDeputy,
    required TResult Function(_RemoveDeputy value) removeDeputy,
    required TResult Function(_UpdateDeputy value) updateDeputy,
    required TResult Function(_GetDeputys value) getDeputys,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetClasses value)? getClasses,
    TResult? Function(_AddDeputy value)? addDeputy,
    TResult? Function(_RemoveDeputy value)? removeDeputy,
    TResult? Function(_UpdateDeputy value)? updateDeputy,
    TResult? Function(_GetDeputys value)? getDeputys,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetClasses value)? getClasses,
    TResult Function(_AddDeputy value)? addDeputy,
    TResult Function(_RemoveDeputy value)? removeDeputy,
    TResult Function(_UpdateDeputy value)? updateDeputy,
    TResult Function(_GetDeputys value)? getDeputys,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeputyEventCopyWith<$Res> {
  factory $DeputyEventCopyWith(
          DeputyEvent value, $Res Function(DeputyEvent) then) =
      _$DeputyEventCopyWithImpl<$Res, DeputyEvent>;
}

/// @nodoc
class _$DeputyEventCopyWithImpl<$Res, $Val extends DeputyEvent>
    implements $DeputyEventCopyWith<$Res> {
  _$DeputyEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetClassesCopyWith<$Res> {
  factory _$$_GetClassesCopyWith(
          _$_GetClasses value, $Res Function(_$_GetClasses) then) =
      __$$_GetClassesCopyWithImpl<$Res>;
  @useResult
  $Res call({int deputyId});
}

/// @nodoc
class __$$_GetClassesCopyWithImpl<$Res>
    extends _$DeputyEventCopyWithImpl<$Res, _$_GetClasses>
    implements _$$_GetClassesCopyWith<$Res> {
  __$$_GetClassesCopyWithImpl(
      _$_GetClasses _value, $Res Function(_$_GetClasses) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deputyId = null,
  }) {
    return _then(_$_GetClasses(
      null == deputyId
          ? _value.deputyId
          : deputyId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetClasses implements _GetClasses {
  const _$_GetClasses(this.deputyId);

  @override
  final int deputyId;

  @override
  String toString() {
    return 'DeputyEvent.getClasses(deputyId: $deputyId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetClasses &&
            (identical(other.deputyId, deputyId) ||
                other.deputyId == deputyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deputyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetClassesCopyWith<_$_GetClasses> get copyWith =>
      __$$_GetClassesCopyWithImpl<_$_GetClasses>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int deputyId) getClasses,
    required TResult Function(Deputy deputy) addDeputy,
    required TResult Function(int deputyId) removeDeputy,
    required TResult Function(Deputy deputy) updateDeputy,
    required TResult Function(int schoolId) getDeputys,
  }) {
    return getClasses(deputyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int deputyId)? getClasses,
    TResult? Function(Deputy deputy)? addDeputy,
    TResult? Function(int deputyId)? removeDeputy,
    TResult? Function(Deputy deputy)? updateDeputy,
    TResult? Function(int schoolId)? getDeputys,
  }) {
    return getClasses?.call(deputyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int deputyId)? getClasses,
    TResult Function(Deputy deputy)? addDeputy,
    TResult Function(int deputyId)? removeDeputy,
    TResult Function(Deputy deputy)? updateDeputy,
    TResult Function(int schoolId)? getDeputys,
    required TResult orElse(),
  }) {
    if (getClasses != null) {
      return getClasses(deputyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetClasses value) getClasses,
    required TResult Function(_AddDeputy value) addDeputy,
    required TResult Function(_RemoveDeputy value) removeDeputy,
    required TResult Function(_UpdateDeputy value) updateDeputy,
    required TResult Function(_GetDeputys value) getDeputys,
  }) {
    return getClasses(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetClasses value)? getClasses,
    TResult? Function(_AddDeputy value)? addDeputy,
    TResult? Function(_RemoveDeputy value)? removeDeputy,
    TResult? Function(_UpdateDeputy value)? updateDeputy,
    TResult? Function(_GetDeputys value)? getDeputys,
  }) {
    return getClasses?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetClasses value)? getClasses,
    TResult Function(_AddDeputy value)? addDeputy,
    TResult Function(_RemoveDeputy value)? removeDeputy,
    TResult Function(_UpdateDeputy value)? updateDeputy,
    TResult Function(_GetDeputys value)? getDeputys,
    required TResult orElse(),
  }) {
    if (getClasses != null) {
      return getClasses(this);
    }
    return orElse();
  }
}

abstract class _GetClasses implements DeputyEvent {
  const factory _GetClasses(final int deputyId) = _$_GetClasses;

  int get deputyId;
  @JsonKey(ignore: true)
  _$$_GetClassesCopyWith<_$_GetClasses> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddDeputyCopyWith<$Res> {
  factory _$$_AddDeputyCopyWith(
          _$_AddDeputy value, $Res Function(_$_AddDeputy) then) =
      __$$_AddDeputyCopyWithImpl<$Res>;
  @useResult
  $Res call({Deputy deputy});

  $DeputyCopyWith<$Res> get deputy;
}

/// @nodoc
class __$$_AddDeputyCopyWithImpl<$Res>
    extends _$DeputyEventCopyWithImpl<$Res, _$_AddDeputy>
    implements _$$_AddDeputyCopyWith<$Res> {
  __$$_AddDeputyCopyWithImpl(
      _$_AddDeputy _value, $Res Function(_$_AddDeputy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deputy = null,
  }) {
    return _then(_$_AddDeputy(
      null == deputy
          ? _value.deputy
          : deputy // ignore: cast_nullable_to_non_nullable
              as Deputy,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DeputyCopyWith<$Res> get deputy {
    return $DeputyCopyWith<$Res>(_value.deputy, (value) {
      return _then(_value.copyWith(deputy: value));
    });
  }
}

/// @nodoc

class _$_AddDeputy implements _AddDeputy {
  const _$_AddDeputy(this.deputy);

  @override
  final Deputy deputy;

  @override
  String toString() {
    return 'DeputyEvent.addDeputy(deputy: $deputy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddDeputy &&
            (identical(other.deputy, deputy) || other.deputy == deputy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deputy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddDeputyCopyWith<_$_AddDeputy> get copyWith =>
      __$$_AddDeputyCopyWithImpl<_$_AddDeputy>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int deputyId) getClasses,
    required TResult Function(Deputy deputy) addDeputy,
    required TResult Function(int deputyId) removeDeputy,
    required TResult Function(Deputy deputy) updateDeputy,
    required TResult Function(int schoolId) getDeputys,
  }) {
    return addDeputy(deputy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int deputyId)? getClasses,
    TResult? Function(Deputy deputy)? addDeputy,
    TResult? Function(int deputyId)? removeDeputy,
    TResult? Function(Deputy deputy)? updateDeputy,
    TResult? Function(int schoolId)? getDeputys,
  }) {
    return addDeputy?.call(deputy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int deputyId)? getClasses,
    TResult Function(Deputy deputy)? addDeputy,
    TResult Function(int deputyId)? removeDeputy,
    TResult Function(Deputy deputy)? updateDeputy,
    TResult Function(int schoolId)? getDeputys,
    required TResult orElse(),
  }) {
    if (addDeputy != null) {
      return addDeputy(deputy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetClasses value) getClasses,
    required TResult Function(_AddDeputy value) addDeputy,
    required TResult Function(_RemoveDeputy value) removeDeputy,
    required TResult Function(_UpdateDeputy value) updateDeputy,
    required TResult Function(_GetDeputys value) getDeputys,
  }) {
    return addDeputy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetClasses value)? getClasses,
    TResult? Function(_AddDeputy value)? addDeputy,
    TResult? Function(_RemoveDeputy value)? removeDeputy,
    TResult? Function(_UpdateDeputy value)? updateDeputy,
    TResult? Function(_GetDeputys value)? getDeputys,
  }) {
    return addDeputy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetClasses value)? getClasses,
    TResult Function(_AddDeputy value)? addDeputy,
    TResult Function(_RemoveDeputy value)? removeDeputy,
    TResult Function(_UpdateDeputy value)? updateDeputy,
    TResult Function(_GetDeputys value)? getDeputys,
    required TResult orElse(),
  }) {
    if (addDeputy != null) {
      return addDeputy(this);
    }
    return orElse();
  }
}

abstract class _AddDeputy implements DeputyEvent {
  const factory _AddDeputy(final Deputy deputy) = _$_AddDeputy;

  Deputy get deputy;
  @JsonKey(ignore: true)
  _$$_AddDeputyCopyWith<_$_AddDeputy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveDeputyCopyWith<$Res> {
  factory _$$_RemoveDeputyCopyWith(
          _$_RemoveDeputy value, $Res Function(_$_RemoveDeputy) then) =
      __$$_RemoveDeputyCopyWithImpl<$Res>;
  @useResult
  $Res call({int deputyId});
}

/// @nodoc
class __$$_RemoveDeputyCopyWithImpl<$Res>
    extends _$DeputyEventCopyWithImpl<$Res, _$_RemoveDeputy>
    implements _$$_RemoveDeputyCopyWith<$Res> {
  __$$_RemoveDeputyCopyWithImpl(
      _$_RemoveDeputy _value, $Res Function(_$_RemoveDeputy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deputyId = null,
  }) {
    return _then(_$_RemoveDeputy(
      null == deputyId
          ? _value.deputyId
          : deputyId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RemoveDeputy implements _RemoveDeputy {
  const _$_RemoveDeputy(this.deputyId);

  @override
  final int deputyId;

  @override
  String toString() {
    return 'DeputyEvent.removeDeputy(deputyId: $deputyId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveDeputy &&
            (identical(other.deputyId, deputyId) ||
                other.deputyId == deputyId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deputyId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveDeputyCopyWith<_$_RemoveDeputy> get copyWith =>
      __$$_RemoveDeputyCopyWithImpl<_$_RemoveDeputy>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int deputyId) getClasses,
    required TResult Function(Deputy deputy) addDeputy,
    required TResult Function(int deputyId) removeDeputy,
    required TResult Function(Deputy deputy) updateDeputy,
    required TResult Function(int schoolId) getDeputys,
  }) {
    return removeDeputy(deputyId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int deputyId)? getClasses,
    TResult? Function(Deputy deputy)? addDeputy,
    TResult? Function(int deputyId)? removeDeputy,
    TResult? Function(Deputy deputy)? updateDeputy,
    TResult? Function(int schoolId)? getDeputys,
  }) {
    return removeDeputy?.call(deputyId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int deputyId)? getClasses,
    TResult Function(Deputy deputy)? addDeputy,
    TResult Function(int deputyId)? removeDeputy,
    TResult Function(Deputy deputy)? updateDeputy,
    TResult Function(int schoolId)? getDeputys,
    required TResult orElse(),
  }) {
    if (removeDeputy != null) {
      return removeDeputy(deputyId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetClasses value) getClasses,
    required TResult Function(_AddDeputy value) addDeputy,
    required TResult Function(_RemoveDeputy value) removeDeputy,
    required TResult Function(_UpdateDeputy value) updateDeputy,
    required TResult Function(_GetDeputys value) getDeputys,
  }) {
    return removeDeputy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetClasses value)? getClasses,
    TResult? Function(_AddDeputy value)? addDeputy,
    TResult? Function(_RemoveDeputy value)? removeDeputy,
    TResult? Function(_UpdateDeputy value)? updateDeputy,
    TResult? Function(_GetDeputys value)? getDeputys,
  }) {
    return removeDeputy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetClasses value)? getClasses,
    TResult Function(_AddDeputy value)? addDeputy,
    TResult Function(_RemoveDeputy value)? removeDeputy,
    TResult Function(_UpdateDeputy value)? updateDeputy,
    TResult Function(_GetDeputys value)? getDeputys,
    required TResult orElse(),
  }) {
    if (removeDeputy != null) {
      return removeDeputy(this);
    }
    return orElse();
  }
}

abstract class _RemoveDeputy implements DeputyEvent {
  const factory _RemoveDeputy(final int deputyId) = _$_RemoveDeputy;

  int get deputyId;
  @JsonKey(ignore: true)
  _$$_RemoveDeputyCopyWith<_$_RemoveDeputy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateDeputyCopyWith<$Res> {
  factory _$$_UpdateDeputyCopyWith(
          _$_UpdateDeputy value, $Res Function(_$_UpdateDeputy) then) =
      __$$_UpdateDeputyCopyWithImpl<$Res>;
  @useResult
  $Res call({Deputy deputy});

  $DeputyCopyWith<$Res> get deputy;
}

/// @nodoc
class __$$_UpdateDeputyCopyWithImpl<$Res>
    extends _$DeputyEventCopyWithImpl<$Res, _$_UpdateDeputy>
    implements _$$_UpdateDeputyCopyWith<$Res> {
  __$$_UpdateDeputyCopyWithImpl(
      _$_UpdateDeputy _value, $Res Function(_$_UpdateDeputy) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? deputy = null,
  }) {
    return _then(_$_UpdateDeputy(
      null == deputy
          ? _value.deputy
          : deputy // ignore: cast_nullable_to_non_nullable
              as Deputy,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DeputyCopyWith<$Res> get deputy {
    return $DeputyCopyWith<$Res>(_value.deputy, (value) {
      return _then(_value.copyWith(deputy: value));
    });
  }
}

/// @nodoc

class _$_UpdateDeputy implements _UpdateDeputy {
  const _$_UpdateDeputy(this.deputy);

  @override
  final Deputy deputy;

  @override
  String toString() {
    return 'DeputyEvent.updateDeputy(deputy: $deputy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateDeputy &&
            (identical(other.deputy, deputy) || other.deputy == deputy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, deputy);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateDeputyCopyWith<_$_UpdateDeputy> get copyWith =>
      __$$_UpdateDeputyCopyWithImpl<_$_UpdateDeputy>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int deputyId) getClasses,
    required TResult Function(Deputy deputy) addDeputy,
    required TResult Function(int deputyId) removeDeputy,
    required TResult Function(Deputy deputy) updateDeputy,
    required TResult Function(int schoolId) getDeputys,
  }) {
    return updateDeputy(deputy);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int deputyId)? getClasses,
    TResult? Function(Deputy deputy)? addDeputy,
    TResult? Function(int deputyId)? removeDeputy,
    TResult? Function(Deputy deputy)? updateDeputy,
    TResult? Function(int schoolId)? getDeputys,
  }) {
    return updateDeputy?.call(deputy);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int deputyId)? getClasses,
    TResult Function(Deputy deputy)? addDeputy,
    TResult Function(int deputyId)? removeDeputy,
    TResult Function(Deputy deputy)? updateDeputy,
    TResult Function(int schoolId)? getDeputys,
    required TResult orElse(),
  }) {
    if (updateDeputy != null) {
      return updateDeputy(deputy);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetClasses value) getClasses,
    required TResult Function(_AddDeputy value) addDeputy,
    required TResult Function(_RemoveDeputy value) removeDeputy,
    required TResult Function(_UpdateDeputy value) updateDeputy,
    required TResult Function(_GetDeputys value) getDeputys,
  }) {
    return updateDeputy(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetClasses value)? getClasses,
    TResult? Function(_AddDeputy value)? addDeputy,
    TResult? Function(_RemoveDeputy value)? removeDeputy,
    TResult? Function(_UpdateDeputy value)? updateDeputy,
    TResult? Function(_GetDeputys value)? getDeputys,
  }) {
    return updateDeputy?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetClasses value)? getClasses,
    TResult Function(_AddDeputy value)? addDeputy,
    TResult Function(_RemoveDeputy value)? removeDeputy,
    TResult Function(_UpdateDeputy value)? updateDeputy,
    TResult Function(_GetDeputys value)? getDeputys,
    required TResult orElse(),
  }) {
    if (updateDeputy != null) {
      return updateDeputy(this);
    }
    return orElse();
  }
}

abstract class _UpdateDeputy implements DeputyEvent {
  const factory _UpdateDeputy(final Deputy deputy) = _$_UpdateDeputy;

  Deputy get deputy;
  @JsonKey(ignore: true)
  _$$_UpdateDeputyCopyWith<_$_UpdateDeputy> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_GetDeputysCopyWith<$Res> {
  factory _$$_GetDeputysCopyWith(
          _$_GetDeputys value, $Res Function(_$_GetDeputys) then) =
      __$$_GetDeputysCopyWithImpl<$Res>;
  @useResult
  $Res call({int schoolId});
}

/// @nodoc
class __$$_GetDeputysCopyWithImpl<$Res>
    extends _$DeputyEventCopyWithImpl<$Res, _$_GetDeputys>
    implements _$$_GetDeputysCopyWith<$Res> {
  __$$_GetDeputysCopyWithImpl(
      _$_GetDeputys _value, $Res Function(_$_GetDeputys) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? schoolId = null,
  }) {
    return _then(_$_GetDeputys(
      null == schoolId
          ? _value.schoolId
          : schoolId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_GetDeputys implements _GetDeputys {
  const _$_GetDeputys(this.schoolId);

  @override
  final int schoolId;

  @override
  String toString() {
    return 'DeputyEvent.getDeputys(schoolId: $schoolId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GetDeputys &&
            (identical(other.schoolId, schoolId) ||
                other.schoolId == schoolId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, schoolId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GetDeputysCopyWith<_$_GetDeputys> get copyWith =>
      __$$_GetDeputysCopyWithImpl<_$_GetDeputys>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int deputyId) getClasses,
    required TResult Function(Deputy deputy) addDeputy,
    required TResult Function(int deputyId) removeDeputy,
    required TResult Function(Deputy deputy) updateDeputy,
    required TResult Function(int schoolId) getDeputys,
  }) {
    return getDeputys(schoolId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int deputyId)? getClasses,
    TResult? Function(Deputy deputy)? addDeputy,
    TResult? Function(int deputyId)? removeDeputy,
    TResult? Function(Deputy deputy)? updateDeputy,
    TResult? Function(int schoolId)? getDeputys,
  }) {
    return getDeputys?.call(schoolId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int deputyId)? getClasses,
    TResult Function(Deputy deputy)? addDeputy,
    TResult Function(int deputyId)? removeDeputy,
    TResult Function(Deputy deputy)? updateDeputy,
    TResult Function(int schoolId)? getDeputys,
    required TResult orElse(),
  }) {
    if (getDeputys != null) {
      return getDeputys(schoolId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetClasses value) getClasses,
    required TResult Function(_AddDeputy value) addDeputy,
    required TResult Function(_RemoveDeputy value) removeDeputy,
    required TResult Function(_UpdateDeputy value) updateDeputy,
    required TResult Function(_GetDeputys value) getDeputys,
  }) {
    return getDeputys(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetClasses value)? getClasses,
    TResult? Function(_AddDeputy value)? addDeputy,
    TResult? Function(_RemoveDeputy value)? removeDeputy,
    TResult? Function(_UpdateDeputy value)? updateDeputy,
    TResult? Function(_GetDeputys value)? getDeputys,
  }) {
    return getDeputys?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetClasses value)? getClasses,
    TResult Function(_AddDeputy value)? addDeputy,
    TResult Function(_RemoveDeputy value)? removeDeputy,
    TResult Function(_UpdateDeputy value)? updateDeputy,
    TResult Function(_GetDeputys value)? getDeputys,
    required TResult orElse(),
  }) {
    if (getDeputys != null) {
      return getDeputys(this);
    }
    return orElse();
  }
}

abstract class _GetDeputys implements DeputyEvent {
  const factory _GetDeputys(final int schoolId) = _$_GetDeputys;

  int get schoolId;
  @JsonKey(ignore: true)
  _$$_GetDeputysCopyWith<_$_GetDeputys> get copyWith =>
      throw _privateConstructorUsedError;
}
