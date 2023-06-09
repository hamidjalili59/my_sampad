import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/teacher/bloc/teacher/teacher_bloc.dart';
import 'package:ndialog/ndialog.dart';

class TeacherListPage extends StatelessWidget {
  const TeacherListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Align(
          alignment: Alignment.bottomCenter,
          child: InkWell(
            onTap: () async {
              await NDialog(
                dialogStyle: DialogStyle(
                  borderRadius: BorderRadius.circular(12.sp),
                ),
                content: SizedBox(
                  width: 0.4.sw,
                  height: 0.2.sh,
                ),
              ).show(context);
            },
            child: Container(
              width: 130.w,
              height: 60.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12.sp),
                  boxShadow: [
                    BoxShadow(
                        color: const Color.fromARGB(70, 55, 55, 55),
                        spreadRadius: 0,
                        blurRadius: 4.sp,
                        offset: const Offset(1, 1))
                  ]),
              alignment: Alignment.center,
              child: Text(
                'اضافه کردن دبیر',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontFamily: 'Ordibehesht',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: BlocProvider(
            create: (_) => getIt.get<TeacherBloc>(),
            child: BlocBuilder<TeacherBloc, TeacherState>(
              bloc: getIt.get<TeacherBloc>(),
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: [
                    AppbarSchoolWidget(
                      title: 'مدیریت دبیران',
                      titleHelper:
                          'در این صفحه می‌توانید دبیران را حذف یا اضافه یا پاک کنید',
                      pathString: 'صفحه اصلی -- مدیریت دبیران',
                      isWidget: true,
                      widget: DropdownButton<String>(
                        items: [
                          DropdownMenuItem(
                            alignment: Alignment.center,
                            value: 'حذف',
                            onTap: () {
                              print('حذف');
                            },
                            child: Text(
                              'حذف',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  color: Colors.black,
                                  fontFamily: 'Ordibehesht',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          DropdownMenuItem(
                            alignment: Alignment.center,
                            value: 'تغییر',
                            onTap: () {
                              print('تغییر');
                            },
                            child: Text(
                              'تغییر',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 24.sp,
                                  color: Colors.black,
                                  fontFamily: 'Ordibehesht',
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                        onChanged: (value) {},
                        icon: Icon(
                          Icons.more_vert_rounded,
                          size: 36.sp,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 1.sw,
                      height: 0.69.sh,
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: state.teachers.length,
                        padding: EdgeInsets.all(16.r),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 260.h,
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 10.h,
                        ),
                        itemBuilder: (context, index) {
                          return Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12.sp),
                                boxShadow: [
                                  BoxShadow(
                                      color:
                                          const Color.fromARGB(70, 55, 55, 55),
                                      spreadRadius: 0,
                                      blurRadius: 4.sp,
                                      offset: const Offset(1, 1))
                                ]),
                            child: Column(
                              children: [
                                SizedBox(
                                    width: 150.w,
                                    height: 160.h,
                                    child: Image.asset(PngAssets.teacher)),
                                SizedBox(height: 20.h),
                                Text(
                                  'استاد ${state.teachers[index].basicInfo!.name}',
                                  textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontSize: 24.sp,
                                      color: Colors.black,
                                      fontFamily: 'Ordibehesht',
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
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
