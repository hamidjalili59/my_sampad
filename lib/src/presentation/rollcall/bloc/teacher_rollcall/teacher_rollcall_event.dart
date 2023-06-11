part of 'teacher_rollcall_bloc.dart';

@freezed
class TeacherRollcallEvent with _$TeacherRollcallEvent {
  const factory TeacherRollcallEvent.getRollcalls(
    int schoolId,
    double phoneNumber,
  ) = _GetRollcalls;
  const factory TeacherRollcallEvent.addRollcall(
    TeacherRollcall rollcalls,
  ) = _AddRollcall;
  const factory TeacherRollcallEvent.onStartPage() = _OnStartPage;
}
