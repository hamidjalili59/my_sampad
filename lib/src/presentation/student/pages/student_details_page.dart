import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/routes/router.dart';
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
            const AppbarSchoolWidget(
                title: 'اطلاعات دانش آموز : ',
                titleHelper:
                    'کدام یک از اطلاعات دانش آموز را نیاز دارید کلیک کنید روی آن',
                pathString:
                    'شهید بهشتی  --  کلاس‌ها -- ریاضی 2  -- حمید جلیلی نسب',
                isWidget: true,
                widget: null),
            SizedBox(
              width: 1.sw,
              height: 0.7.sh,
              child: const Column(
                children: [
                  StudentDetailCardWidget(title: 'نمرات'),
                  StudentDetailCardWidget(title: 'غیبت‌ها'),
                ],
              ),
            )
          ],
        ),
      ),
    ));
    // bloc.add(const HomeEvent.changePages(AppbarPageType.score));
    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: GeneralConstants.backgroundColor,
    //     body: BlocProvider(
    //       create: (_) => bloc,
    //       child: BlocBuilder<HomeBloc, HomeState>(
    //         builder: (context, state) {
    //           return Column(
    //             children: [
    //               Expanded(
    //                   flex: 3,
    //                   child: HomeCustomAppBar(
    //                     bloc: bloc,
    //                     title: getIt.get<Student>().basicInfo!.name,
    //                     buttonsList:
    //                         GeneralConstants.userType == UserType.parent
    //                             ? const [
    //                                 AppbarPageType.score,
    //                                 AppbarPageType.rollcall,
    //                                 AppbarPageType.exams,
    //                               ]
    //                             : const [
    //                                 AppbarPageType.score,
    //                                 AppbarPageType.rollcall,
    //                               ],
    //                   )),
    //               Expanded(
    //                 flex: 12,
    //                 child: BlocBuilder<HomeBloc, HomeState>(
    //                   bloc: bloc,
    //                   builder: (context, state) {
    //                     return state.maybeWhen(
    //                       orElse: () => const SizedBox(),
    //                       currentPageIndex: (pageState) {
    //                         if (pageState == AppbarPageType.score) {
    //                           return const SingleScoreViewPage();
    //                         } else if (pageState == AppbarPageType.rollcall) {
    //                           return const SizedBox(
    //                               child: SingleStudentRollcallsPage());
    //                         } else {
    //                           return const SizedBox(child: ExamPage());
    //                         }
    //                       },
    //                     );
    //                   },
    //                 ),
    //               ),
    //             ],
    //           );
    //         },
    //       ),
    //     ),
    //   ),
    // );
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
          if (title == 'غیبت‌ها') {
            getIt.get<AppRouter>().pushNamed('/student_rollcall_view');
          } else {
            getIt.get<AppRouter>().pushNamed('/student_score_view');
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
                    style: TextStyle(
                        fontSize: 46.sp,
                        fontFamily: 'Ordibehesht',
                        fontWeight: FontWeight.bold),
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
                  child: title == 'نمرات'
                      ? Text(
                          '20',
                          style: TextStyle(
                              fontSize: 150.sp, fontWeight: FontWeight.bold),
                        )
                      : Padding(
                          padding: EdgeInsets.only(top: 16.0.h),
                          child: Icon(Icons.checklist_sharp, size: 180.sp),
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
