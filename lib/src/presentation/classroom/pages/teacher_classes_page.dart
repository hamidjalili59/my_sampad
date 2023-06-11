import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/classroom/bloc/classroom_bloc.dart';
import 'package:my_sampad/src/presentation/classroom/bloc/teacher_classroom/teacher_classroom_bloc.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:ndialog/ndialog.dart';
import 'package:qr_flutter/qr_flutter.dart';

class TeacherClassesPage extends StatelessWidget {
  const TeacherClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => getIt.get<ClassroomBloc>(),
          child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: BlocBuilder<TeacherClassroomBloc, TeacherClassroomState>(
              bloc: getIt.get<TeacherClassroomBloc>(),
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppbarSchoolWidget(
                        title: 'کلاس ها : ',
                        titleHelper:
                            'با کلیک بر روی هر کلاس میتوانید گزینه های بیشتری برای کلاس را مشاهده کنید',
                        pathString: 'مدارس >  کلاس‌ها',
                        isWidget: true,
                        widget: InkWell(
                          onTap: () async {
                            await NDialog(
                              dialogStyle:
                                  DialogStyle(contentPadding: EdgeInsets.zero),
                              content: SizedBox(
                                width: 285.w,
                                height: 285.w,
                                child: Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0.sp),
                                    child: QrImageView(
                                      data: 'teacher_hamidjalili 5060708090',
                                      padding: EdgeInsets.zero,
                                    ),
                                  ),
                                ),
                              ),
                            ).show(context);
                          },
                          child: SizedBox(
                            width: 80.w,
                            height: 70.h,
                            child: Icon(
                              Icons.qr_code_scanner_rounded,
                              size: 38.sp,
                            ),
                          ),
                        )),
                    SizedBox(
                      width: 1.sw,
                      height: 0.69.sh,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 8,
                            child: state.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 20.h),
                                    itemCount: state.classes.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(top: 15.0.h),
                                        child: InkWell(
                                          onTap: () {
                                            if (getIt
                                                .isRegistered<Classroom>()) {
                                              getIt.unregister<Classroom>();
                                              getIt
                                                  .registerSingleton<Classroom>(
                                                      state.classes[index]);
                                            } else {
                                              getIt
                                                  .registerSingleton<Classroom>(
                                                      state.classes[index]);
                                            }
                                            getIt.get<AppRouter>().pushNamed(
                                                '/class_details_page');
                                          },
                                          child: Container(
                                            width: 339.w,
                                            height: 129.h,
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
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.sp),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 110.w,
                                                        height: 25.h,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            state.classes[index]
                                                                .className,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 18.sp,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Ordibehesht',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 5.h),
                                                      SizedBox(
                                                        width: 110.w,
                                                        height: 25.h,
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerRight,
                                                          child: Text(
                                                            state.classes[index]
                                                                .courseName,
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontSize: 18.sp,
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Ordibehesht',
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 4,
                                                    child: SizedBox(
                                                      height: 96.h,
                                                      child: Image.asset(
                                                          PngAssets.classroom),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color(0xffe8ffe8),
                                  borderRadius: BorderRadius.circular(11.sp),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          const Color.fromARGB(65, 36, 36, 36),
                                      blurRadius: 4.sp,
                                      spreadRadius: 0,
                                    )
                                  ]),
                              width: 330.w,
                              height: 130.h,
                              alignment: Alignment.center,
                              child: SizedBox(
                                width: 315,
                                child: Text(
                                  'شما میتوانید بعد از انتخاب هر کدام داخل صفحه اصلی با فشردن کلید بازگشت به این صفحه بازگردید\nگزینه  Qr-Code  بالا جهت حضور و غیاب دبیران محترم استفاده میشود',
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
