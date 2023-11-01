import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/splash/widgets/rule_tile_widget.dart';

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
                  title: 'Your roles:',
                  titleHelper:
                      'By choosing any of the rules below, you will enter the application under that title',
                  pathString: '',
                  isWidget: true,
                  widget: null),
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
                        itemCount: GeneralConstants.roleCount.length,
                        itemBuilder: (context, index) {
                          return SelectRuleTileWidget(
                            rule: GeneralConstants.roleCount[index],
                          );
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
                          width: 270.w,
                          child: Text(
                            'You can enter as a school principal and add other roles to the Application.',
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                                fontSize: 13.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
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
