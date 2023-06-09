import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/student/bloc/student/student_bloc.dart';

class ClassStudentPage extends StatefulWidget {
  const ClassStudentPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ClassStudentPage> createState() => _ClassStudentPageState();
}

class _ClassStudentPageState extends State<ClassStudentPage> {
  final StudentBloc bloc = getIt.get<StudentBloc>();
  // final TextEditingController _controllerExamDescription =
  //     TextEditingController(text: '');
  // final TextEditingController _studentNameController =
  //     TextEditingController(text: '');
  // final TextEditingController _studentParentController =
  //     TextEditingController(text: '');
  // final TextEditingController _phonenumberController =
  //     TextEditingController(text: '');
  @override
  void initState() {
    super.initState();
    if (GeneralConstants.userType == UserType.parent) {
      bloc.add(StudentEvent.getStudentsParent(
          getIt.get<OtpHandshakeResponse>().phoneNumber!));
    } else {
      bloc.add(
        StudentEvent.getStudents(
          getIt.get<Classroom>().classID,
        ),
      );
    }
  }

  @override
  void dispose() {
    // _controllerExamDescription.dispose();
    // _studentNameController.dispose();
    // _studentParentController.dispose();
    // _phonenumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => bloc,
      child: SafeArea(
        child: Scaffold(
          body: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: BlocBuilder<StudentBloc, StudentState>(
              bloc: bloc,
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const AppbarSchoolWidget(
                      title: 'دانش‌آموزان : ',
                      titleHelper:
                          'با کلیک بر روی هر دانش‌آموز میتوانید سابقه غیبت ها و نمرات وی را مشاهده کنید',
                      pathString: 'شهید بهشتی  --  کلاس‌ها -- ریاضی 2',
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
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 190.h,
                                crossAxisSpacing: 20.w,
                                mainAxisSpacing: 10.h,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 25.h),
                              itemCount: GeneralConstants.roleCount.length,
                              itemBuilder: (context, index) {
                                return Container();
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
                                      color:
                                          const Color.fromARGB(65, 36, 36, 36),
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
                                  'شما میتوانید بعد از انتخاب هر کدام داخل صفحه اصلی اپلیکیشن با کلیک بر روی گزینه اکانت و انتخاب گزینه دیگر وظایف به این صفحه بازگردید',
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

class TeacherStudentPageFloatingWidget extends StatelessWidget {
  const TeacherStudentPageFloatingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 1, spreadRadius: 1),
        ],
      ),
      width: 180.w,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                getIt.get<AppRouter>().pushNamed('/class_rollcalls_page');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: GeneralConstants.mainColor,
                    borderRadius: BorderRadius.circular(16.r)),
                alignment: Alignment.center,
                child: Text(
                  'حضورغیاب',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: () {
                getIt.get<AppRouter>().pushNamed('/add_score_for_class_page');
              },
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.r)),
                alignment: Alignment.center,
                child: Text(
                  'ثبت نمرات',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
