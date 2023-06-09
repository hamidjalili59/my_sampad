import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:intl/intl.dart' as intl;
import 'package:my_sampad/src/features/student/domain/models/student_model/student.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/rollcall/bloc/rollcall_single/rollcall_bloc.dart';
import 'package:persian_datetimepickers/persian_datetimepickers.dart';

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
                    const AppbarSchoolWidget(
                      title: 'غیبت‌های دانش آموز : ',
                      titleHelper:
                          'هر یک از کاشی های زیر حاوی اطلاعات روز و ساعت کلاس هر غیبت این دانش‌آموز است',
                      pathString:
                          'شهید بهشتی  --  کلاس‌ها -- ریاضی 2  -- حمید جلیلی نسب -- غیبت‌ها',
                    ),
                    SizedBox(
                      height: 0.69.sh,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(top: 10.h),
                        itemCount: rollcallState.rollcalls.length,
                        itemBuilder: (context, index) {
                          String tarikh = intl.DateFormat('MM/dd/yyyy HH:mm:ss')
                              .parse(rollcallState
                                  .rollcalls[(index + 1) ~/ 2].date)
                              .toFancyString();

                          String zang =
                              ' زنگ ${rollcallState.rollcalls.map((e) => e.classTime).toList()[(index) ~/ 2] == 1 ? 'اول' : rollcallState.rollcalls.map((e) => e.classTime).toList()[(index) ~/ 2] == 2 ? 'دوم' : rollcallState.rollcalls.map((e) => e.classTime).toList()[(index) ~/ 2] == 3 ? 'سوم' : rollcallState.rollcalls.map((e) => e.classTime).toList()[(index) ~/ 2] == 4 ? 'چهارم' : rollcallState.rollcalls.map((e) => e.classTime).toList()[(index) ~/ 2]}';
                          //
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12.sp),
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
                                            borderRadius: BorderRadius.only(
                                                topRight:
                                                    Radius.circular(12.sp))),
                                        alignment: Alignment.center,
                                        child: Text(
                                          'غیبت غیر موجه',
                                          style: TextStyle(
                                              fontSize: 18.sp,
                                              color: Colors.white,
                                              fontFamily: 'Ordibehesht',
                                              fontWeight: FontWeight.bold),
                                        ),
                                      )),
                                  Positioned(
                                      bottom: 10.h,
                                      left: 20.w,
                                      right: 20.w,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 5,
                                            child: Text(
                                              tarikh + zang,
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: Colors.black,
                                                  fontFamily: 'Ordibehesht',
                                                  fontWeight: FontWeight.bold),
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
