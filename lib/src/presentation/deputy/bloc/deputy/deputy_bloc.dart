import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_sampad/src/config/utils/function_helper.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';
import 'package:my_sampad/src/features/deputy/domain/use_cases/add_deputy_use_case.dart';
import 'package:my_sampad/src/features/deputy/domain/use_cases/get_deputy_use_case.dart';
import 'package:my_sampad/src/features/deputy/domain/use_cases/remove_deputy_use_case.dart';
import 'package:my_sampad/src/features/deputy/domain/use_cases/update_deputy_use_case.dart';
import 'package:my_sampad/src/injectable/injectable.dart';

part 'deputy_state.dart';
part 'deputy_event.dart';
part 'deputy_bloc.freezed.dart';

@lazySingleton
class DeputyBloc extends Bloc<DeputyEvent, DeputyState> {
  final GetDeputyUseCase _getDeputyUseCase;
  final AddDeputyUseCase _addDeputyUseCase;
  final UpdateDeputyUseCase _updateDeputyUseCase;
  final RemoveDeputyUseCase _removeDeputyUseCase;
  DeputyBloc(
    this._getDeputyUseCase,
    this._addDeputyUseCase,
    this._updateDeputyUseCase,
    this._removeDeputyUseCase,
  ) : super(const DeputyState.idle(isLoading: true)) {
    on<_GetDeputys>(_onGetDeputys);
    on<_AddDeputy>(_onAddDeputy);
    on<_UpdateDeputy>(_onUpdateDeputy);
    on<_RemoveDeputy>(_onRemoveDeputy);
    add(DeputyEvent.getDeputys(
      int.parse(getIt.get<OtpHandshakeResponse>().token),
    ));
  }

  @override
  void onEvent(DeputyEvent event) {
    FunctionHelper().logMessage('>>>>> Deputy Bloc event: ${event.toString()}');
    super.onEvent(event);
  }

  FutureOr<void> _onGetDeputys(
      _GetDeputys event, Emitter<DeputyState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _getDeputyUseCase
        .call(param: tuple.Tuple1(event.schoolId))
        .then((value) => value.fold(
              (l) => emit(state.copyWith(isLoading: false)),
              (r) {
                emit(DeputyState.idle(isLoading: false, deputys: r.deputys));
              },
            ));
  }

  FutureOr<void> _onAddDeputy(
      _AddDeputy event, Emitter<DeputyState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _addDeputyUseCase
        .call(param: tuple.Tuple1<Deputy>(event.deputy))
        .then(
          (value) => value.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) {
              List<Deputy> tempDeputys = state.deputys.toList();
              tempDeputys.add(r.deputy);
              emit(state.copyWith(isLoading: false, deputys: tempDeputys));
            },
          ),
        );
  }

  FutureOr<void> _onUpdateDeputy(
      _UpdateDeputy event, Emitter<DeputyState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _updateDeputyUseCase
        .call(
          param: tuple.Tuple1<Deputy>(event.deputy),
        )
        .then(
          (value) => value.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) {
              List<Deputy> tempDeputys = state.deputys;
              add(DeputyEvent.getDeputys(
                int.parse(getIt.get<OtpHandshakeResponse>().token),
              ));
              emit(DeputyState.idle(isLoading: false, deputys: tempDeputys));
            },
          ),
        );
  }

  FutureOr<void> _onRemoveDeputy(
      _RemoveDeputy event, Emitter<DeputyState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _removeDeputyUseCase
          .call(param: tuple.Tuple1<int>(event.deputyId))
          .then(
            (value) => value.fold(
              (l) => emit(state.copyWith(isLoading: false)),
              (r) {
                List<Deputy> tempList = state.deputys.toList();
                tempList.removeAt(tempList
                    .map((e) => e.deputyId)
                    .toList()
                    .indexOf(event.deputyId));
                emit(DeputyState.idle(isLoading: false, deputys: tempList));
              },
            ),
          );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
