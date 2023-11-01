import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/splash/widgets/rule_tile_widget.dart';

class ClassDetailsPage extends StatelessWidget {
  const ClassDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppbarSchoolWidget(
                title: 'Class Detail :',
                titleHelper:
                    'You can access the features of each by selecting any of the options below',
                pathString: GeneralConstants.userType == UserType.admin ||
                        GeneralConstants.userType == UserType.deputy
                    ? 'Main > Classes > ${getIt.get<Classroom>().className}'
                    : 'Schools > Classes > ${getIt.get<Classroom>().className}',
                isWidget: true,
                widget: null,
              ),
              SizedBox(
                width: 1.sw,
                height: 0.69.sh,
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 190.h,
                          crossAxisSpacing: 20.w,
                          mainAxisSpacing: 10.h,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 25.h),
                        itemCount:
                            GeneralConstants.userType == UserType.admin ? 3 : 2,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              if (index == 0) {
                                getIt
                                    .get<AppRouter>()
                                    .pushNamed('/class_student_page');
                              } else if (index == 1 &&
                                  GeneralConstants.userType == UserType.admin) {
                                getIt
                                    .get<AppRouter>()
                                    .pushNamed('/mediator_page');
                              } else {
                                getIt.get<AppRouter>().pushNamed('/exam_page');
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color.fromARGB(70, 55, 55, 55),
                                    blurRadius: 4.sp,
                                    spreadRadius: 0,
                                    offset: const Offset(1, 2),
                                  )
                                ],
                              ),
                              width: 165.w,
                              height: 203.h,
                              child: ImageInsideContainerWidget(
                                image: index == 0
                                    ? PngAssets.student
                                    : index == 1 &&
                                            GeneralConstants.userType ==
                                                UserType.admin
                                        ? PngAssets.teacher
                                        : SvgAssets.course,
                                offset: index == 0
                                    ? const Offset(10, 0)
                                    : index == 1 &&
                                            GeneralConstants.userType ==
                                                UserType.admin
                                        ? const Offset(10, 20)
                                        : const Offset(10, 5),
                                paddingContainer: index == 0
                                    ? 70.h
                                    : index == 1 &&
                                            GeneralConstants.userType ==
                                                UserType.admin
                                        ? 50.h
                                        : 45.h,
                                isSvg: index == 0 ||
                                        index == 1 &&
                                            GeneralConstants.userType ==
                                                UserType.admin
                                    ? false
                                    : true,
                                title: index == 0
                                    ? 'Students'
                                    : index == 1 &&
                                            GeneralConstants.userType ==
                                                UserType.admin
                                        ? 'Class Teacher'
                                        : 'Class Exams',
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffe8ffe8),
                            borderRadius: BorderRadius.circular(11.sp),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(65, 36, 36, 36),
                                blurRadius: 4.sp,
                                spreadRadius: 0,
                              )
                            ]),
                        width: 330.w,
                        height: 109.h,
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 290.w,
                          child: Text(
                            'Adding students to the class is only possible by the principle. Registering exams is only executable by the teacher',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.5.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
