import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/features/student/domain/models/student_model/student.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/rollcall/bloc/rollcall_single/rollcall_bloc.dart';

class SingleStudentRollcallsPage extends StatefulWidget {
  const SingleStudentRollcallsPage({super.key});

  @override
  State<SingleStudentRollcallsPage> createState() =>
      _SingleStudentRollcallsPageState();
}

class _SingleStudentRollcallsPageState
    extends State<SingleStudentRollcallsPage> {
  @override
  void initState() {
    getIt
        .get<RollcallBloc>()
        .add(RollcallEvent.getRollcalls(getIt.get<Student>().studentId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<RollcallBloc, RollcallState>(
          bloc: getIt.get<RollcallBloc>(),
          builder: (context, rollcallState) {
            if (rollcallState.isLoading) {
              return Center(
                child: SizedBox(
                    width: 55.w,
                    height: 55.w,
                    child: const CircularProgressIndicator()),
              );
            } else {
              return SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: Column(
                  children: [
                    AppbarSchoolWidget(
                        title: 'Student Absences : ',
                        titleHelper:
                            'Each tile below contains information about the day and time of each absence for this student',
                        pathString: GeneralConstants.userType ==
                                    UserType.admin ||
                                GeneralConstants.userType == UserType.deputy
                            ? 'Main > Classes > ${getIt.get<Classroom>().className} > Students > ${getIt.get<Student>().basicInfo!.name} > Absences'
                            : GeneralConstants.userType == UserType.parent
                                ? 'Students > ${getIt.get<Student>().basicInfo!.name} > Absences'
                                : 'Classes > ${getIt.get<Classroom>().className} > Students > ${getIt.get<Student>().basicInfo!.name} > Absences',
                        isWidget: true,
                        widget: null),
                    SizedBox(
                      height: 0.69.sh,
                      child: rollcallState.rollcalls.isEmpty
                          ? SizedBox(
                              width: 1.sw,
                              height: 0.65.sh,
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
                                      'No information available',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18.r),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.h),
                              itemCount: rollcallState.rollcalls.length,
                              itemBuilder: (context, index) {
                                String tarikh = rollcallState
                                    .rollcalls[(index + 1) ~/ 2].date
                                    .toString()
                                    .substring(0, 10);
                                // intl.DateFormat('MM/dd/yyyy HH:mm:ss')
                                //     .parse(rollcallState
                                //         .rollcalls[(index + 1) ~/ 2].date)
                                //     .toFancyString();

                                String zang =
                                    ' ${rollcallState.rollcalls.map((e) => e.classTime).toList()[(index) ~/ 2] == 1 ? 'First' : rollcallState.rollcalls.map((e) => e.classTime).toList()[(index) ~/ 2] == 2 ? 'Second' : rollcallState.rollcalls.map((e) => e.classTime).toList()[(index) ~/ 2] == 3 ? 'Third' : rollcallState.rollcalls.map((e) => e.classTime).toList()[(index) ~/ 2] == 4 ? 'Fourth' : 'Fifth'} Hour';
                                //
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.sp),
                                        boxShadow: [
                                          BoxShadow(
                                              color: const Color.fromARGB(
                                                  70, 55, 55, 55),
                                              spreadRadius: 0,
                                              blurRadius: 4.sp,
                                              offset: const Offset(1, 1))
                                        ]),
                                    width: 341.w,
                                    height: 100.h,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            right: 0,
                                            child: Container(
                                              width: 200.w,
                                              height: 35.h,
                                              decoration: BoxDecoration(
                                                  color: Colors.redAccent,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  12.sp))),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Unjustified Absence',
                                                style: TextStyle(
                                                    fontSize: 13.sp,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                        Positioned(
                                            bottom: 10.h,
                                            left: 20.w,
                                            right: 20.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    tarikh + zang,
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: SizedBox(
                                                      width: 60.w,
                                                      height: 60.w,
                                                      child: SvgPicture.asset(
                                                          SvgAssets.absent)),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
