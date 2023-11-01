import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/teacher/domain/models/teacher.dart';
import 'package:intl/intl.dart' as intl;
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/rollcall/bloc/teacher_rollcall/teacher_rollcall_bloc.dart';
import 'package:persian_datetimepickers/persian_datetimepickers.dart';

class TeacherRollcallListPage extends StatefulWidget {
  const TeacherRollcallListPage({super.key});

  @override
  State<TeacherRollcallListPage> createState() =>
      _TeacherRollcallListPageState();
}

class _TeacherRollcallListPageState extends State<TeacherRollcallListPage> {
  TeacherRollcallBloc bloc = getIt.get<TeacherRollcallBloc>();
  @override
  void initState() {
    bloc.add(TeacherRollcallEvent.getRollcalls(
        GeneralConstants.userType == UserType.deputy
            ? getIt.get<OtpHandshakeResponse>().deputy!.schoolId
            : getIt.get<OtpHandshakeResponse>().principal!.schoolId,
        getIt.get<Teacher>().basicInfo!.phoneNumber));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<TeacherRollcallBloc, TeacherRollcallState>(
          bloc: bloc,
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
                        title: 'لیست حضور اساتید : ',
                        titleHelper:
                            'در این صفحه لیستی از حضور اساتید را مشاهده کنید',
                        pathString:
                            'صفحه‌اصلی > مدیریت‌دبیران > ${getIt.get<Teacher>().basicInfo!.name}',
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
                                                    fontSize: 14.sp,
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
                                                    intl.DateFormat(
                                                            'MM/dd/yyyy HH:mm:ss')
                                                        .parse(rollcallState
                                                            .rollcalls[
                                                                (index + 1) ~/
                                                                    2]
                                                            .date)
                                                        .toFancyString(),
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
