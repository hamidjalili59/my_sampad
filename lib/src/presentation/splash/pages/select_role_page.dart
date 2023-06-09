import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';

class SelectRulePage extends StatelessWidget {
  const SelectRulePage({
    super.key,
  });

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
              const AppbarSchoolWidget(
                title: 'وظایف شما :',
                titleHelper:
                    'با انتخاب هر یک از وظایف زیر شما به آن عنوان وارد اپلیکیشن میشوید',
              ),
              SizedBox(
                width: 1.sw,
                height: 0.67.sh,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 215.h,
                    crossAxisSpacing: 20.w,
                    mainAxisSpacing: 10.h,
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
                  itemCount: GeneralConstants.roleCount,
                  itemBuilder: (context, index) {
                    return Container(
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
                      child: const ImageInsideContainerWidget(),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageInsideContainerWidget extends StatelessWidget {
  const ImageInsideContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(PngAssets.modir),
          )
        ],
      ),
    );
  }
}

class AppbarSchoolWidget extends StatelessWidget {
  const AppbarSchoolWidget({
    super.key,
    required this.title,
    required this.titleHelper,
  });

  final String title;
  final String titleHelper;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 220.h,
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
            height: 90.h,
            width: 1.sw,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 80.w,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                    size: 30.sp,
                  ),
                ),
                SizedBox(
                    child: Text(
                  'مدرسه من',
                  style: TextStyle(
                    fontFamily: 'Ordibehesht',
                    fontSize: 26.sp,
                    color: Colors.black,
                  ),
                )),
                SizedBox(
                  width: 80.sp,
                ),
              ],
            ),
          ),
          SizedBox(height: 50.h),
          SizedBox(
              width: 0.72.sw,
              child: Text(
                title,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: const Color(0xff868686),
                  fontSize: 14.sp,
                ),
              )),
          SizedBox(height: 5.h),
          SizedBox(
              width: 0.72.sw,
              child: Text(
                titleHelper,
                textAlign: TextAlign.start,
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  color: const Color(0xff868686),
                  fontFamily: 'Ordibehesht',
                  fontSize: 14.sp,
                ),
              )),
        ],
      ),
    );
  }
}
