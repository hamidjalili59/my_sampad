import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/mediator_tc/domain/models/mediator.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/course/bloc/course/course_bloc.dart';
import 'package:my_sampad/src/presentation/teacher/bloc/teacher/teacher_bloc.dart';
import 'package:my_sampad/src/presentation/teacher/bloc/teacher_detail/teacher_detail_bloc.dart';
import 'package:ndialog/ndialog.dart';

class TeacherClassListWidget extends StatefulWidget {
  const TeacherClassListWidget({super.key});

  @override
  State<TeacherClassListWidget> createState() => _TeacherClassListWidgetState();
}

class _TeacherClassListWidgetState extends State<TeacherClassListWidget> {
  bool deleteMode = false;

  @override
  Widget build(BuildContext context) {
    getIt.get<TeacherDetailBloc>().add(const TeacherDetailEvent.getMediators());
    return SafeArea(
      child: Scaffold(
        floatingActionButton: GeneralConstants.userType == UserType.admin
            ? InkWell(
                onTap: () {
                  NDialog(
                    dialogStyle: DialogStyle(),
                    title: Text(
                      'اضافه کردن درس و دبیر',
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.black,
                          fontFamily: 'Ordibehesht',
                          fontWeight: FontWeight.bold),
                    ),
                    content: const AddMediatorDialogWidget(),
                    actions: [
                      MaterialButton(
                          onPressed: () {
                            getIt.get<AppRouter>().pop();
                          },
                          color: const Color(0xffe8ffe8),
                          child: Text(
                            'لغو',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 22.sp,
                                color: Colors.black,
                                fontFamily: 'Ordibehesht',
                                fontWeight: FontWeight.bold),
                          )),
                      BlocBuilder<TeacherDetailBloc, TeacherDetailState>(
                        bloc: getIt.get<TeacherDetailBloc>(),
                        builder: (context, teacherState) {
                          return MaterialButton(
                            onPressed: teacherState.isLoading
                                ? () {}
                                : () {
                                    if (teacherState.isLoading) {
                                      return;
                                    }
                                    getIt.get<TeacherDetailBloc>().add(
                                          const TeacherDetailEvent
                                              .acceptTeacher(),
                                        );
                                    getIt.get<AppRouter>().pop();
                                  },
                            color: const Color(0xffe8ffe8),
                            child: teacherState.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Text(
                                    'تایید',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontSize: 22.sp,
                                        color: Colors.black,
                                        fontFamily: 'Ordibehesht',
                                        fontWeight: FontWeight.bold),
                                  ),
                          );
                        },
                      ),
                    ],
                  ).show(context, dismissable: false);
                },
                child: Container(
                  width: 150.w,
                  height: 50.h,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: const Color(0xffe8ffe8),
                      borderRadius: BorderRadius.circular(12.sp),
                      boxShadow: [
                        BoxShadow(
                            offset: const Offset(0, 1),
                            blurRadius: 2.sp,
                            spreadRadius: 0,
                            color: const Color.fromARGB(70, 36, 36, 36))
                      ]),
                  child: Text(
                    'افزودن‌ درس و دبیر',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                        fontSize: 22.sp,
                        color: Colors.black,
                        fontFamily: 'Ordibehesht',
                        fontWeight: FontWeight.bold),
                  ),
                ))
            : null,
        body: Column(
          children: [
            AppbarSchoolWidget(
              title: 'دبیران کلاس',
              titleHelper:
                  'در این صفحه میتوانید دبیران این کلاس را مشاهده کنید',
              pathString: '',
              isWidget: true,
              widget: GeneralConstants.userType != UserType.admin
                  ? null
                  : DropdownButton<String>(
                      underline: const SizedBox(),
                      selectedItemBuilder: (context) {
                        return [Container(width: 40.w)];
                      },
                      items: [
                        DropdownMenuItem(
                          alignment: Alignment.center,
                          value: 'حذف',
                          onTap: () {
                            getIt.get<AppRouter>().pop();
                            setState(() {
                              deleteMode = true;
                            });

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: const Color(0xffe8ffe8),
                                content: Text(
                                  'دبیر مورد نظر را برای حذف انتخاب کنید',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Colors.black,
                                      fontFamily: 'Ordibehesht',
                                      fontWeight: FontWeight.bold),
                                )));
                          },
                          child: Text(
                            'حذف',
                            style: TextStyle(
                                fontSize: 20.sp,
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
              height: 0.69.sh,
              child: BlocBuilder<TeacherDetailBloc, TeacherDetailState>(
                bloc: getIt.get<TeacherDetailBloc>(),
                builder: (context, mediatorState) {
                  if (mediatorState.isLoading) {
                    return Center(
                      child: SizedBox(
                          width: 55.w,
                          height: 55.w,
                          child: const CircularProgressIndicator()),
                    );
                  } else {
                    if (mediatorState.mediators.isNotEmpty) {
                      return SizedBox(
                        width: 1.sw,
                        height: 1.sh,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 16.r,
                            mainAxisSpacing: 16.r,
                            mainAxisExtent: 0.3.sh,
                          ),
                          itemCount: mediatorState.mediators.length,
                          padding: EdgeInsets.only(
                              top: 16.h, right: 12.w, left: 12.w),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: deleteMode
                                  ? () async {
                                      setState(() {
                                        deleteMode = false;
                                      });
                                      await NDialog(
                                        dialogStyle: DialogStyle(
                                          contentPadding: EdgeInsets.zero,
                                        ),
                                        title: SizedBox(
                                          height: 50.h,
                                          child: Text(
                                            'آیا از حذف ${mediatorState.mediators[index].basicInfo!.name} اطمینان دارید',
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontSize: 20.sp,
                                                color: Colors.black,
                                                fontFamily: 'Ordibehesht',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        content: SizedBox(
                                          width: 120.w,
                                          height: 50.h,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  getIt.get<AppRouter>().pop();
                                                },
                                                child: Container(
                                                  width: 120.w,
                                                  height: 45.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.sp),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'خیر',
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        color: Colors.black,
                                                        fontFamily:
                                                            'Ordibehesht',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  getIt
                                                      .get<TeacherDetailBloc>()
                                                      .add(
                                                        TeacherDetailEvent
                                                            .removeMediator(
                                                          mediatorState
                                                              .mediators[index]
                                                              .mediatorId,
                                                        ),
                                                      );
                                                  getIt.get<AppRouter>().pop();
                                                },
                                                child: Container(
                                                  width: 120.w,
                                                  height: 45.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.sp),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    'بله',
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        color: Colors.black,
                                                        fontFamily:
                                                            'Ordibehesht',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ).show(context);
                                    }
                                  : () {},
                              child: TeacherClassTileCardWidget(
                                mediator: mediatorState.mediators[index],
                              ),
                            );
                          },
                        ),
                      );
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
                                'دبیری برای این کلاس وجود ندارد',
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
          ],
        ),
      ),
    );
  }
}

