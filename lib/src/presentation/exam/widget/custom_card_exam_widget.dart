import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/exam/domain/models/exam_model.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/exam/bloc/exam/exam_bloc.dart';
import 'package:ndialog/ndialog.dart';

class CustomCardExamWidget extends StatelessWidget {
  const CustomCardExamWidget({
    Key? key,
    required this.exam,
  }) : super(key: key);
  final Exam exam;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16.h),
      child: InkWell(
        child: SizedBox(
          child: BlocBuilder<ExamBloc, ExamState>(
            bloc: getIt.get<ExamBloc>(),
            builder: (context, examState) {
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 12.0.h, left: 16.w, right: 12.w),
                      child: Container(
                        constraints: BoxConstraints(
                            maxHeight: 200.h,
                            minHeight: 100.h,
                            minWidth: 0.87.sw),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(12.r),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(31, 0, 0, 0),
                                blurRadius: 8,
                                spreadRadius: 0.001,
                                blurStyle: BlurStyle.outer,
                                offset: Offset(0.1, 0.1))
                          ],
                        ),
                        padding:
                            EdgeInsets.only(top: 40.h, left: 20.w, right: 20.w),
                        child: Text(
                          exam.examDescription,
                          textAlign: TextAlign.center,
                          maxLines: null,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0.h, right: 5.0.w),
                        child: Container(
                          alignment: Alignment.center,
                          width: 155.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                              color: const Color(0xffe8ffe8),
                              borderRadius: BorderRadius.circular(11.sp),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color.fromARGB(65, 36, 36, 36),
                                    blurRadius: 3.sp,
                                    spreadRadius: 0,
                                    offset: const Offset(-1, 1))
                              ]),
                          child: Text(
                            exam.teacherName,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 12.0.h, left: 36.0.w),
                        child: GeneralConstants.userType == UserType.teacher &&
                                exam.teacherId ==
                                    getIt
                                        .get<OtpHandshakeResponse>()
                                        .teacher!
                                        .teacherId
                            ? InkWell(
                                onTap: () async {
                                  await NDialog(
                                    dialogStyle: DialogStyle(
                                      contentPadding: EdgeInsets.zero,
                                    ),
                                    title: SizedBox(
                                      height: 50.h,
                                      child: Text(
                                        'Are you sure about changing the exam status?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    content: SizedBox(
                                      width: 120.w,
                                      height: 50.h,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              getIt.get<AppRouter>().pop();
                                            },
                                            child: Container(
                                              width: 120.w,
                                              height: 45.h,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'cancel',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Exam tempExam = exam.copyWith(
                                                  isDone: !exam.isDone);
                                              getIt.get<ExamBloc>().add(
                                                  ExamEvent.updateExam(
                                                      tempExam));
                                              getIt.get<AppRouter>().pop();
                                            },
                                            child: Container(
                                              width: 120.w,
                                              height: 45.h,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.sp),
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'accept',
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ).show(context);
                                },
                                child: Container(
                                  width: 85.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black12),
                                      color: exam.isDone
                                          ? const Color(0xffe8ffe8)
                                          : const Color.fromARGB(
                                              255, 255, 232, 232),
                                      borderRadius:
                                          BorderRadius.circular(8.sp)),
                                  child: Center(
                                      child: Text(
                                    exam.isDone ? 'Done' : 'Not done',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      color: Colors.black,
                                    ),
                                  )),
                                ),
                              )
                            : Row(
                                children: [
                                  Icon(
                                    exam.isDone
                                        ? Icons.check_box_rounded
                                        : Icons.check_box_outline_blank_rounded,
                                    size: 26.r,
                                    color: exam.isDone
                                        ? Colors.green
                                        : Colors.black,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    width: 60.w,
                                    height: 40.h,
                                    child: Text(
                                      'Done',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.black,
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
        ),
      ),
    );
  }
}
