import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/rollcall/bloc/rollcall_class/class_rollcall/class_rollcall_bloc.dart';

// ignore: must_be_immutable
class ClassRollCallPage extends StatelessWidget {
  ClassRollCallPage({super.key});
  bool hamidbool = false;
  final ClassRollcallBloc bloc = getIt.get<ClassRollcallBloc>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => bloc,
        child: Scaffold(
          body: BlocBuilder<ClassRollcallBloc, ClassRollcallState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  AppbarSchoolWidget(
                    title: 'حضور غیاب : ',
                    titleHelper:
                        'با کشیدن صفحه به راست و چپ بین دانش آموزان جابه‌‌جا شوید و حضور غیاب کنید',
                    pathString:
                        'کلاس‌ها > ${getIt.get<Classroom>().className} > دانش‌آموزان > حضور غیاب',
                    icon: Icons.check_rounded,
                    onPressed: () {
                      if (state.isLoading) {
                        return;
                      }
                      bloc.add(
                        const ClassRollcallEvent.submitRollcalls(),
                      );
                    },
                  ),
                  SizedBox(
                    width: 1.sw,
                    height: 0.69.sh,
                    child: state.students.isEmpty
                        ? const Center(
                            child: EmptyWidget(),
                          )
                        : PageView.builder(
                            itemCount: state.students.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Expanded(
                                    flex: 8,
                                    child: SizedBox(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Container(
                                          width: 250.w,
                                          height: 280.h,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(
                                                      70, 55, 55, 55),
                                                  offset: const Offset(1, 1),
                                                  blurRadius: 4.sp,
                                                  spreadRadius: 0,
                                                )
                                              ]),
                                          child: Column(children: [
                                            SizedBox(height: 10.h),
                                            SizedBox(
                                              height: 196.h,
                                              width: 190.w,
                                              child: Image.asset(
                                                PngAssets.student,
                                              ),
                                            ),
                                            SizedBox(height: 15.h),
                                            Text(
                                              state.students[index].basicInfo!
                                                  .name,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 22.sp,
                                                color: Colors.black,
                                                fontFamily: 'Ordibehesht',
                                              ),
                                            )
                                          ]),
                                        ),
                                        Text(
                                          '${index + 1}/${state.students.length}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 24.sp,
                                            color: Colors.black,
                                            fontFamily: 'Ordibehesht',
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: SizedBox(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                bloc.add(
                                                  ClassRollcallEvent
                                                      .setRollcalls(
                                                          index, true),
                                                );
                                              },
                                              child: Container(
                                                width: 130.w,
                                                height: 53.h,
                                                decoration: BoxDecoration(
                                                    color: state
                                                            .rollcalls[index]
                                                            .absent
                                                        ? Colors.redAccent
                                                        : Colors.grey,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: const Color(
                                                                0xff6a6a6a)
                                                            .withAlpha(70),
                                                        offset:
                                                            const Offset(1, 2),
                                                        blurRadius: 5.sp,
                                                        spreadRadius: 0,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    16.sp),
                                                            bottomLeft: Radius
                                                                .circular(
                                                                    16.sp))),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'غایب',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 24.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'Ordibehesht',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                                height: 53.h,
                                                child: VerticalDivider(
                                                    width: 2.w)),
                                            InkWell(
                                              onTap: () {
                                                bloc.add(
                                                  ClassRollcallEvent
                                                      .setRollcalls(
                                                          index, false),
                                                );
                                              },
                                              child: Container(
                                                width: 130.w,
                                                height: 53.h,
                                                decoration: BoxDecoration(
                                                    color: state
                                                            .rollcalls[index]
                                                            .absent
                                                        ? Colors.grey
                                                        : Colors.greenAccent,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: const Color(
                                                                0xff6a6a6a)
                                                            .withAlpha(70),
                                                        offset:
                                                            const Offset(1, 2),
                                                        blurRadius: 5.sp,
                                                        spreadRadius: 0,
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topRight:
                                                                Radius.circular(
                                                                    16.sp),
                                                            bottomRight: Radius
                                                                .circular(
                                                                    16.sp))),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'حاضر',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontSize: 24.sp,
                                                    color: Colors.white,
                                                    fontFamily: 'Ordibehesht',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ],
                              );
                            },
                          ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.w,
      height: 280.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.sp),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(70, 55, 55, 55),
              offset: const Offset(1, 1),
              blurRadius: 4.sp,
              spreadRadius: 0,
            )
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 188.w,
            height: 196.h,
            child: SvgPicture.asset(
              SvgAssets.empty,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            'دانش‌آموزی در کلاس اضافه نشده',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22.sp,
              color: Colors.black,
              fontFamily: 'Ordibehesht',
            ),
          ),
        ],
      ),
    );
  }
}