class AddMediatorDialogWidget extends StatelessWidget {
  const AddMediatorDialogWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TeacherDetailBloc, TeacherDetailState>(
      bloc: getIt.get<TeacherDetailBloc>(),
      builder: (context, teacherDetailState) {
        return teacherDetailState.maybeWhen(
          idle: (isLoading, mediators, selectedTeacher, selectedCourse) {
            return SizedBox(
              width: 0.9.sw,
              height: 0.4.sh,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                      flex: 8,
                      child: SizedBox(
                        width: 1.sw,
                        height: 1.sh,
                        child: BlocBuilder<TeacherBloc, TeacherState>(
                          bloc: getIt.get<TeacherBloc>(),
                          builder: (context, teacherState) {
                            return ListView.builder(
                              itemCount: teacherState.teachers.length,
                              itemBuilder: (context, index) {
                                return SizedBox(
                                  height: 60.h,
                                  width: 150.w,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      RadioMenuButton(
                                        value: selectedTeacher,
                                        groupValue:
                                            teacherState.teachers[index],
                                        onChanged: (value) {
                                          getIt.get<TeacherDetailBloc>().add(
                                                TeacherDetailEvent
                                                    .selectTeacherItem(
                                                        teacherState
                                                            .teachers[index]),
                                              );
                                        },
                                        child: SizedBox(
                                          width: 80.w,
                                          child: Text(
                                            teacherState.teachers[index]
                                                .basicInfo!.name,
                                            textAlign: TextAlign.center,
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                                fontSize: 18.sp,
                                                color: Colors.black,
                                                fontFamily: 'Ordibehesht',
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      )),
                  Container(
                    width: 2.w,
                    color: Colors.grey,
                  ),
                  Flexible(
                      flex: 8,
                      child: SizedBox(
                        width: 1.sw,
                        height: 1.sh,
                        child: BlocBuilder<CourseBloc, CourseState>(
                          bloc: getIt.get<CourseBloc>(),
                          builder: (context, courseState) {
                            return ListView.builder(
                              itemCount: courseState.courses.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child: SizedBox(
                                    height: 60.h,
                                    width: 100.w,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        RadioMenuButton(
                                          value: selectedCourse,
                                          groupValue:
                                              courseState.courses[index],
                                          onChanged: (value) {
                                            getIt.get<TeacherDetailBloc>().add(
                                                  TeacherDetailEvent
                                                      .selectCourseItem(
                                                          courseState
                                                              .courses[index]),
                                                );
                                          },
                                          child: SizedBox(
                                            width: 80.w,
                                            child: Text(
                                              courseState
                                                  .courses[index].courseName,
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.black,
                                                  fontFamily: 'Ordibehesht',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      )),
                ],
              ),
            );
          },
          orElse: () => const SizedBox(),
        );
      },
    );
  }
}

class TeacherClassTileCardWidget extends StatelessWidget {
  final Mediator mediator;
  const TeacherClassTileCardWidget({
    super.key,
    required this.mediator,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 1.r,
            spreadRadius: 0.1,
          )
        ],
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 9,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 64.r,
              child: Image.asset(
                PngAssets.teacher,
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: SizedBox(
              child: Text(
                '${mediator.basicInfo!.name}\n${mediator.courseName}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 14.r,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
