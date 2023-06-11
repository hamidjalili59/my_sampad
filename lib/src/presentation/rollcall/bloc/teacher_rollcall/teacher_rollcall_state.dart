part of 'teacher_rollcall_bloc.dart';

@freezed
class TeacherRollcallState with _$TeacherRollcallState {
  const factory TeacherRollcallState.idle({
    @Default(false) bool isLoading,
    @Default([]) List<TeacherRollcall> rollcalls,
  }) = _Idle;
}
