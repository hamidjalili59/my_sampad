// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exam_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ExamState {
  bool get isLoading => throw _privateConstructorUsedError;
  List<Exam> get exams => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, List<Exam> exams) idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<Exam> exams)? idle,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<Exam> exams)? idle,
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
  $ExamStateCopyWith<ExamState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamStateCopyWith<$Res> {
  factory $ExamStateCopyWith(ExamState value, $Res Function(ExamState) then) =
      _$ExamStateCopyWithImpl<$Res, ExamState>;
  @useResult
  $Res call({bool isLoading, List<Exam> exams});
}

/// @nodoc
class _$ExamStateCopyWithImpl<$Res, $Val extends ExamState>
    implements $ExamStateCopyWith<$Res> {
  _$ExamStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? exams = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      exams: null == exams
          ? _value.exams
          : exams // ignore: cast_nullable_to_non_nullable
              as List<Exam>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IdleCopyWith<$Res> implements $ExamStateCopyWith<$Res> {
  factory _$$_IdleCopyWith(_$_Idle value, $Res Function(_$_Idle) then) =
      __$$_IdleCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, List<Exam> exams});
}

/// @nodoc
class __$$_IdleCopyWithImpl<$Res> extends _$ExamStateCopyWithImpl<$Res, _$_Idle>
    implements _$$_IdleCopyWith<$Res> {
  __$$_IdleCopyWithImpl(_$_Idle _value, $Res Function(_$_Idle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? exams = null,
  }) {
    return _then(_$_Idle(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      exams: null == exams
          ? _value._exams
          : exams // ignore: cast_nullable_to_non_nullable
              as List<Exam>,
    ));
  }
}

/// @nodoc

class _$_Idle implements _Idle {
  const _$_Idle({this.isLoading = false, final List<Exam> exams = const []})
      : _exams = exams;

  @override
  @JsonKey()
  final bool isLoading;
  final List<Exam> _exams;
  @override
  @JsonKey()
  List<Exam> get exams {
    if (_exams is EqualUnmodifiableListView) return _exams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_exams);
  }

  @override
  String toString() {
    return 'ExamState.idle(isLoading: $isLoading, exams: $exams)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Idle &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            const DeepCollectionEquality().equals(other._exams, _exams));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, const DeepCollectionEquality().hash(_exams));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IdleCopyWith<_$_Idle> get copyWith =>
      __$$_IdleCopyWithImpl<_$_Idle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isLoading, List<Exam> exams) idle,
  }) {
    return idle(isLoading, exams);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isLoading, List<Exam> exams)? idle,
  }) {
    return idle?.call(isLoading, exams);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isLoading, List<Exam> exams)? idle,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(isLoading, exams);
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

abstract class _Idle implements ExamState {
  const factory _Idle({final bool isLoading, final List<Exam> exams}) = _$_Idle;

  @override
  bool get isLoading;
  @override
  List<Exam> get exams;
  @override
  @JsonKey(ignore: true)
  _$$_IdleCopyWith<_$_Idle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExamEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getExams,
    required TResult Function(int examId) removeExam,
    required TResult Function(Exam exam) acceptExam,
    required TResult Function(Exam exam) updateExam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getExams,
    TResult? Function(int examId)? removeExam,
    TResult? Function(Exam exam)? acceptExam,
    TResult? Function(Exam exam)? updateExam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getExams,
    TResult Function(int examId)? removeExam,
    TResult Function(Exam exam)? acceptExam,
    TResult Function(Exam exam)? updateExam,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetExams value) getExams,
    required TResult Function(_RemoveExam value) removeExam,
    required TResult Function(_AcceptExam value) acceptExam,
    required TResult Function(_UpdateExam value) updateExam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetExams value)? getExams,
    TResult? Function(_RemoveExam value)? removeExam,
    TResult? Function(_AcceptExam value)? acceptExam,
    TResult? Function(_UpdateExam value)? updateExam,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetExams value)? getExams,
    TResult Function(_RemoveExam value)? removeExam,
    TResult Function(_AcceptExam value)? acceptExam,
    TResult Function(_UpdateExam value)? updateExam,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExamEventCopyWith<$Res> {
  factory $ExamEventCopyWith(ExamEvent value, $Res Function(ExamEvent) then) =
      _$ExamEventCopyWithImpl<$Res, ExamEvent>;
}

