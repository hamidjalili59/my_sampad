import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/config/utils/function_helper.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/auth/domain/use_cases/logout_auth_use_case.dart';
import 'package:my_sampad/src/features/home/domain/models/appbar_page_type.dart';
import 'package:my_sampad/src/injectable/injectable.dart';

part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LogoutAuthDataUseCase _logoutAuthDataUseCase;
  HomeBloc(this._logoutAuthDataUseCase)
      : super(_CurrentPageIndex(
          pageState: GeneralConstants.userType == UserType.teacher
              ? AppbarPageType.teacherHome
              : AppbarPageType.classroom,
        )) {
    on<_ChangePages>(_onChangePage);
    on<_Logout>(_onLogout);
    add(HomeEvent.changePages(
      GeneralConstants.userType == UserType.teacher
          ? AppbarPageType.teacherHome
          : AppbarPageType.classroom,
    ));
  }

  @override
  void onEvent(HomeEvent event) {
    FunctionHelper().logMessage('>>>>> Home Bloc event: ${event.toString()}');
    super.onEvent(event);
  }

  FutureOr<void> _onChangePage(
    _ChangePages event,
    Emitter<HomeState> emit,
  ) async {
    emit(_CurrentPageIndex(pageState: event.index));
  }

  FutureOr<void> _onLogout(_Logout event, Emitter<HomeState> emit) async {
    await _logoutAuthDataUseCase.call().then(
          (value) => value.fold(
            (l) => null,
            (r) {
              getIt.get<AppRouter>().replaceNamed('/splash');
            },
          ),
        );
  }
}
