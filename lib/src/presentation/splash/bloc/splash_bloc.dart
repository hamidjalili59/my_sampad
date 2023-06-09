import 'dart:async';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/config/utils/function_helper.dart';
import 'package:my_sampad/src/features/auth/domain/failures/auth_failure.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/features/auth/domain/use_cases/get_cached_auth_data_use_case.dart';
import 'package:injectable/injectable.dart';

part 'splash_bloc.freezed.dart';
part 'splash_event.dart';
part 'splash_state.dart';

@lazySingleton
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final GetCachedAuthDataUseCase _getCachedAuthDataUseCase;
  final AppRouter appRoute = getIt.get<AppRouter>();
  SplashBloc(
    this._getCachedAuthDataUseCase,
  ) : super(const _LoadInProgress()) {
    on<_GetClientData>(_getClientData);
    on<_TokenIsExist>(_jwtIsExist);
    add(const SplashEvent.tokenIsExist());
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
    emit(const _LoadInProgress());
    if (event.token.typeOfUser.contains('parent')) {
      GeneralConstants.isParent = true;
      GeneralConstants.roleCount += 1;
    }
    if (event.token.typeOfUser.contains('teacher')) {
      GeneralConstants.isTeacher = true;
      GeneralConstants.roleCount += 1;
    }
    if (event.token.typeOfUser.contains('principal')) {
      GeneralConstants.isAdmin = true;
      GeneralConstants.roleCount += 1;
    }
    try {
      if (GeneralConstants.roleCount > 1) {
        // GeneralConstants.roleCount = 0;
        appRoute.replaceNamed('/rulePage');
        // NDialog(
        //   title: Center(
        //     child: Text(
        //       'ورود به عنوان',
        //       style: TextStyle(
        //         color: Colors.black,
        //         fontSize: 22.r,
        //         fontWeight: FontWeight.bold,
        //       ),
        //     ),
        //   ),
        //   content: SizedBox(
        //     width: 0.6.sw,
        //     height: 0.35.sh,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         event.token.typeOfUser.contains('principal')
        //             ? InkWell(
        //                 onTap: () {
        //                   GeneralConstants.userType = UserType.admin;
        //                   appRoute.replaceNamed('/home_page');
        //                 },
        //                 child: Container(
        //                   width: 0.45.sw,
        //                   height: 60.h,
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(16.r),
        //                     color: GeneralConstants.mainColor,
        //                   ),
        //                   alignment: Alignment.center,
        //                   child: Text(
        //                     'مدیر',
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontSize: 22.r,
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                   ),
        //                 ),
        //               )
        //             : const SizedBox(),
        //         event.token.typeOfUser.contains('teacher')
        //             ? InkWell(
        //                 onTap: () async {
        //                   appRoute.pop();
        //                   GeneralConstants.userType = UserType.teacher;

        //                   if (GeneralConstants.userType == UserType.teacher) {
        //                     return await NDialog(
        //                       title: Center(
        //                         child: Text(
        //                           'انتخاب مدرسه',
        //                           style: Theme.of(getIt
        //                                   .get<AppRouter>()
        //                                   .navigatorKey
        //                                   .currentContext!)
        //                               .textTheme
        //                               .titleLarge!
        //                               .copyWith(color: Colors.black),
        //                           textAlign: TextAlign.center,
        //                         ),
        //                       ),
        //                       content: BlocBuilder<SchoolBloc, SchoolState>(
        //                         bloc: getIt.get<SchoolBloc>(),
        //                         builder: (context, state) {
        //                           return SizedBox(
        //                             width: 0.7.sw,
        //                             height: 0.3.sh,
        //                             child: state.isLoading
        //                                 ? const Center(
        //                                     child: CircularProgressIndicator())
        //                                 : ListView.builder(
        //                                     itemCount: state.data.keys.length,
        //                                     itemBuilder: (context, index) =>
        //                                         InkWell(
        //                                       onTap: () async {
        //                                         TeacherGetSchools tempModel =
        //                                             TeacherGetSchools(
        //                                           int.tryParse(state.data.keys
        //                                                   .toList()[index]) ??
        //                                               0,
        //                                           state.data.values
        //                                                   .toList()[index]
        //                                               ['school_ID'],
        //                                           state.data.values
        //                                                   .toList()[index]
        //                                               ['school_Name'],
        //                                         );
        //                                         getIt.registerSingleton<
        //                                                 TeacherGetSchools>(
        //                                             tempModel);
        //                                         appRoute
        //                                             .replaceNamed('/home_page');
        //                                       },
        //                                       child: Container(
        //                                         height: 50.h,
        //                                         width: 120.w,
        //                                         decoration: BoxDecoration(
        //                                           borderRadius:
        //                                               BorderRadius.circular(
        //                                                   16.r),
        //                                           color: Theme.of(context)
        //                                               .colorScheme
        //                                               .primary,
        //                                         ),
        //                                         alignment: Alignment.center,
        //                                         child: Text(
        //                                           state.data.values
        //                                                   .toList()[index]
        //                                               ['school_Name'],
        //                                           style: Theme.of(context)
        //                                               .textTheme
        //                                               .titleLarge!
        //                                               .copyWith(
        //                                                   color: Colors.white),
        //                                         ),
        //                                       ),
        //                                     ),
        //                                   ),
        //                           );
        //                         },
        //                       ),
        //                     ).show(
        //                       appRoute.navigatorKey.currentContext!,
        //                       dismissable: false,
        //                     );
        //                   }
        //                 },
        //                 child: Container(
        //                   width: 0.45.sw,
        //                   height: 60.h,
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(16.r),
        //                     color: GeneralConstants.mainColor,
        //                   ),
        //                   alignment: Alignment.center,
        //                   child: Text(
        //                     'دبیر',
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontSize: 22.r,
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                   ),
        //                 ),
        //               )
        //             : const SizedBox(),
        //         event.token.typeOfUser.contains('parent')
        //             ? InkWell(
        //                 onTap: () {
        //                   GeneralConstants.userType = UserType.parent;
        //                   appRoute.replaceNamed('/class_details_page');
        //                 },
        //                 child: Container(
        //                   width: 0.45.sw,
        //                   height: 60.h,
        //                   decoration: BoxDecoration(
        //                     borderRadius: BorderRadius.circular(16.r),
        //                     color: GeneralConstants.mainColor,
        //                   ),
        //                   alignment: Alignment.center,
        //                   child: Text(
        //                     'والد',
        //                     style: TextStyle(
        //                       color: Colors.white,
        //                       fontSize: 22.r,
        //                       fontWeight: FontWeight.bold,
        //                     ),
        //                   ),
        //                 ),
        //               )
        //             : const SizedBox(),
        //       ],
        //     ),
        //   ),
        // ).show(
        //   getIt.get<AppRouter>().navigatorKey.currentContext!,
        //   dismissable: false,
        // );
      } else {
        if (event.token.typeOfUser == 'principal') {
          GeneralConstants.userType = UserType.admin;
          appRoute.replaceNamed('/home_page');
        } else if (event.token.typeOfUser == 'teacher') {
          GeneralConstants.userType = UserType.teacher;
        } else {
          GeneralConstants.userType = UserType.parent;
          appRoute.replaceNamed('/class_details_page');
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
          if (r == null) {
            appRoute.pushNamed('/auth');
            return emit(const _Failure(failure: AuthFailure.nullParam()));
          }
          emit(_JwtExist(r));
          if (!getIt.isRegistered<OtpHandshakeResponse>()) {
            getIt.registerSingleton<OtpHandshakeResponse>(r);
          }
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
}