/// @nodoc
class _$ExamEventCopyWithImpl<$Res, $Val extends ExamEvent>
    implements $ExamEventCopyWith<$Res> {
  _$ExamEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetExamsCopyWith<$Res> {
  factory _$$_GetExamsCopyWith(
          _$_GetExams value, $Res Function(_$_GetExams) then) =
      __$$_GetExamsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetExamsCopyWithImpl<$Res>
    extends _$ExamEventCopyWithImpl<$Res, _$_GetExams>
    implements _$$_GetExamsCopyWith<$Res> {
  __$$_GetExamsCopyWithImpl(
      _$_GetExams _value, $Res Function(_$_GetExams) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetExams implements _GetExams {
  const _$_GetExams();

  @override
  String toString() {
    return 'ExamEvent.getExams()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetExams);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getExams,
    required TResult Function(int examId) removeExam,
    required TResult Function(Exam exam) acceptExam,
    required TResult Function(Exam exam) updateExam,
  }) {
    return getExams();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getExams,
    TResult? Function(int examId)? removeExam,
    TResult? Function(Exam exam)? acceptExam,
    TResult? Function(Exam exam)? updateExam,
  }) {
    return getExams?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getExams,
    TResult Function(int examId)? removeExam,
    TResult Function(Exam exam)? acceptExam,
    TResult Function(Exam exam)? updateExam,
    required TResult orElse(),
  }) {
    if (getExams != null) {
      return getExams();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetExams value) getExams,
    required TResult Function(_RemoveExam value) removeExam,
    required TResult Function(_AcceptExam value) acceptExam,
    required TResult Function(_UpdateExam value) updateExam,
  }) {
    return getExams(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetExams value)? getExams,
    TResult? Function(_RemoveExam value)? removeExam,
    TResult? Function(_AcceptExam value)? acceptExam,
    TResult? Function(_UpdateExam value)? updateExam,
  }) {
    return getExams?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetExams value)? getExams,
    TResult Function(_RemoveExam value)? removeExam,
    TResult Function(_AcceptExam value)? acceptExam,
    TResult Function(_UpdateExam value)? updateExam,
    required TResult orElse(),
  }) {
    if (getExams != null) {
      return getExams(this);
    }
    return orElse();
  }
}

abstract class _GetExams implements ExamEvent {
  const factory _GetExams() = _$_GetExams;
}

/// @nodoc
abstract class _$$_RemoveExamCopyWith<$Res> {
  factory _$$_RemoveExamCopyWith(
          _$_RemoveExam value, $Res Function(_$_RemoveExam) then) =
      __$$_RemoveExamCopyWithImpl<$Res>;
  @useResult
  $Res call({int examId});
}

