import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/features/core/models/basic_info_model.dart';
import 'package:my_sampad/src/features/student/domain/models/student_model/student.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/custom_textfield_widget.dart';
import 'package:my_sampad/src/presentation/student/bloc/student/student_bloc.dart';

class AddStudentDialogWidget extends StatelessWidget {
  const AddStudentDialogWidget({
    super.key,
    required this.formKey,
    required TextEditingController studentNameController,
    required TextEditingController studentParentController,
    required TextEditingController phonenumberController,
  })  : _studentNameController = studentNameController,
        _studentParentController = studentParentController,
        _phonenumberController = phonenumberController;

  final GlobalKey<FormBuilderState> formKey;
  final TextEditingController _studentNameController;
  final TextEditingController _studentParentController;
  final TextEditingController _phonenumberController;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 0.7.sw, minHeight: 0.3.sh),
      child: FormBuilder(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 0.35.sw,
              height: 0.5.sw,
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black38,
                    blurRadius: 1,
                    spreadRadius: 0.1,
                    offset: Offset(1, 2),
                  ),
                ],
              ),
              child:
                  Icon(Icons.person_rounded, size: 46.r, color: Colors.black87),
            ),
            CustomTextField(
              haveIcon: true,
              sIcon: Icons.person_rounded,
              name: 'student_name',
              labelText: 'نام دانش‌آموز',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText: 'انتخاب اسم برای ساخت دانش آموز اجباری است'),
                FormBuilderValidators.maxLength(
                  30,
                  errorText:
                      'لطفا اسمی که انتخاب میکنید کمتر از 30 حرف داشته باشد',
                ),
                FormBuilderValidators.minLength(
                  3,
                  errorText:
                      'لطفا اسمی که انتخاب میکنید بیشتر از 3 حرف داشته باشد',
                ),
              ]),
              controller: _studentNameController,
              initialValue: '',
              width: 0.65.sw,
              heghit: 65.h,
              keyboardType: TextInputType.name,
            ),
            CustomTextField(
              haveIcon: true,
              sIcon: Icons.family_restroom_rounded,
              name: 'parent_name',
              labelText: 'نام والد',
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(
                    errorText:
                        'انتخاب اسم والد برای ساخت دانش آموز اجباری است'),
                FormBuilderValidators.maxLength(
                  30,
                  errorText:
                      'لطفا اسمی که انتخاب میکنید کمتر از 30 حرف داشته باشد',
                ),
                FormBuilderValidators.minLength(
                  3,
                  errorText:
                      'لطفا اسمی که انتخاب میکنید بیشتر از 3 حرف داشته باشد',
                ),
              ]),
              controller: _studentParentController,
              initialValue: '',
              width: 0.65.sw,
              heghit: 65.h,
              keyboardType: TextInputType.name,
            ),
            Row(
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  onTap: () {
                    getIt
                        .get<StudentBloc>()
                        .add(const StudentEvent.checkSMSCheckBox());
                  },
                  child: SizedBox(
                    width: 0.27.sw,
                    height: 50.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BlocBuilder<StudentBloc, StudentState>(
                          bloc: getIt.get<StudentBloc>(),
                          builder: (context, state) {
                            return Icon(
                              state.smsChackBox
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                              size: 24.r,
                            );
                          },
                        ),
                        Text(
                          'ارسال پیامک',
                          style: Theme.of(context).textTheme.labelMedium,
                        )
                      ],
                    ),
                  ),
                ),
                CustomTextField(
                  haveIcon: true,
                  sIcon: Icons.phone_rounded,
                  name: 'phone',
                  labelText: 'شماره تماس',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText:
                            'انتخاب شماره برای ساخت دانش آموز اجباری است'),
                    FormBuilderValidators.numeric(
                        errorText: 'شماره تلفن باید عدد باشد'),
                    FormBuilderValidators.equalLength(11,
                        errorText:
                            'شماره تلفن درست نیست ، شماره باید 11 رقم باشد و با صفر شروع شود'),
                  ]),
                  controller: _phonenumberController,
                  initialValue: '',
                  width: 0.4.sw,
                  heghit: 65.h,
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            BlocBuilder<StudentBloc, StudentState>(
                bloc: getIt.get<StudentBloc>(),
                builder: (context, studentStateBotton) {
                  return IgnorePointer(
                    ignoring: studentStateBotton.isLoading,
                    child: InkWell(
                      onTap: () {
                        if (!studentStateBotton.isLoading) {
                          if (formKey.currentState?.validate() ?? false) {
                            getIt.get<StudentBloc>().add(
                                  StudentEvent.addStudent(
                                    Student(
                                        basicInfo: BasicInfoModel(
                                          name: _studentNameController.text,
                                          phoneNumber: double.tryParse(
                                                  _phonenumberController
                                                      .text) ??
                                              0,
                                        ),
                                        classId:
                                            getIt.get<Classroom>().classID),
                                    _studentParentController.text,
                                  ),
                                );
                            _studentNameController.clear();
                            _phonenumberController.clear();
                            _studentParentController.clear();

                            Navigator.pop(getIt
                                .get<AppRouter>()
                                .navigatorKey
                                .currentContext!);
                          } else {}
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: GeneralConstants.mainColor,
                            borderRadius: BorderRadius.circular(12.r)),
                        constraints: BoxConstraints(
                          minWidth: 0.4.sw,
                        ),
                        height: 55.h,
                        alignment: Alignment.center,
                        child: studentStateBotton.isLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                'ثبت دانش‌آموز',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.r,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
