import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/features/core/models/basic_info_model.dart';
import 'package:my_sampad/src/features/student/domain/models/student_model/student.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/custom_textfield_widget.dart';
import 'package:my_sampad/src/presentation/student/bloc/student/student_bloc.dart';

// ignore: must_be_immutable
class AddStudentDialog extends StatelessWidget {
  final Student? student;
  final String parentname;
  final bool isEditing;
  AddStudentDialog({
    super.key,
    this.parentname = '',
    this.student,
    this.isEditing = false,
  });

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _studentName = TextEditingController(text: '');

  final TextEditingController _parentName = TextEditingController(text: '');

  final TextEditingController _phone = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    if (isEditing && student != null) {
      if (getIt.get<StudentBloc>().state.smsChackBox != student!.sendSMS) {
        getIt
            .get<StudentBloc>()
            .add(StudentEvent.checkSMSCheckBox(student!.sendSMS));
      }
      _studentName.value = TextEditingValue(text: student!.basicInfo!.name);
      _phone.value =
          TextEditingValue(text: '0${student!.basicInfo!.phoneNumber.toInt()}');
    }
    return BlocBuilder<StudentBloc, StudentState>(
      bloc: getIt.get<StudentBloc>(),
      builder: (context, state) {
        return SizedBox(
          width: 210.w,
          height: 275.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 18.w),
                  child: Text(
                    isEditing ? 'Change Student' : 'Add Student',
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
                        name: 'student_name',
                        heghit: 50.h,
                        haveIcon: false,
                        labelText: 'Student Name',
                        labelStyle: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                        controller: _studentName,
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
                      isEditing
                          ? const SizedBox()
                          : CustomTextField(
                              islabel: true,
                              width: 200.w,
                              name: 'parent_name',
                              heghit: 50.h,
                              haveIcon: false,
                              labelText: 'Parent Name',
                              labelStyle: TextStyle(
                                  fontSize: 13.sp,
                                  color: Colors.black45,
                                  fontWeight: FontWeight.bold),
                              controller: _parentName,
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(
                                    errorText: 'Name selection is mandatory'),
                                FormBuilderValidators.maxLength(
                                  30,
                                  errorText:
                                      'Should be less than 30 characters',
                                ),
                                FormBuilderValidators.minLength(
                                  3,
                                  errorText: 'Should be more than 3 characters',
                                ),
                              ]),
                              onSubmitted: (value) {
                                if (_formKey.currentState?.validate() ??
                                    false) {}
                              },
                              keyboardType: TextInputType.name,
                            ),
                      CustomTextField(
                        islabel: true,
                        width: 200.w,
                        name: 'phone_number',
                        heghit: 50.h,
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
                child: Row(
                  children: [
                    Checkbox(
                        value: getIt.get<StudentBloc>().state.smsChackBox,
                        onChanged: (value) {
                          getIt.get<StudentBloc>().add(
                              StudentEvent.checkSMSCheckBox(value ?? false));
                        }),
                    Text(
                      'Send SMS',
                      style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          if (isEditing) {
                            getIt.get<StudentBloc>().add(
                                  StudentEvent.updateStudent(
                                    student!.copyWith(
                                      sendSMS: getIt
                                          .get<StudentBloc>()
                                          .state
                                          .smsChackBox,
                                      basicInfo: BasicInfoModel(
                                          name: _studentName.text,
                                          phoneNumber:
                                              double.tryParse(_phone.text) ??
                                                  0),
                                    ),
                                  ),
                                );
                          } else {
                            getIt.get<StudentBloc>().add(
                                  StudentEvent.addStudent(
                                    Student(
                                      basicInfo: BasicInfoModel(
                                          name: _studentName.text,
                                          phoneNumber:
                                              double.tryParse(_phone.text) ??
                                                  0),
                                      classId: getIt.get<Classroom>().classID,
                                      sendSMS: getIt
                                          .get<StudentBloc>()
                                          .state
                                          .smsChackBox,
                                    ),
                                    _parentName.text,
                                  ),
                                );
                          }
                          _studentName.clear();
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
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
