part of 'deputy_bloc.dart';

@freezed
class DeputyEvent with _$DeputyEvent {
  const factory DeputyEvent.getClasses(
    int deputyId,
  ) = _GetClasses;
  const factory DeputyEvent.addDeputy(
    Deputy deputy,
  ) = _AddDeputy;

  const factory DeputyEvent.removeDeputy(int deputyId) = _RemoveDeputy;
  const factory DeputyEvent.updateDeputy(
    Deputy deputy,
  ) = _UpdateDeputy;
  const factory DeputyEvent.getDeputys(
    int schoolId,
  ) = _GetDeputys;
}
