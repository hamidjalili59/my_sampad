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
                // ScaffoldMessenger.of(
                //         getIt.get<AppRouter>().navigatorKey.currentContext!)
                //     .showSnackBar(
                //   SnackBar(
                //     backgroundColor: const Color.fromARGB(255, 255, 200, 200),
                //     content: Text(
                //       'ثبت موفقیت آمیز نبود',
                //       textDirection: TextDirection.rtl,
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontFamily: 'Ordibehesht',
                //         fontSize: 18.sp,
                //       ),
                //     ),
                //   ),
                // );
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
                        'ثبت موفقیت آمیز نبود',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Ordibehesht',
                            fontSize: 18.sp),
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
                        'با موفقیت ثبت شد',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Ordibehesht',
                            fontSize: 18.sp),
                      ),
                    ),
                  ),
                ).show(getIt.get<AppRouter>().navigatorKey.currentContext!);
                // ScaffoldMessenger.of(
                //         getIt.get<AppRouter>().navigatorKey.currentContext!)
                //     .showSnackBar(
                //   SnackBar(
                //     backgroundColor: const Color(0xffe8ffe8),
                //     content: Text(
                //       'با موفقیت ثبت شد',
                //       textDirection: TextDirection.rtl,
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontFamily: 'Ordibehesht',
                //         fontSize: 18.sp,
                //       ),
                //     ),
                //   ),
                // );
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
      content: Directionality(
        textDirection: TextDirection.rtl,
        child: SizedBox(
          width: 202.w,
          height: 190.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 190.w,
                child: Text(
                  'توسط این اسکنر QR-code داخل گوشی دبیر را اسکن نمایید',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Ordibehesht',
                    fontSize: 18.sp,
                  ),
                ),
              ),
              SizedBox(
                width: 170.w,
                child: Text(
                  'برای دریافت QR_Code در اکانت دبیر در صفحه انتخاب کلاس بر روی نماد QR-Code بالای صفحه کلیک کنید',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Ordibehesht',
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).show(getIt.get<AppRouter>().navigatorKey.currentContext!);
  }
}
