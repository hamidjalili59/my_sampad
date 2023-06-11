part of 'deputy_bloc.dart';

@freezed
class DeputyState with _$DeputyState {
  const factory DeputyState.idle({
    @Default(false) bool isLoading,
    @Default([]) List<Deputy> deputys,
  }) = _Idle;
}
