import 'package:flutter/material.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/auth/bloc/auth_bloc.dart';
import 'package:my_sampad/src/presentation/auth/widgets/auth_mobile_widget.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});
  final AuthBloc bloc = getIt.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F5FA),
      body: AuthMobileWidget(),
    );
  }
}
