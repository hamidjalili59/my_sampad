// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/config/utils/function_helper.dart';
import 'package:my_sampad/src/features/auth/domain/failures/auth_failure.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_verify_response.dart';
import 'package:my_sampad/src/features/auth/domain/use_cases/cache_auth_data_use_case.dart';
import 'package:my_sampad/src/features/auth/domain/use_cases/logout_auth_use_case.dart';
import 'package:my_sampad/src/features/auth/domain/use_cases/otp_handshake_use_case.dart';
import 'package:my_sampad/src/features/core/models/basic_info_model.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';
import 'package:my_sampad/src/features/parent/domain/models/parent_model/parent.dart';
import 'package:my_sampad/src/features/school/domain/models/principal.dart';
import 'package:my_sampad/src/features/teacher/domain/models/teacher.dart';
import 'package:my_sampad/src/injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_event.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final OtpHandshakeUseCase _otpHandshakeUseCase;
  final CacheAuthDataUseCase _cacheAuthDataUseCase;
  final LogoutAuthDataUseCase _logoutAuthDataUseCase;
  AuthBloc(
    this._otpHandshakeUseCase,
    this._cacheAuthDataUseCase,
    this._logoutAuthDataUseCase,
  ) : super(const _Idle()) {
    on<_OtpHandshake>(_onOtpHandshake);
    on<_ResetIdel>(_onResetIdel);
    on<_CacheAuthData>(_onCacheAuthData);
    on<_Logout>(_onLogout);
  }

  @override
  void onEvent(AuthEvent event) {
    FunctionHelper().logMessage('>>>>> Auth Bloc event: ${event.toString()}');
    super.onEvent(event);
  }

  FutureOr<void> _onOtpHandshake(
    _OtpHandshake event,
    Emitter<AuthState> emit,
  ) async {
    emit(const _Idle(isLoading: true));
    try {
      if (getIt.isRegistered<double>()) {
        getIt.unregister<double>();
        getIt.registerSingleton<double>(event.phoneNumber);
      } else {
        getIt.registerSingleton<double>(event.phoneNumber);
      }
      final handshakeResult =
          await _otpHandshakeUseCase(param: tuple.Tuple1(event.phoneNumber));
      await Future.delayed(const Duration(seconds: 2));
      handshakeResult.fold(
        (l) {
          ScaffoldMessenger.of(
                  getIt.get<AppRouter>().navigatorKey.currentContext!)
              .showSnackBar(
            SnackBar(
              backgroundColor: const Color.fromARGB(255, 255, 232, 232),
              content: Text(
                'There is an issue with the login, your number is not registered',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 10.sp,
                ),
              ),
            ),
          );
          emit(_Failure(failure: l));
          emit(const _Idle());
        },
        (r) {
          if (!getIt.isRegistered<OtpHandshakeResponse>()) {
            getIt.registerSingleton<OtpHandshakeResponse>(r);
          }
          emit(_OtpHandshakeSuccess(r));
        },
      );
    } catch (e) {
      FunctionHelper().logErrorDetailMessage(
        e,
        libraryName: 'loginError',
        bodyMessage: 'check your login details',
      );
      emit(_Failure(message: e.toString()));
    }
  }

  FutureOr<void> _onResetIdel(
    _ResetIdel event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.idle(isLoading: true));
    try {
      emit(const _Idle(isLoading: false));
    } catch (e) {
      emit(_Failure(message: e.toString()));
    }
  }

  FutureOr<void> _onCacheAuthData(
    _CacheAuthData event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthState.idle(isLoading: true));
    try {
      final cacheResult = await _cacheAuthDataUseCase(
        param: tuple.Tuple8<String, String, int, Parent, Teacher, Principal,
            Deputy, double>(
          event.token.token,
          event.token.typeOfUser,
          event.token.code,
          event.token.parent ?? Parent(),
          event.token.teacher ?? const Teacher(),
          event.token.principal ??
              Principal(
                  schoolId: 0,
                  basicInfo: BasicInfoModel(name: '', phoneNumber: 0)),
          event.token.deputy ?? Deputy(),
          event.token.phoneNumber ?? 0,
        ),
      );
      cacheResult.fold(
        (l) {
          emit(_Failure(failure: l));
        },
        (r) {
          getIt.get<AppRouter>().replaceNamed('/splash');
          return null;
        },
      );
    } catch (e) {
      emit(_Failure(message: e.toString()));
    }
  }

  FutureOr<void> _onLogout(_Logout event, Emitter<AuthState> emit) async {
    await _logoutAuthDataUseCase.call().then(
          (value) => value.fold(
            (l) => null,
            (r) {
              getIt.get<AppRouter>().replaceNamed('/auth');
            },
          ),
        );
  }
}