/// @nodoc
class __$$_RemoveExamCopyWithImpl<$Res>
    extends _$ExamEventCopyWithImpl<$Res, _$_RemoveExam>
    implements _$$_RemoveExamCopyWith<$Res> {
  __$$_RemoveExamCopyWithImpl(
      _$_RemoveExam _value, $Res Function(_$_RemoveExam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? examId = null,
  }) {
    return _then(_$_RemoveExam(
      null == examId
          ? _value.examId
          : examId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RemoveExam implements _RemoveExam {
  const _$_RemoveExam(this.examId);

  @override
  final int examId;

  @override
  String toString() {
    return 'ExamEvent.removeExam(examId: $examId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveExam &&
            (identical(other.examId, examId) || other.examId == examId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, examId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveExamCopyWith<_$_RemoveExam> get copyWith =>
      __$$_RemoveExamCopyWithImpl<_$_RemoveExam>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getExams,
    required TResult Function(int examId) removeExam,
    required TResult Function(Exam exam) acceptExam,
    required TResult Function(Exam exam) updateExam,
  }) {
    return removeExam(examId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getExams,
    TResult? Function(int examId)? removeExam,
    TResult? Function(Exam exam)? acceptExam,
    TResult? Function(Exam exam)? updateExam,
  }) {
    return removeExam?.call(examId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getExams,
    TResult Function(int examId)? removeExam,
    TResult Function(Exam exam)? acceptExam,
    TResult Function(Exam exam)? updateExam,
    required TResult orElse(),
  }) {
    if (removeExam != null) {
      return removeExam(examId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetExams value) getExams,
    required TResult Function(_RemoveExam value) removeExam,
    required TResult Function(_AcceptExam value) acceptExam,
    required TResult Function(_UpdateExam value) updateExam,
  }) {
    return removeExam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetExams value)? getExams,
    TResult? Function(_RemoveExam value)? removeExam,
    TResult? Function(_AcceptExam value)? acceptExam,
    TResult? Function(_UpdateExam value)? updateExam,
  }) {
    return removeExam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetExams value)? getExams,
    TResult Function(_RemoveExam value)? removeExam,
    TResult Function(_AcceptExam value)? acceptExam,
    TResult Function(_UpdateExam value)? updateExam,
    required TResult orElse(),
  }) {
    if (removeExam != null) {
      return removeExam(this);
    }
    return orElse();
  }
}

abstract class _RemoveExam implements ExamEvent {
  const factory _RemoveExam(final int examId) = _$_RemoveExam;

  int get examId;
  @JsonKey(ignore: true)
  _$$_RemoveExamCopyWith<_$_RemoveExam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AcceptExamCopyWith<$Res> {
  factory _$$_AcceptExamCopyWith(
          _$_AcceptExam value, $Res Function(_$_AcceptExam) then) =
      __$$_AcceptExamCopyWithImpl<$Res>;
  @useResult
  $Res call({Exam exam});

  $ExamCopyWith<$Res> get exam;
}

/// @nodoc
class __$$_AcceptExamCopyWithImpl<$Res>
    extends _$ExamEventCopyWithImpl<$Res, _$_AcceptExam>
    implements _$$_AcceptExamCopyWith<$Res> {
  __$$_AcceptExamCopyWithImpl(
      _$_AcceptExam _value, $Res Function(_$_AcceptExam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exam = null,
  }) {
    return _then(_$_AcceptExam(
      null == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as Exam,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ExamCopyWith<$Res> get exam {
    return $ExamCopyWith<$Res>(_value.exam, (value) {
      return _then(_value.copyWith(exam: value));
    });
  }
}

/// @nodoc

class _$_AcceptExam implements _AcceptExam {
  const _$_AcceptExam(this.exam);

  @override
  final Exam exam;

  @override
  String toString() {
    return 'ExamEvent.acceptExam(exam: $exam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AcceptExam &&
            (identical(other.exam, exam) || other.exam == exam));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exam);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AcceptExamCopyWith<_$_AcceptExam> get copyWith =>
      __$$_AcceptExamCopyWithImpl<_$_AcceptExam>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getExams,
    required TResult Function(int examId) removeExam,
    required TResult Function(Exam exam) acceptExam,
    required TResult Function(Exam exam) updateExam,
  }) {
    return acceptExam(exam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getExams,
    TResult? Function(int examId)? removeExam,
    TResult? Function(Exam exam)? acceptExam,
    TResult? Function(Exam exam)? updateExam,
  }) {
    return acceptExam?.call(exam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getExams,
    TResult Function(int examId)? removeExam,
    TResult Function(Exam exam)? acceptExam,
    TResult Function(Exam exam)? updateExam,
    required TResult orElse(),
  }) {
    if (acceptExam != null) {
      return acceptExam(exam);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetExams value) getExams,
    required TResult Function(_RemoveExam value) removeExam,
    required TResult Function(_AcceptExam value) acceptExam,
    required TResult Function(_UpdateExam value) updateExam,
  }) {
    return acceptExam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetExams value)? getExams,
    TResult? Function(_RemoveExam value)? removeExam,
    TResult? Function(_AcceptExam value)? acceptExam,
    TResult? Function(_UpdateExam value)? updateExam,
  }) {
    return acceptExam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetExams value)? getExams,
    TResult Function(_RemoveExam value)? removeExam,
    TResult Function(_AcceptExam value)? acceptExam,
    TResult Function(_UpdateExam value)? updateExam,
    required TResult orElse(),
  }) {
    if (acceptExam != null) {
      return acceptExam(this);
    }
    return orElse();
  }
}

