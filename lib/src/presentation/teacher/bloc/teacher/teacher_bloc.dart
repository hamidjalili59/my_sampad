import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_sampad/src/config/utils/function_helper.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/teacher/domain/models/teacher.dart';
import 'package:my_sampad/src/features/teacher/domain/use_cases/add_teacher_use_case.dart';
import 'package:my_sampad/src/features/teacher/domain/use_cases/get_teachers_use_case.dart';
import 'package:my_sampad/src/features/teacher/domain/use_cases/remove_teacher_use_case.dart';
import 'package:my_sampad/src/features/teacher/domain/use_cases/update_teacher_use_case.dart';
import 'package:my_sampad/src/injectable/injectable.dart';

part 'teacher_state.dart';
part 'teacher_event.dart';
part 'teacher_bloc.freezed.dart';

@lazySingleton
class TeacherBloc extends Bloc<TeacherEvent, TeacherState> {
  final GetTeacherUseCase _getTeacherUseCase;
  final AddTeacherUseCase _addTeacherUseCase;
  final UpdateTeacherUseCase _updateTeacherUseCase;
  final RemoveTeacherUseCase _removeTeacherUseCase;
  TeacherBloc(
    this._getTeacherUseCase,
    this._addTeacherUseCase,
    this._updateTeacherUseCase,
    this._removeTeacherUseCase,
  ) : super(const TeacherState.idle(isLoading: true)) {
    on<_GetTeachers>(_onGetTeachers);
    on<_AddTeacher>(_onAddTeacher);
    on<_UpdateTeacher>(_onUpdateTeacher);
    on<_RemoveTeacher>(_onRemoveTeacher);
    add(TeacherEvent.getTeachers(
      int.parse(getIt.get<OtpHandshakeResponse>().token),
    ));
  }

  @override
  void onEvent(TeacherEvent event) {
    FunctionHelper()
        .logMessage('>>>>> Teacher Bloc event: ${event.toString()}');
    super.onEvent(event);
  }

  FutureOr<void> _onGetTeachers(
      _GetTeachers event, Emitter<TeacherState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _getTeacherUseCase
        .call(param: tuple.Tuple1(event.schoolId))
        .then((value) => value.fold(
              (l) => emit(state.copyWith(isLoading: false)),
              (r) {
                emit(TeacherState.idle(isLoading: false, teachers: r.teachers));
              },
            ));
  }

  FutureOr<void> _onAddTeacher(
      _AddTeacher event, Emitter<TeacherState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _addTeacherUseCase
        .call(param: tuple.Tuple1<Teacher>(event.teacher))
        .then(
          (value) => value.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) {
              List<Teacher> tempTeachers = state.teachers.toList();
              tempTeachers.add(r.teacher);
              emit(TeacherState.idle(isLoading: false, teachers: tempTeachers));
            },
          ),
        );
  }

  FutureOr<void> _onUpdateTeacher(
      _UpdateTeacher event, Emitter<TeacherState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _updateTeacherUseCase
        .call(
          param: tuple.Tuple3<String, int, double>(
            event.teacher.basicInfo!.name,
            event.teacher.teacherId,
            event.teacher.basicInfo!.phoneNumber,
          ),
        )
        .then(
          (value) => value.fold(
            (l) => emit(state.copyWith(isLoading: false)),
            (r) {
              List<Teacher> tempTeachers = state.teachers;
              add(TeacherEvent.getTeachers(
                int.parse(getIt.get<OtpHandshakeResponse>().token),
              ));
              emit(TeacherState.idle(isLoading: false, teachers: tempTeachers));
            },
          ),
        );
  }

  FutureOr<void> _onRemoveTeacher(
      _RemoveTeacher event, Emitter<TeacherState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      await _removeTeacherUseCase
          .call(param: tuple.Tuple1<int>(event.teacherId))
          .then(
            (value) => value.fold(
              (l) => emit(state.copyWith(isLoading: false)),
              (r) {
                List<Teacher> tempList = state.teachers.toList();
                tempList.removeAt(tempList
                    .map((e) => e.teacherId)
                    .toList()
                    .indexOf(event.teacherId));
                emit(TeacherState.idle(isLoading: false, teachers: tempList));
              },
            ),
          );
    } catch (e) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
