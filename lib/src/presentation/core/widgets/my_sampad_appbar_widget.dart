import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/injectable/injectable.dart';

class AppbarSchoolWidget extends StatelessWidget {
  const AppbarSchoolWidget({
    super.key,
    this.isWidget = false,
    this.widget,
    required this.title,
    required this.titleHelper,
    required this.pathString,
    this.icon = Icons.more_vert_rounded,
    this.onPressed,
  });
  final void Function()? onPressed;
  final bool isWidget;
  final Widget? widget;
  final IconData icon;
  final String title;
  final String titleHelper;
  final String pathString;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 200.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(26.sp),
            bottomRight: Radius.circular(26.sp),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xff454545).withOpacity(0.2),
              offset: const Offset(1, 1),
              spreadRadius: 0.5.sp,
              blurRadius: 8.sp,
            ),
          ]),
      child: Column(
        children: [
          SizedBox(
            height: 80.h,
            width: 1.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    getIt.get<AppRouter>().pop();
                  },
                  child: SizedBox(
                    width: 100.w,
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.black,
                      size: 30.sp,
                    ),
                  ),
                ),
                const Spacer(),
                SizedBox(
                    child: Text(
                  'مدرسه من',
                  style: TextStyle(
                    fontFamily: 'Ordibehesht',
                    fontSize: 28.sp,
                    color: Colors.black,
                  ),
                )),
                const Spacer(),
                SizedBox(
                  width: 120.w,
                  child: isWidget
                      ? widget
                      : IconButton(
                          onPressed: onPressed ?? () {},
                          icon: Icon(
                            icon,
                            size: 36.sp,
                            color: Colors.black,
                          )),
                ),
              ],
            ),
          ),
          SizedBox(height: 5.h),
          SizedBox(
              width: 0.72.sw,
              child: Text(
                title,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: const Color(0xff868686),
                  fontFamily: 'Ordibehesht',
                  fontSize: 18.sp,
                ),
              )),
          SizedBox(height: 3.h),
          SizedBox(
              width: 0.75.sw,
              child: Text(
                titleHelper,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: const Color(0xff868686),
                  fontFamily: 'Ordibehesht',
                  fontSize: 16.sp,
                ),
              )),
          SizedBox(height: 3.h),
          SizedBox(
              width: 0.72.sw,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    pathString,
                    maxLines: 1,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Ordibehesht',
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