abstract class _AcceptExam implements ExamEvent {
  const factory _AcceptExam(final Exam exam) = _$_AcceptExam;

  Exam get exam;
  @JsonKey(ignore: true)
  _$$_AcceptExamCopyWith<_$_AcceptExam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UpdateExamCopyWith<$Res> {
  factory _$$_UpdateExamCopyWith(
          _$_UpdateExam value, $Res Function(_$_UpdateExam) then) =
      __$$_UpdateExamCopyWithImpl<$Res>;
  @useResult
  $Res call({Exam exam});

  $ExamCopyWith<$Res> get exam;
}

/// @nodoc
class __$$_UpdateExamCopyWithImpl<$Res>
    extends _$ExamEventCopyWithImpl<$Res, _$_UpdateExam>
    implements _$$_UpdateExamCopyWith<$Res> {
  __$$_UpdateExamCopyWithImpl(
      _$_UpdateExam _value, $Res Function(_$_UpdateExam) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exam = null,
  }) {
    return _then(_$_UpdateExam(
      null == exam
          ? _value.exam
          : exam // ignore: cast_nullable_to_non_nullable
              as Exam,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ExamCopyWith<$Res> get exam {
    return $ExamCopyWith<$Res>(_value.exam, (value) {
      return _then(_value.copyWith(exam: value));
    });
  }
}

/// @nodoc

class _$_UpdateExam implements _UpdateExam {
  const _$_UpdateExam(this.exam);

  @override
  final Exam exam;

  @override
  String toString() {
    return 'ExamEvent.updateExam(exam: $exam)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateExam &&
            (identical(other.exam, exam) || other.exam == exam));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exam);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateExamCopyWith<_$_UpdateExam> get copyWith =>
      __$$_UpdateExamCopyWithImpl<_$_UpdateExam>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getExams,
    required TResult Function(int examId) removeExam,
    required TResult Function(Exam exam) acceptExam,
    required TResult Function(Exam exam) updateExam,
  }) {
    return updateExam(exam);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getExams,
    TResult? Function(int examId)? removeExam,
    TResult? Function(Exam exam)? acceptExam,
    TResult? Function(Exam exam)? updateExam,
  }) {
    return updateExam?.call(exam);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getExams,
    TResult Function(int examId)? removeExam,
    TResult Function(Exam exam)? acceptExam,
    TResult Function(Exam exam)? updateExam,
    required TResult orElse(),
  }) {
    if (updateExam != null) {
      return updateExam(exam);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetExams value) getExams,
    required TResult Function(_RemoveExam value) removeExam,
    required TResult Function(_AcceptExam value) acceptExam,
    required TResult Function(_UpdateExam value) updateExam,
  }) {
    return updateExam(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetExams value)? getExams,
    TResult? Function(_RemoveExam value)? removeExam,
    TResult? Function(_AcceptExam value)? acceptExam,
    TResult? Function(_UpdateExam value)? updateExam,
  }) {
    return updateExam?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetExams value)? getExams,
    TResult Function(_RemoveExam value)? removeExam,
    TResult Function(_AcceptExam value)? acceptExam,
    TResult Function(_UpdateExam value)? updateExam,
    required TResult orElse(),
  }) {
    if (updateExam != null) {
      return updateExam(this);
    }
    return orElse();
  }
}

abstract class _UpdateExam implements ExamEvent {
  const factory _UpdateExam(final Exam exam) = _$_UpdateExam;

  Exam get exam;
  @JsonKey(ignore: true)
  _$$_UpdateExamCopyWith<_$_UpdateExam> get copyWith =>
      throw _privateConstructorUsedError;
}
