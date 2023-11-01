import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/features/student/domain/models/student_model/student.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/home/bloc/home_bloc.dart';

class StudentDetailsPage extends StatelessWidget {
  StudentDetailsPage({
    Key? key,
  }) : super(key: key);
  final HomeBloc bloc = getIt.get<HomeBloc>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: Column(
          children: [
            AppbarSchoolWidget(
                title: 'Student Information :',
                titleHelper:
                    'The absence section shows only dates and times of students\' absences',
                pathString: GeneralConstants.userType == UserType.admin ||
                        GeneralConstants.userType == UserType.deputy
                    ? 'Main > Classes > ${getIt.get<Classroom>().className} > Students > ${getIt.get<Student>().basicInfo!.name}'
                    : GeneralConstants.userType == UserType.parent
                        ? 'Students > ${getIt.get<Student>().basicInfo!.name}'
                        : 'Classes > ${getIt.get<Classroom>().className} > Students > ${getIt.get<Student>().basicInfo!.name}',
                isWidget: true,
                widget: null),
            SizedBox(
              width: 1.sw,
              height: 0.7.sh,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const StudentDetailCardWidget(title: 'Grades'),
                    const StudentDetailCardWidget(title: 'Absences'),
                    GeneralConstants.userType == UserType.parent
                        ? const StudentDetailCardWidget(title: 'Exams')
                        : const SizedBox(),
                    SizedBox(height: 50.h)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class StudentDetailCardWidget extends StatelessWidget {
  final String title;
  const StudentDetailCardWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: InkWell(
        onTap: () {
          if (title == 'Absences') {
            getIt.get<AppRouter>().pushNamed('/student_rollcall_view');
          } else if (title == 'Grades') {
            getIt.get<AppRouter>().pushNamed('/student_score_view');
          } else {
            getIt.get<AppRouter>().pushNamed('/exam_page');
          }
        },
        child: Container(
          width: 341.w,
          height: 188.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.sp),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.sp,
                  spreadRadius: 0,
                  color: const Color.fromARGB(70, 55, 55, 55),
                  offset: const Offset(1, 1),
                )
              ]),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: 16.0.h, right: 28.w),
                  child: Text(
                    title,
                    style:
                        TextStyle(fontSize: 40.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 45.0.w),
                child: ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topCenter,
                    stops: const [0.2, 0.65],
                    colors: [
                      Colors.black12,
                      Colors.black12.withAlpha(5),
                    ],
                  ).createShader(Offset.zero & bounds.size),
                  child: title == 'Grades'
                      ? Text(
                          '20',
                          style: TextStyle(
                              fontSize: 150.sp, fontWeight: FontWeight.bold),
                        )
                      : title == 'Absences'
                          ? Padding(
                              padding: EdgeInsets.only(top: 16.0.h),
                              child: Icon(Icons.checklist_sharp, size: 180.sp),
                            )
                          : Padding(
                              padding: EdgeInsets.only(top: 16.0.h),
                              child:
                                  Icon(Icons.menu_book_rounded, size: 180.sp),
                            ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
