import 'dart:async';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/config/utils/function_helper.dart';
import 'package:my_sampad/src/features/auth/domain/failures/auth_failure.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/auth/domain/use_cases/get_account_data_use_case.dart';
import 'package:my_sampad/src/features/core/models/tuple.dart' as tuple;
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/features/auth/domain/use_cases/get_cached_auth_data_use_case.dart';
import 'package:injectable/injectable.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

@lazySingleton
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetCachedAuthDataUseCase _getCachedAuthDataUseCase;
  final GetAccountDataUseCase _getAccountDataUseCase;
  final AppRouter appRoute = getIt.get<AppRouter>();
  SplashBloc(
    this._getCachedAuthDataUseCase,
    this._getAccountDataUseCase,
  ) : super(const _LoadInProgress()) {
    on<_GetClientData>(_getClientData);
    on<_GetAccountData>(_getAccountData);
    on<_TokenIsExist>(_jwtIsExist);
    // add(const SplashEvent.tokenIsExist());
  }
  @override
  void onEvent(SplashEvent event) {
    FunctionHelper().logMessage('>>>>> Splash Bloc event: ${event.toString()}');
    super.onEvent(event);
  }

  FutureOr<void> _getClientData(
    _GetClientData event,
    Emitter<SplashState> emit,
  ) async {
    GeneralConstants.jwt = event.token.token;
    GeneralConstants.roleCount.clear();
    emit(const _LoadInProgress());
    if (event.token.typeOfUser.contains('parent')) {
      GeneralConstants.isParent = true;
      GeneralConstants.roleCount.add('parent');
      GeneralConstants.roleCount = GeneralConstants.roleCount.toSet().toList();
    }
    if (event.token.typeOfUser.contains('teacher')) {
      GeneralConstants.isTeacher = true;
      GeneralConstants.roleCount.add('teacher');
      GeneralConstants.roleCount = GeneralConstants.roleCount.toSet().toList();
    }
    if (event.token.typeOfUser.contains('principal')) {
      GeneralConstants.isAdmin = true;
      GeneralConstants.roleCount.add('principal');
      GeneralConstants.roleCount = GeneralConstants.roleCount.toSet().toList();
    }
    if (event.token.typeOfUser.contains('deputy')) {
      GeneralConstants.isDeputy = true;
      GeneralConstants.roleCount.add('deputy');
      GeneralConstants.roleCount = GeneralConstants.roleCount.toSet().toList();
    }
    try {
      if (GeneralConstants.roleCount.length > 1) {
        appRoute.replaceNamed('/rulePage');
      } else {
        if (event.token.typeOfUser == 'principal') {
          GeneralConstants.userType = UserType.admin;
          getIt.get<AppRouter>().pushNamed('/home_page');
        } else if (event.token.typeOfUser == 'teacher') {
          GeneralConstants.userType = UserType.teacher;
          getIt.get<AppRouter>().pushNamed('/school_select_page');
        } else if (event.token.typeOfUser == 'parent') {
          GeneralConstants.userType = UserType.parent;
          getIt.get<AppRouter>().pushNamed('/class_student_page');
        } else {
          GeneralConstants.userType = UserType.deputy;
          getIt.get<AppRouter>().pushNamed('/home_page');
        }
      }
    } catch (e) {
      FunctionHelper().logErrorDetailMessage(
        e,
        libraryName: 'loginError',
        bodyMessage: 'check your login details',
      );
      emit(_Failure(message: e.toString()));
    }
  }

  // __

  FutureOr<void> _jwtIsExist(
    _TokenIsExist event,
    Emitter<SplashState> emit,
  ) async {
    emit(const _LoadInProgress());
    try {
      final getCacheResult = await _getCachedAuthDataUseCase();
      getCacheResult.fold(
        (l) {
          emit(_Failure(failure: l));
        },
        (r) {
          if (!getIt.isRegistered<OtpHandshakeResponse>()) {
            getIt.registerSingleton<OtpHandshakeResponse>(r!);
          }
          add(const _GetAccountData());
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

  FutureOr<void> _getAccountData(
      _GetAccountData event, Emitter<SplashState> emit) async {
    await _getAccountDataUseCase
        .call(
            param: tuple.Tuple1(
                getIt.get<OtpHandshakeResponse>().phoneNumber ?? 0))
        .then((value) => value.fold(
              (l) {
                emit(_Failure(failure: l));
              },
              (r) {
                emit(_JwtExist(r));
                if (getIt.isRegistered<OtpHandshakeResponse>()) {
                  getIt.unregister<OtpHandshakeResponse>();
                  getIt.registerSingleton<OtpHandshakeResponse>(r);
                } else {
                  getIt.registerSingleton<OtpHandshakeResponse>(r);
                }
              },
            ));
  }
}
