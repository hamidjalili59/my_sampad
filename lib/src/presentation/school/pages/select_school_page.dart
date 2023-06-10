import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/teacher/domain/models/teacher_get_schools.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/school/bloc/school/school_bloc.dart';

class SelectSchoolPage extends StatelessWidget {
  const SelectSchoolPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => getIt.get<SchoolBloc>(),
          child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: BlocBuilder<SchoolBloc, SchoolState>(
              bloc: getIt.get<SchoolBloc>(),
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AppbarSchoolWidget(
                        title: 'مدارس شما',
                        titleHelper:
                            'لطفا مدرسه ای که قصد ورود به آنرا دارید انتخاب کنید',
                        pathString: 'دبیر  -',
                        isWidget: true,
                        widget: null),
                    SizedBox(
                      width: 1.sw,
                      height: 0.69.sh,
                      child: state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : state.data.isEmpty
                              ? SizedBox(
                                  width: 1.sw,
                                  height: 0.5.sh,
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
                                          'شما مدرسه ای ندارد',
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
                                )
                              : Column(
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: state.isLoading
                                          ? const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            )
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 12.w,
                                                  vertical: 20.h),
                                              itemCount: state.data.keys.length,
                                              itemBuilder: (context, index) {
                                                return SelectSchoolTileWidget(
                                                  bloc: getIt.get<SchoolBloc>(),
                                                  index: index,
                                                );
                                              },
                                            ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: const Color(0xffe8ffe8),
                                            borderRadius:
                                                BorderRadius.circular(11.sp),
                                            boxShadow: [
                                              BoxShadow(
                                                color: const Color.fromARGB(
                                                    65, 36, 36, 36),
                                                blurRadius: 4.sp,
                                                spreadRadius: 0,
                                              )
                                            ]),
                                        width: 330.w,
                                        height: 109.h,
                                        alignment: Alignment.center,
                                        child: SizedBox(
                                          width: 315,
                                          child: Text(
                                            'شما میتوانید بعد از انتخاب هر کدام داخل صفحه اصلی با فشردن کلید بازگشت به این صفحه بازگردید',
                                            textAlign: TextAlign.start,
                                            textDirection: TextDirection.rtl,
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              color: Colors.black,
                                              fontFamily: 'Ordibehesht',
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                    )
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

class SelectSchoolTileWidget extends StatelessWidget {
  final SchoolBloc bloc;
  final int index;
  const SelectSchoolTileWidget({
    super.key,
    required this.bloc,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SchoolBloc, SchoolState>(
      bloc: bloc,
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (state.isLoading) {
              return;
            }
            if (getIt.isRegistered<TeacherGetSchools>()) {
              getIt.unregister<TeacherGetSchools>();
              TeacherGetSchools tempModel = TeacherGetSchools(
                int.tryParse(state.data.keys.toList()[index]) ?? 0,
                state.data.values.toList()[index]['school_ID'],
                state.data.values.toList()[index]['school_Name'],
              );
              getIt.registerSingleton<TeacherGetSchools>(tempModel);
            } else {
              TeacherGetSchools tempModel = TeacherGetSchools(
                int.tryParse(state.data.keys.toList()[index]) ?? 0,
                state.data.values.toList()[index]['school_ID'],
                state.data.values.toList()[index]['school_Name'],
              );
              getIt.registerSingleton<TeacherGetSchools>(tempModel);
            }
            getIt.get<AppRouter>().replaceNamed('/teacher_classes');
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: const Color.fromARGB(65, 55, 55, 55),
                      blurRadius: 4.sp,
                      spreadRadius: 0,
                      offset: const Offset(1, 1))
                ],
                borderRadius: BorderRadius.circular(12.sp)),
            width: 339.w,
            height: 129.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 6,
                  child: Text(
                    state.data.values.toList()[index]['school_Name'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      color: Colors.black,
                      fontFamily: 'Ordibehesht',
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SizedBox(
                      width: 175.w,
                      height: 175.h,
                      child: Image.asset(PngAssets.school)),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
