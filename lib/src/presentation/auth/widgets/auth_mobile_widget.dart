import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/auth/bloc/auth_bloc.dart';
import 'package:my_sampad/src/presentation/core/widgets/custom_textfield_widget.dart';
import 'package:pinput/pinput.dart';

class AuthMobileWidget extends StatelessWidget {
  AuthMobileWidget({super.key});
  final AuthBloc bloc = getIt.get<AuthBloc>();
  final TextEditingController _numbercontroller =
      TextEditingController(text: '');
  final TextEditingController _pinCodecontroller =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: BlocBuilder<AuthBloc, AuthState>(
        bloc: bloc,
        builder: (context, state) {
          return state.maybeWhen(
            failure: (failure, message) {
              return Center(
                child: Text(
                  'error ${failure.toString()}  __ ${message.toString()}',
                  style: TextStyle(color: Colors.black, fontSize: 26.r),
                ),
              );
            },
            orElse: () {
              return OtpHandshakeWidget(
                numbercontroller: _numbercontroller,
                bloc: bloc,
                isLoading: false,
              );
            },
            otpHandshakeSuccess: (handshakeResponse) {
              return SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(26.sp),
                          bottomRight: Radius.circular(26.sp),
                        ),
                      ),
                      width: 1.sw,
                      height: 550.h,
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 100.h),
                          SizedBox(
                            width: 250.w,
                            height: 64.h,
                            child: Text(
                              'We have sent the code to your number',
                              style: TextStyle(
                                  fontSize: 20.sp, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 55.h),
                          SizedBox(
                            width: 1.sw,
                            height: 70.h,
                            child: Pinput(
                              defaultPinTheme: PinTheme(
                                width: 70.w,
                                height: 70.h,
                                textStyle: TextStyle(
                                  fontSize: 36.sp,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                  fontWeight: FontWeight.bold,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xfff6f5fa),
                                  borderRadius: BorderRadius.circular(10.sp),
                                ),
                              ),
                              androidSmsAutofillMethod:
                                  AndroidSmsAutofillMethod.none,
                              autofocus: true,
                              controller: _pinCodecontroller,
                              onChanged: (value) {
                                if (value.length == 4 &&
                                    (int.tryParse(value) ?? 0) ==
                                        handshakeResponse.code) {
                                  bloc.add(
                                    AuthEvent.cacheAuthData(handshakeResponse),
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 60.h),
                          SizedBox(
                            width: 275.w,
                            height: 50.h,
                            child: Text(
                              'Didn\'t recive the code?\nRequest again',
                              style: TextStyle(
                                  fontSize: 18.sp, color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(height: 80.h),
                          Container(
                            width: 335.w,
                            height: 65.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffE8FFE8),
                              borderRadius: BorderRadius.circular(14.sp),
                            ),
                            child: Text(
                              'Enter',
                              style: TextStyle(
                                fontSize: 24.sp,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
            idle: (isLoading) {
              return OtpHandshakeWidget(
                numbercontroller: _numbercontroller,
                bloc: bloc,
                isLoading: isLoading,
              );
            },
          );
        },
      ),
    );
  }
}

class OtpHandshakeWidget extends StatelessWidget {
  const OtpHandshakeWidget({
    super.key,
    required TextEditingController numbercontroller,
    required this.bloc,
    required this.isLoading,
  }) : _numbercontroller = numbercontroller;

  final TextEditingController _numbercontroller;
  final AuthBloc bloc;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 1.sw,
          height: 500.h,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(
                SvgAssets.otpIcon,
                width: 307.w,
                height: 218.h,
              ),
              SizedBox(height: 25.h),
              SizedBox(
                width: 220.w,
                height: 55.h,
                child: Text(
                  "You'll receive a 4-digit code by entering your number",
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 30.h),
              Container(
                width: 360.w,
                height: 83.h,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(19.sp),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 25.sp,
                          spreadRadius: 5,
                          color: const Color(0xfff7f7f7))
                    ]),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 60.h,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 26.0.w),
                              child: SizedBox(
                                width: 120.w,
                                child: Text(
                                  'Enter PhoneNumber :',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                          color: Colors.black54,
                                          fontSize: 10.sp,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 50.w),
                                SizedBox(
                                  width: 33.w,
                                  height: 25.h,
                                  child: Text(
                                    '+98',
                                    textDirection: TextDirection.ltr,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                        ),
                                  ),
                                ),
                                CustomTextField(
                                  islabel: false,
                                  width: 100.w,
                                  enabled: true,
                                  heghit: 25.h,
                                  maxLength: 10,
                                  name: 'phone',
                                  labelText: '9123456789',
                                  haveBorder: false,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.black,
                                        fontSize: 16.sp,
                                      ),
                                  labelStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.black38,
                                        fontSize: 16.sp,
                                      ),
                                  controller: _numbercontroller,
                                  keyboardType: TextInputType.phone,
                                  onSubmitted: (value) {
                                    if (value!.length == 10) {
                                      bloc.add(
                                        AuthEvent.otpHandshake(
                                          double.parse(value),
                                        ),
                                      );
                                      _numbercontroller.clear();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor:
                                                  const Color(0xffE8FFE8),
                                              content: Text(
                                                'phone number is not valid, the number should be 10 digits',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .copyWith(
                                                      color: Colors.black,
                                                    ),
                                              )));
                                    }
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.r),
                        child: InkWell(
                          onTap: () {
                            if (_numbercontroller.text.length == 10) {
                              bloc.add(
                                AuthEvent.otpHandshake(
                                  double.parse(_numbercontroller.text),
                                ),
                              );
                              _numbercontroller.clear();
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: const Color(0xffE8FFE8),
                                      content: Text(
                                        'Phone number is not valid, the number should be 10 digits',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: Colors.black,
                                            ),
                                      )));
                            }
                          },
                          child: Container(
                            width: 115.w,
                            height: 55.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffE8FFE8),
                              borderRadius: BorderRadius.circular(13.sp),
                            ),
                            child: isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Text(
                                    'Accept',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: Colors.black,
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.w900,
                                        ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AuthKeyboardWidget extends StatelessWidget {
  final TextEditingController number;
  const AuthKeyboardWidget({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 0.95.sw,
      height: 300.h,
      child: Center(
        child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 20.w,
            mainAxisExtent: 55.h,
            mainAxisSpacing: 15.h,
          ),
          itemCount: 12,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                if (index == 9) {
                  return;
                }
                if (index == 11 && number.text.isNotEmpty) {
                  number.value = TextEditingValue(
                    text: number.text.substring(
                      0,
                      number.text.length,
                    ),
                  );
                } else if (index == 10 && number.text.length <= 10) {
                  number.value = TextEditingValue(
                    text: '${number.text}0',
                  );
                } else if (number.text.length <= 10) {
                  number.value = TextEditingValue(
                    text: number.text + (index + 1).toString(),
                  );
                }
              },
              child: Container(
                width: 100.w,
                height: 55.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13.sp),
                ),
                child: index == 9 || index == 11
                    ? index == 11
                        ? InkWell(
                            onTap: () {
                              number.value = TextEditingValue(
                                text: number.text.isNotEmpty
                                    ? number.text.substring(
                                        0,
                                        number.text.length - 2,
                                      )
                                    : '',
                              );
                            },
                            child: const Icon(
                              Icons.backspace,
                            ),
                          )
                        : const Text('')
                    : Text(
                        index == 10 ? '0' : (index + 1).toString(),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              fontSize: 30.sp,
                            ),
                      ),
              ),
            );
          },
        ),
      ),
    );
  }
}
