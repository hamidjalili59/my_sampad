import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/utils/function_helper.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/exam/domain/models/exam_model.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/exam/bloc/exam/exam_bloc.dart';

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
        onLongPress: GeneralConstants.userType == UserType.parent
            ? () {}
            : () => FunctionHelper().removeDialog(
                'امتحان',
                () => getIt
                    .get<ExamBloc>()
                    .add(ExamEvent.removeExam(exam.examId))),
        child: SizedBox(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding:
                      EdgeInsets.only(top: 12.0.h, left: 16.w, right: 12.w),
                  child: Container(
                    constraints: BoxConstraints(
                        maxHeight: 0.5.sh,
                        minHeight: 0.05.sh,
                        minWidth: 0.85.sw),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 243, 243, 234),
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
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 50.0.h, left: 18.w, right: 18.w, bottom: 15.h),
                      child: Text(
                        exam.examDescription,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.black,
                          fontFamily: 'Ordibehesht',
                        ),
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
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.black,
                          fontFamily: 'Ordibehesht',
                        ),
                      ),
                    ),
                  )),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 12.0.h, left: 36.0.w),
                    child: Row(
                      children: [
                        Icon(
                          exam.isDone
                              ? Icons.check_box_rounded
                              : Icons.check_box_outline_blank_rounded,
                          size: 26.r,
                          color: exam.isDone ? Colors.green : Colors.black,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 60.w,
                          height: 40.h,
                          child: Text(
                            'انجام‌شده',
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                              fontFamily: 'Ordibehesht',
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
