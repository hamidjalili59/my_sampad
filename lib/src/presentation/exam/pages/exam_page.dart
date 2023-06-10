import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/features/exam/domain/models/exam_model.dart';
import 'package:my_sampad/src/features/teacher/domain/models/teacher_get_schools.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/custom_textfield_widget.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/exam/bloc/exam/exam_bloc.dart';
import 'package:my_sampad/src/presentation/exam/widget/custom_card_exam_widget.dart';
import 'package:my_sampad/src/presentation/teacher/bloc/teacher/teacher_bloc.dart';
import 'package:ndialog/ndialog.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  final TextEditingController _controllerExamDescription =
      TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    getIt.get<ExamBloc>().add(const ExamEvent.getExams());
  }

  @override
  void dispose() {
    _controllerExamDescription.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.white,
        floatingActionButton: GeneralConstants.userType == UserType.teacher
            ? Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Material(
                  elevation: 5,
                  color: const Color.fromARGB(255, 243, 243, 234),
                  borderRadius: BorderRadius.circular(12.r),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    splashColor: GeneralConstants.backgroundColor,
                    onTap: _addExamDialogMethod,
                    child: Container(
                      alignment: Alignment.center,
                      width: 120.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        'ثبت امتحان',
                        textAlign: TextAlign.start,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.black,
                          fontFamily: 'Ordibehesht',
                        ),
                      ),
                    ),
                  ),
                ),
              )
            : null,
        body: BlocBuilder<ExamBloc, ExamState>(
          bloc: getIt.get<ExamBloc>(),
          builder: (context, examState) {
            if (examState.isLoading) {
              return Center(
                child: SizedBox(
                    width: 55.w,
                    height: 55.w,
                    child: const CircularProgressIndicator()),
              );
            } else {
              if (examState.exams.isNotEmpty) {
                return SizedBox(
                    width: 1.sw,
                    height: 1.sh,
                    child: Column(
                      children: [
                        AppbarSchoolWidget(
                          title: 'امتحانات کلاس',
                          titleHelper:
                              'میتوانید در زیر لیستی از امتحانات با توضیح آنها مشاهده کنید',
                          pathString:
                              'شهید بهشتی  -- کلاس‌ها  --  کلاس ریاضی 2 -- امتحانات',
                          isWidget: true,
                          widget: GeneralConstants.userType != UserType.teacher
                              ? null
                              : DropdownButton<String>(
                                  items: [
                                    DropdownMenuItem(
                                      alignment: Alignment.center,
                                      value: 'حذف',
                                      onTap: () {},
                                      child: Text(
                                        'حذف',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            color: Colors.black,
                                            fontFamily: 'Ordibehesht',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      alignment: Alignment.center,
                                      value: 'تغییر',
                                      onTap: () {},
                                      child: Text(
                                        'تغییر',
                                        textDirection: TextDirection.rtl,
                                        style: TextStyle(
                                            fontSize: 24.sp,
                                            color: Colors.black,
                                            fontFamily: 'Ordibehesht',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                  onChanged: (value) {},
                                  icon: Icon(
                                    Icons.more_vert_rounded,
                                    size: 36.sp,
                                  ),
                                ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: examState.exams.length,
                          itemBuilder: (context, index) {
                            return CustomCardExamWidget(
                              exam: examState.exams[index],
                            );
                          },
                        ),
                      ],
                    ));
              } else {
                return SizedBox(
                  width: 1.sw,
                  height: 0.8.sh,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          width: 0.95.sw,
                          height: 0.5.sh,
                          child: Padding(
                            padding: EdgeInsets.all(54.0.r),
                            child: SvgPicture.asset(
                              SvgAssets.empty,
                            ),
                          ),
                        ),
                        Text(
                          'امتحانی وجود ندارد',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontFamily: 'Ordibehesht',
                              fontSize: 22.r),
                        )
                      ],
                    ),
                  ),
                );
              }
            }
          },
        ),
      ),
    );
  }

  // ignore: unused_element
  _addExamDialogMethod() {
    final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
    var appRputer = getIt.get<AppRouter>();
    NDialog(
      dialogStyle: DialogStyle(
          titlePadding: EdgeInsets.symmetric(horizontal: 0.r, vertical: 0.r),
          backgroundColor: GeneralConstants.backgroundColor,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 3.r)),
      title: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
            color: GeneralConstants.mainColor,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r))),
        height: 50.h,
        child: Text(
          'افزودن امتحان',
          style: TextStyle(
              color: Colors.white, fontSize: 16.r, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      content: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 0.1.sh,
          minWidth: 0.75.sw,
          maxHeight: 0.8.sh,
          maxWidth: 0.8.sw,
        ),
        child: FormBuilder(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10.h),
                CustomTextField(
                  name: 'exam_description',
                  labelText: 'توضیحات امتحان',
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                        errorText: 'انتخاب توضیح برای ساخت امتحان اجباری است'),
                    FormBuilderValidators.maxLength(
                      200,
                      errorText:
                          'لطفا توضیحاتی که انتخاب میکنید کمتر از 200 حرف داشته باشد',
                    ),
                    FormBuilderValidators.minLength(
                      5,
                      errorText:
                          'لطفا توضیحاتی که انتخاب میکنید بیشتر از 5 حرف داشته باشد',
                    ),
                  ]),
                  controller: _controllerExamDescription,
                  width: 200.w,
                  heghit: 65.h,
                  keyboardType: TextInputType.text,
                ),
                SizedBox(height: 15.h),
                InkWell(
                  onTap: () {
                    if (getIt.get<ExamBloc>().state.isLoading) {
                      return;
                    }
                    Exam tempExam = Exam(
                      classId: getIt.get<Classroom>().classID,
                      examDescription: _controllerExamDescription.text,
                      teacherId: getIt.get<TeacherGetSchools>().teacherId,
                      teacherName: getIt
                          .get<TeacherBloc>()
                          .state
                          .teachers
                          .firstWhere(
                            (element) =>
                                element.teacherId ==
                                getIt.get<TeacherGetSchools>().teacherId,
                          )
                          .basicInfo!
                          .name,
                    );
                    getIt.get<ExamBloc>().add(ExamEvent.acceptExams(tempExam));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: GeneralConstants.mainColor,
                      borderRadius: BorderRadius.all(Radius.circular(8.r)),
                    ),
                    width: 0.45.sw,
                    height: 40.h,
                    alignment: Alignment.center,
                    child: Text(
                      'تایید',
                      style: TextStyle(
                        fontSize: 16.r,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    ).show(appRputer.navigatorKey.currentContext!);
  }
}
