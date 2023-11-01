import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/config/utils/function_helper.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/teacher_rollcall/domain/models/teacher_rollcall_model.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/use_cases/add_teacher_rollcall_use_case.dart';
import 'package:my_sampad/src/features/teacher_rollcall/domain/use_cases/get_teacher_rollcalls_use_case.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:ndialog/ndialog.dart';

part 'teacher_rollcall_state.dart';
part 'teacher_rollcall_event.dart';
part 'teacher_rollcall_bloc.freezed.dart';

@injectable
class TeacherRollcallBloc
    extends Bloc<TeacherRollcallEvent, TeacherRollcallState> {
  final AddTeacherRollcallUseCase _addTeacherRollcallUseCase;
  final GetTeacherRollCallsUseCase _getTeacherRollcallUseCase;
  TeacherRollcallBloc(
      this._addTeacherRollcallUseCase, this._getTeacherRollcallUseCase)
      : super(const TeacherRollcallState.idle()) {
    on<_GetRollcalls>(_onGetRollcalls);
    on<_AddRollcall>(_onAddRollcall);
    on<_OnStartPage>(_onOnStartPage);
  }
  @override
  void onEvent(TeacherRollcallEvent event) {
    FunctionHelper()
        .logMessage('>>>>> TeacherRollCall Bloc event: ${event.toString()}');
    super.onEvent(event);
  }

  FutureOr<void> _onAddRollcall(
      _AddRollcall event, Emitter<TeacherRollcallState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _addTeacherRollcallUseCase
        .call(param: tuple.Tuple1<TeacherRollcall>(event.rollcalls))
        .then((value) => value.fold(
              (l) async {
                emit(state.copyWith(isLoading: false));
                await getIt.get<AppRouter>().pop();
                await NAlertDialog(
                  dialogStyle: DialogStyle(
                      backgroundColor: const Color(0xffe8ffe8),
                      contentPadding: EdgeInsets.zero),
                  content: SizedBox(
                    width: 100.w,
                    height: 50.h,
                    child: Center(
                      child: Text(
                        'The registration was not successful',
                        style: TextStyle(color: Colors.black, fontSize: 13.sp),
                      ),
                    ),
                  ),
                ).show(getIt.get<AppRouter>().navigatorKey.currentContext!);
              },
              (r) async {
                List<TeacherRollcall> tempList = state.rollcalls.toList();
                tempList.add(r.rollcall);
                emit(state.copyWith(isLoading: false, rollcalls: tempList));
                await getIt.get<AppRouter>().pop();
                await NAlertDialog(
                  dialogStyle: DialogStyle(
                      backgroundColor: const Color(0xffe8ffe8),
                      contentPadding: EdgeInsets.zero),
                  content: SizedBox(
                    width: 100.w,
                    height: 50.h,
                    child: Center(
                      child: Text(
                        'Successfully registered',
                        style: TextStyle(color: Colors.black, fontSize: 13.sp),
                      ),
                    ),
                  ),
                ).show(getIt.get<AppRouter>().navigatorKey.currentContext!);
              },
            ));
  }

  FutureOr<void> _onGetRollcalls(
      _GetRollcalls event, Emitter<TeacherRollcallState> emit) async {
    emit(state.copyWith(isLoading: true));
    await _getTeacherRollcallUseCase
        .call(param: tuple.Tuple2(event.schoolId, event.phoneNumber))
        .then((value) => value.fold(
              (l) => emit(state.copyWith(isLoading: false)),
              (r) => emit(
                  state.copyWith(isLoading: false, rollcalls: r.rollcalls)),
            ));
  }

  FutureOr<void> _onOnStartPage(
      _OnStartPage event, Emitter<TeacherRollcallState> emit) async {
    NDialog(
      content: SizedBox(
        width: 202.w,
        height: 190.h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 190.w,
              child: Text(
                'Scan the teacher\'s QR code with this scanner inside your phone',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
            ),
            SizedBox(
              width: 170.w,
              child: Text(
                'To get the QR code, on the teacher\'s account, click on the QR-Code symbol at the top of the class selection page',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    ).show(getIt.get<AppRouter>().navigatorKey.currentContext!);
  }
}
