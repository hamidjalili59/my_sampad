import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/injectable/injectable.dart';

class SelectRuleTileWidget extends StatelessWidget {
  final String rule;
  const SelectRuleTileWidget({
    super.key,
    required this.rule,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        getIt.get<AppRouter>().pushNamed(rule == 'principal'
            ? 'home_page'
            : rule == 'teacher'
                ? '/school_select_page'
                : '/student');
      },
      child: Container(
        width: 165.w,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(76, 55, 55, 55),
              blurRadius: 4.sp,
              offset: const Offset(1, 2),
              spreadRadius: 0,
            ),
          ],
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: ImageInsideContainerWidget(
          image: rule == 'principal'
              ? PngAssets.modir
              : rule == 'teacher'
                  ? PngAssets.teacher
                  : PngAssets.parent,
          offset: Offset(10.w, 10.h),
          paddingContainer: 80.h,
          title:
              'ورود به عنوان ${rule == 'principal' ? 'مدیر' : rule == 'teacher' ? 'دبیر' : 'والد'}',
        ),
      ),
    );
  }
}

class ImageInsideContainerWidget extends StatelessWidget {
  final String image;
  final Offset offset;
  final double paddingContainer;
  final String title;
  const ImageInsideContainerWidget({
    super.key,
    required this.image,
    required this.offset,
    required this.paddingContainer,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Stack(
        children: [
          Positioned(
              bottom: 15.h,
              left: 0,
              right: 0,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Ordibehesht',
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              )),
          Positioned(
            bottom: paddingContainer,
            left: 10.w,
            child: Container(
              width: 118.w,
              height: 73.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: const Color(
                  0xffD1EDFC,
                ),
              ),
            ),
          ),
          Positioned(
            child: Transform.translate(
                offset: offset,
                child: SizedBox(
                    width: 123.w, height: 123.h, child: Image.asset(image))),
          )
        ],
      ),
    );
  }
}
