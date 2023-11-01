import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/core/models/basic_info_model.dart';
import 'package:my_sampad/src/features/deputy/domain/models/deputy_model/deputy.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/custom_textfield_widget.dart';
import 'package:my_sampad/src/presentation/deputy/bloc/deputy/deputy_bloc.dart';

class DeputyDialogWidget extends StatelessWidget {
  final Deputy? deputy;
  final bool isEditing;
  DeputyDialogWidget({
    super.key,
    this.deputy,
    this.isEditing = false,
  });

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _deputyName = TextEditingController(text: '');

  final TextEditingController _phone = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    if (isEditing && deputy != null) {
      _deputyName.value = TextEditingValue(text: deputy!.basicInfo!.name);
      _phone.value =
          TextEditingValue(text: '0${deputy!.basicInfo!.phoneNumber.toInt()}');
    }
    return BlocBuilder<DeputyBloc, DeputyState>(
      bloc: getIt.get<DeputyBloc>(),
      builder: (context, state) {
        return SizedBox(
          width: 210.w,
          height: 230.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 18.w),
                  child: Text(
                    isEditing ? 'Change' : 'Add Deputy',
                    style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                child: FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        islabel: true,
                        width: 200.w,
                        name: 'deputy_name',
                        heghit: 60.h,
                        haveIcon: false,
                        labelText: 'Deputy Name',
                        labelStyle: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                        controller: _deputyName,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Name selection is mandatory'),
                          FormBuilderValidators.maxLength(
                            30,
                            errorText: 'Should be less than 30 characters',
                          ),
                          FormBuilderValidators.minLength(
                            3,
                            errorText: 'Should be more than 3 characters',
                          ),
                        ]),
                        onSubmitted: (value) {
                          if (_formKey.currentState?.validate() ?? false) {}
                        },
                        keyboardType: TextInputType.name,
                      ),
                      CustomTextField(
                        islabel: true,
                        width: 200.w,
                        name: 'phone_number',
                        heghit: 60.h,
                        haveIcon: false,
                        labelText: 'PhoneNumber',
                        labelStyle: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                        controller: _phone,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(
                              errorText: 'Phone number is mandatory'),
                          FormBuilderValidators.equalLength(11,
                              errorText:
                                  'It should be an 11-digit number and start with zero')
                        ]),
                        onSubmitted: (value) {
                          if (_formKey.currentState?.validate() ?? false) {}
                        },
                        keyboardType: TextInputType.name,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                  width: 200.w,
                  height: 60.h,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (isEditing) {
                            getIt.get<DeputyBloc>().add(
                                  DeputyEvent.updateDeputy(
                                    deputy!.copyWith(
                                      basicInfo: BasicInfoModel(
                                          name: _deputyName.text,
                                          phoneNumber:
                                              double.tryParse(_phone.text) ??
                                                  0),
                                    ),
                                  ),
                                );
                          } else {
                            getIt.get<DeputyBloc>().add(
                                  DeputyEvent.addDeputy(
                                    Deputy(
                                      schoolId: getIt
                                          .get<OtpHandshakeResponse>()
                                          .principal!
                                          .schoolId,
                                      basicInfo: BasicInfoModel(
                                          name: _deputyName.text,
                                          phoneNumber:
                                              double.tryParse(_phone.text) ??
                                                  0),
                                    ),
                                  ),
                                );
                          }
                          _deputyName.clear();
                          Navigator.pop(getIt
                              .get<AppRouter>()
                              .navigatorKey
                              .currentContext!);
                        } else {}
                      },
                      child: Container(
                        width: 70.w,
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: const Color(0xffe8ffe8),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Accept',
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}
