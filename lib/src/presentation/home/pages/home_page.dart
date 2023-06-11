import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/auth/bloc/auth_bloc.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/splash/widgets/rule_tile_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppbarSchoolWidget(
                title: 'صفحه اصلی : ',
                titleHelper:
                    'شما میتوانید با انتخاب هر یک از گزینه های زیر به قابلیت های آن دسترسی پیدا کنید',
                pathString: 'صفحه‌اصلی >',
                isWidget: true,
                widget: DropdownButton<String>(
                  underline: const SizedBox(),
                  items: [
                    DropdownMenuItem(
                      alignment: Alignment.center,
                      value: 'logout',
                      onTap: () async {
                        getIt.get<AppRouter>().pop();
                        getIt.get<AuthBloc>().add(const AuthEvent.logout());
                      },
                      child: Text(
                        'خروج از حساب',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.black,
                            fontFamily: 'Ordibehesht',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  selectedItemBuilder: (context) {
                    return [Container(width: 40.w)];
                  },
                  itemHeight: 50.h,
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
                child: Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 190.h,
                          crossAxisSpacing: 20.w,
                          mainAxisSpacing: 10.h,
                        ),
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 25.h),
                        itemCount: GeneralConstants.userType == UserType.deputy
                            ? 3
                            : 4,
                        itemBuilder: (context, index) {
                          return HomePageItemWidget(index: index);
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffe8ffe8),
                            borderRadius: BorderRadius.circular(11.sp),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromARGB(65, 36, 36, 36),
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
                            'شما میتوانید بعد از انتخاب هر گزینه تغییرات مربوطه را اجرا کنید',
                            textAlign: TextAlign.start,
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 16.sp,
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
          ),
        ),
      ),
    );
  }
}

class HomePageItemWidget extends StatelessWidget {
  final int index;
  const HomePageItemWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: index == 0
          ? () {
              getIt.get<AppRouter>().pushNamed('/classes');
            }
          : index == 1
              ? () {
                  getIt.get<AppRouter>().pushNamed('/course');
                }
              : index == 2
                  ? () {
                      getIt.get<AppRouter>().pushNamed('/teacher');
                    }
                  : () {
                      getIt.get<AppRouter>().pushNamed('/deputy_page');
                    },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(70, 55, 55, 55),
              blurRadius: 4.sp,
              spreadRadius: 0,
              offset: const Offset(1, 2),
            )
          ],
        ),
        width: 165.w,
        height: 203.h,
        child: ImageInsideContainerWidget(
          image: index == 0
              ? PngAssets.classroom
              : index == 1
                  ? SvgAssets.course
                  : index == 2
                      ? PngAssets.teacher
                      : PngAssets.employee,
          offset: index == 0
              ? const Offset(10, 20)
              : index == 1
                  ? const Offset(10, 5)
                  : index == 2
                      ? const Offset(10, 20)
                      : const Offset(10, 20),
          paddingContainer: index == 0
              ? 70.h
              : index == 1
                  ? 45.h
                  : index == 2
                      ? 50.h
                      : 40.h,
          isSvg: index == 0 || index == 2 || index == 3 ? false : true,
          title: index == 0
              ? 'کلاس‌ها'
              : index == 1
                  ? 'مدیریت درس‌ها'
                  : index == 2
                      ? 'مدیریت دبیران'
                      : 'مدیریت معاونت',
        ),
      ),
    );
  }
}
