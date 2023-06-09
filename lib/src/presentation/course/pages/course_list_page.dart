import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/course/domain/models/course_model/course.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/custom_textfield_widget.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/course/bloc/course/course_bloc.dart';
import 'package:ndialog/ndialog.dart';

class CourseListPage extends StatelessWidget {
  CourseListPage({super.key});
  final TextEditingController _courseName = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () async {
              await NDialog(
                dialogStyle: DialogStyle(
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                content: AddCourseDialogWidget(courseName: _courseName),
              ).show(context);
            },
            child: Container(
              width: 130.w,
              height: 60.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.sp),
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(70, 55, 55, 55),
                        spreadRadius: 0,
                        blurRadius: 4.sp,
                        offset: const Offset(1, 1))
                  ]),
              alignment: Alignment.center,
              child: Text(
                'اضافه کردن درس',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontFamily: 'Ordibehesht',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: BlocProvider(
            create: (_) => getIt.get<CourseBloc>(),
            child: BlocBuilder<CourseBloc, CourseState>(
              bloc: getIt.get<CourseBloc>(),
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    AppbarSchoolWidget(
                      title: 'مدیریت درس‌ها',
                      titleHelper:
                          'در این صفحه می‌توانید درس‌ها را حذف یا اضافه یا پاک کنید',
                      pathString: 'صفحه اصلی -- مدیریت درس‌ها',
                      isWidget: true,
                      widget: DropdownButton<String>(
                        items: [
                          DropdownMenuItem(
                            alignment: Alignment.center,
                            value: 'حذف',
                            onTap: () {
                              print('حذف');
                            },
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
                            onTap: () {
                              print('تغییر');
                            },
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
                    SizedBox(
                      width: 1.sw,
                      height: 0.69.sh,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: state.courses.length,
                        padding: EdgeInsets.all(16.r),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 260.h,
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 10.h,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.sp),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          const Color.fromARGB(70, 55, 55, 55),
                                      spreadRadius: 0,
                                      blurRadius: 4.sp,
                                      offset: const Offset(1, 1))
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: 150.w,
                                    height: 160.h,
                                    child: Image.asset(PngAssets.course)),
                                SizedBox(height: 20.h),
                                Text(
                                  'درس ${state.courses[index].courseName}',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 26.sp,
                                      color: Colors.black,
                                      fontFamily: 'Ordibehesht',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class AddCourseDialogWidget extends StatelessWidget {
  AddCourseDialogWidget({
    super.key,
    required TextEditingController courseName,
    this.course,
  }) : _courseName = courseName;
  final Course? course;
  final TextEditingController _courseName;

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210.w,
      height: 95.h,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'اضافه کردن درس',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                  fontSize: 22.sp,
                  color: Colors.black,
                  fontFamily: 'Ordibehesht',
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 60.h,
            child: Row(
              children: [
                FormBuilder(
                  key: _formKey,
                  child: CustomTextField(
                    width: 130.w,
                    name: 'course',
                    heghit: 40.h,
                    haveIcon: false,
                    labelText: 'اسم‌درس',
                    labelStyle: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black45,
                        fontFamily: 'Ordibehesht',
                        fontWeight: FontWeight.bold),
                    controller: _courseName,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'انتخاب اسم اجباری است'),
                      FormBuilderValidators.maxLength(
                        30,
                        errorText: 'کمتر از 30 حرف داشته باشد',
                      ),
                      FormBuilderValidators.minLength(
                        3,
                        errorText: 'بیشتر از 3 حرف داشته باشد',
                      ),
                    ]),
                    onSubmitted: (value) {
                      if (_formKey.currentState?.validate() ?? false) {
                        // if (false) {
                        //   getIt.get<CourseBloc>().add(
                        //         CourseEvent.updateCourse(
                        //           course!.copyWith(courseName: _courseName.text),
                        //         ),
                        //       );
                        // } else {
                        getIt.get<CourseBloc>().add(
                              CourseEvent.addCourse(
                                _courseName.text,
                              ),
                            );
                        // }
                        _courseName.clear();
                        Navigator.pop(getIt
                            .get<AppRouter>()
                            .navigatorKey
                            .currentContext!);
                      } else {}
                    },
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(width: 15.w),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      // if (false) {
                      //   getIt.get<CourseBloc>().add(
                      //         CourseEvent.updateCourse(
                      //           course!.copyWith(courseName: _courseName.text),
                      //         ),
                      //       );
                      // } else {
                      getIt.get<CourseBloc>().add(
                            CourseEvent.addCourse(
                              _courseName.text,
                            ),
                          );
                      // }
                      _courseName.clear();
                      Navigator.pop(
                          getIt.get<AppRouter>().navigatorKey.currentContext!);
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
                      'تایید',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontFamily: 'Ordibehesht',
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
  }
}
