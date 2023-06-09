import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/rollcall/bloc/rollcall_class/class_rollcall/class_rollcall_bloc.dart';

// ignore: must_be_immutable
class ClassRollCallPage extends StatelessWidget {
  ClassRollCallPage({super.key});
  bool hamidbool = false;
  int currentindex = 0;
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
                        'شهید بهشتی  --  کلاس‌ها -- ریاضی 2  -- حضور غیاب',
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
                            onPageChanged: (value) {
                              currentindex = value;
                            },
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
                                          '${currentindex + 1}/${state.students.length}',
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
              // return Stack(
              //   children: [
              //     Positioned.fill(
              //       child: PageView.builder(
              //           onPageChanged: (value) {
              //             currentindex = value;
              //           },
              //           itemCount: state.students.length,
              //           itemBuilder: ((context, index) {
              //             return Container(
              //               alignment: Alignment.center,
              //               decoration: BoxDecoration(
              //                 gradient: LinearGradient(
              //                   colors: [
              //                     Colors.blueAccent.withOpacity(0.4),
              //                     Colors.white,
              //                   ],
              //                   begin: Alignment.topCenter,
              //                   end: Alignment.bottomCenter,
              //                 ),
              //               ),
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.center,
              //                 children: [
              //                   Padding(
              //                     padding: EdgeInsets.only(top: 14.0.h),
              //                     child: Container(
              //                       decoration: BoxDecoration(
              //                           color: Colors.black54,
              //                           borderRadius:
              //                               BorderRadius.circular(26.r)),
              //                       width: 0.55.sw,
              //                       height: 0.35.sh,
              //                       child: Padding(
              //                         padding: const EdgeInsets.all(2.0),
              //                         child: ClipRRect(
              //                           borderRadius:
              //                               BorderRadius.circular(26.r),
              //                           child: Container(
              //                             color: const Color.fromARGB(
              //                                 255, 255, 255, 255),
              //                             child: SvgPicture.asset(
              //                                 'assets/profile.svg'),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                   SizedBox(height: 20.h),
              //                   Text(
              //                     state.students[index].basicInfo!.name,
              //                     style: TextStyle(
              //                         fontSize: 26.r,
              //                         color: Colors.black87,
              //                         fontWeight: FontWeight.w700),
              //                   ),
              //                   SizedBox(height: 20.h),
              //                   Material(
              //                     type: MaterialType.card,
              //                     color: state.rollcalls[index].absent
              //                         ? Colors.grey
              //                         : Colors.greenAccent,
              //                     borderRadius:
              //                         const BorderRadiusDirectional.all(
              //                       Radius.elliptical(30, 15),
              //                     ),
              //                     child: InkWell(
              //                       splashColor: !state.rollcalls[index].absent
              //                           ? Colors.grey
              //                           : Colors.greenAccent,
              //                       borderRadius: const BorderRadius.all(
              //                         Radius.elliptical(30, 15),
              //                       ),
              //                       onTap: () {
              //                         bloc.add(
              //                           ClassRollcallEvent.setRollcalls(index),
              //                         );
              //                       },
              //                       child: SizedBox(
              //                         height: 45.h,
              //                         width: 120.w,
              //                         child: Center(
              //                           child: Text(
              //                             'حاضر',
              //                             style: TextStyle(
              //                                 color: Colors.white,
              //                                 fontSize: 22.r,
              //                                 fontWeight: FontWeight.w900),
              //                             textAlign: TextAlign.center,
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             );
              //           })),
              //     ),
              //     Positioned.fill(
              //       child: Align(
              //         alignment: Alignment.topCenter,
              //         child: Container(
              //           width: 0.95.sw,
              //           height: 130.h,
              //           alignment: Alignment.center,
              //           decoration: BoxDecoration(
              //             color: const Color.fromARGB(221, 17, 11, 46),
              //             borderRadius: BorderRadius.only(
              //               bottomLeft: Radius.circular(
              //                 16.r,
              //               ),
              //               bottomRight: Radius.circular(
              //                 16.r,
              //               ),
              //             ),
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                 children: [
              //                   InkWell(
              //                     onTap: () {
              //                       getIt.get<AppRouter>().pop();
              //                     },
              //                     child: SizedBox(
              //                       width: 60.w,
              //                       height: 60.w,
              //                       child: Icon(
              //                         Icons.arrow_back_ios_new,
              //                         color: Colors.white,
              //                         size: 26.r,
              //                       ),
              //                     ),
              //                   ),
              //                   Column(
              //                     children: [
              //                       Padding(
              //                         padding:
              //                             EdgeInsets.symmetric(vertical: 8.w),
              //                         child: Text(
              //                           getIt
              //                               .get<TeacherGetSchools>()
              //                               .schoolName,
              //                           style: TextStyle(
              //                               fontSize: 16.sp,
              //                               color: Colors.white,
              //                               fontWeight: FontWeight.w600),
              //                           textAlign: TextAlign.center,
              //                         ),
              //                       ),
              //                       Container(
              //                         alignment: Alignment.center,
              //                         decoration: BoxDecoration(
              //                           border: Border.all(
              //                               color: Colors.white70, width: 3),
              //                           borderRadius:
              //                               BorderRadius.circular(16.r),
              //                         ),
              //                         width: 120,
              //                         height: 40,
              //                         child: Text(
              //                           '${currentindex + 1} / ${state.students.length}',
              //                           style: TextStyle(
              //                             fontSize: 16.r,
              //                             color: Colors.white,
              //                             fontWeight: FontWeight.w900,
              //                           ),
              //                         ),
              //                       ),
              //                     ],
              //                   ),
              //                   InkWell(
              //                     onTap: () {
              //                       if (state.isLoading) {
              //                         return;
              //                       }
              //                       bloc.add(
              //                         const ClassRollcallEvent
              //                             .submitRollcalls(),
              //                       );
              //                     },
              //                     child: SizedBox(
              //                       width: 60.w,
              //                       height: 40.w,
              //                       child: Image.asset(
              //                         PngAssets.checkIcon,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // );
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
