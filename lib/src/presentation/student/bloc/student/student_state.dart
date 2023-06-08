part of 'student_bloc.dart';

@freezed
class StudentState with _$StudentState {
  const factory StudentState.idle({
    @Default(false) bool isLoading,
    @Default([]) List<Student> students,
    @Default(false) bool smsChackBox,
  }) = _Idle;
}
