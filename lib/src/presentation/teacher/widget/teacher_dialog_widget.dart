import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/core/models/basic_info_model.dart';
import 'package:my_sampad/src/features/teacher/domain/models/teacher.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/custom_textfield_widget.dart';
import 'package:my_sampad/src/presentation/teacher/bloc/teacher/teacher_bloc.dart';

class TeacherDialogWidget extends StatelessWidget {
  final Teacher? teacher;
  final bool isEditing;
  TeacherDialogWidget({
    super.key,
    this.teacher,
    this.isEditing = false,
  });

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  final TextEditingController _teacherName = TextEditingController(text: '');

  final TextEditingController _phone = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    if (isEditing && teacher != null) {
      _teacherName.value = TextEditingValue(text: teacher!.basicInfo!.name);
      _phone.value =
          TextEditingValue(text: '0${teacher!.basicInfo!.phoneNumber.toInt()}');
    }
    return BlocBuilder<TeacherBloc, TeacherState>(
      bloc: getIt.get<TeacherBloc>(),
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
                    isEditing ? 'Change Teacher' : 'Add Teacher',
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
                        name: 'teacher_name',
                        heghit: 50.h,
                        haveIcon: false,
                        labelText: 'Teacher Name',
                        labelStyle: TextStyle(
                            fontSize: 13.sp,
                            color: Colors.black45,
                            fontWeight: FontWeight.bold),
                        controller: _teacherName,
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
                              errorText: 'PhoneNumber is mandatory'),
                          FormBuilderValidators.equalLength(11,
                              errorText:
                                  'It must be an 11-digit number and start with zero')
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
                            getIt.get<TeacherBloc>().add(
                                  TeacherEvent.updateTeacher(
                                    teacher!.copyWith(
                                      basicInfo: BasicInfoModel(
                                          name: _teacherName.text,
                                          phoneNumber:
                                              double.tryParse(_phone.text) ??
                                                  0),
                                    ),
                                  ),
                                );
                          } else {
                            getIt.get<TeacherBloc>().add(
                                  TeacherEvent.addTeacher(
                                    Teacher(
                                      basicInfo: BasicInfoModel(
                                          name: _teacherName.text,
                                          phoneNumber:
                                              double.tryParse(_phone.text) ??
                                                  0),
                                    ),
                                  ),
                                );
                          }
                          _teacherName.clear();
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
                              fontSize: 13.sp,
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
