import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';

import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/home/domain/models/appbar_page_type.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/home/bloc/home_bloc.dart';
import 'package:my_sampad/src/presentation/home/widgets/custom_appbar_row_widget.dart';

class HomeCustomAppBar extends StatelessWidget {
  HomeCustomAppBar({
    Key? key,
    required this.bloc,
    required this.title,
    required this.buttonsList,
  }) : super(key: key);

  final HomeBloc bloc;
  final String title;
  final List<AppbarPageType> buttonsList;
  final AppRouter appRouter = getIt.get<AppRouter>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color: GeneralConstants.mainColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(12.r),
              bottomRight: Radius.circular(12.r)),
        ),
        height: 0.18.sh,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  title != 'MY School'
                      ? InkWell(
                          onTap: () {
                            appRouter.pop();
                          },
                          child: SizedBox(
                            width: 60.w,
                            height: 80.w,
                            child: Icon(Icons.arrow_back_ios_new_sharp,
                                color: Colors.white, size: 28.r),
                          ),
                        )
                      : SizedBox(
                          width: 50.w,
                          child: InkWell(
                            onTap: () {},
                            child: FormBuilderDropdown(
                              name: 'more',
                              icon: Icon(
                                Icons.more_vert_rounded,
                                color: Colors.white,
                                size: 36.r,
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: 'Logout',
                                  child: InkWell(
                                      onTap: () {
                                        getIt
                                            .get<HomeBloc>()
                                            .add(const HomeEvent.logout());
                                      },
                                      child: const Text(
                                        'Logout',
                                        textAlign: TextAlign.center,
                                      )),
                                )
                              ],
                            ),
                          ),
                        ),
                  Padding(
                    padding: EdgeInsets.only(left: 24.0.w),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16.0.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.r,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Text(
                                'Smart School Control',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 12.r,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 8.0.h),
                          child: SizedBox(
                            width: 110.w,
                            height: 110.w,
                            child: Image.asset(
                              PngAssets.logo,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.zero,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                ),
                child: BlocBuilder<HomeBloc, HomeState>(
                  bloc: bloc,
                  builder: (context, state) {
                    return state.maybeWhen(
                      currentPageIndex: (currentPageName) => SizedBox(
                        width: 1.sw,
                        height: 70,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ListView.builder(
                                itemExtent: 100.w,
                                shrinkWrap: true,
                                itemCount: buttonsList.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return CustomRowButtonWidget(
                                      title: buttonsList[index].name ==
                                              'teacher'
                                          ? 'Teachers'
                                          : buttonsList[index].name ==
                                                  'classroom'
                                              ? 'Classes'
                                              : buttonsList[index].name ==
                                                      'course'
                                                  ? 'Courses'
                                                  : buttonsList[index].name ==
                                                          'student'
                                                      ? 'Students'
                                                      : buttonsList[index]
                                                                  .name ==
                                                              'exams'
                                                          ? 'Exams'
                                                          : buttonsList[index]
                                                                      .name ==
                                                                  'score'
                                                              ? 'Scores'
                                                              : buttonsList[index]
                                                                          .name ==
                                                                      'teacherHome'
                                                                  ? 'Classes'
                                                                  : 'Absences',
                                      indexType: buttonsList[index],
                                      currentIndexType: currentPageName,
                                      bloc: bloc);
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      orElse: () => const SizedBox(),
                    );
                  },
                ),
              ),
            ),
          ],
        ));
  }
}
