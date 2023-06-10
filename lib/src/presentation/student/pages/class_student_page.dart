import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/features/student/domain/models/student_model/student.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/splash/widgets/rule_tile_widget.dart';
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
          floatingActionButton: GeneralConstants.userType == UserType.teacher
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: 300.w,
                    height: 55.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.sp),
                        color: const Color(0xffe8ffe8),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xff6a6a6a).withAlpha(70),
                            offset: const Offset(1, 2),
                            spreadRadius: 0,
                            blurRadius: 5.sp,
                          )
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                getIt
                                    .get<AppRouter>()
                                    .pushNamed('/add_score_for_class_page');
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'ثبت‌‍‌‌نمره',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'Ordibehesht',
                                      fontSize: 16.sp,
                                    ),
                                  )),
                            )),
                        const VerticalDivider(),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                getIt
                                    .get<AppRouter>()
                                    .pushNamed('/class_rollcalls_page');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  'حضورغیاب',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Ordibehesht',
                                    fontSize: 16.sp,
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                )
              : null,
          body: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: BlocBuilder<StudentBloc, StudentState>(
              bloc: bloc,
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppbarSchoolWidget(
                      title: 'دانش‌آموزان : ',
                      titleHelper:
                          'با کلیک بر روی هر دانش‌آموز میتوانید سابقه غیبت ها و نمرات وی را مشاهده کنید',
                      pathString: 'شهید بهشتی  --  کلاس‌ها -- ریاضی 2',
                      isWidget: true,
                      widget: GeneralConstants.userType != UserType.admin
                          ? null
                          : DropdownButton<String>(
                              items: [
                                DropdownMenuItem(
                                  alignment: Alignment.center,
                                  value: 'افزودن',
                                  onTap: () {},
                                  child: Text(
                                    'افزودن',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.black,
                                        fontFamily: 'Ordibehesht',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DropdownMenuItem(
                                  alignment: Alignment.center,
                                  value: 'حذف',
                                  onTap: () {},
                                  child: Text(
                                    'حذف',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.black,
                                        fontFamily: 'Ordibehesht',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DropdownMenuItem(
                                  alignment: Alignment.center,
                                  value: 'تغییر',
                                  onTap: () {},
                                  child: Text(
                                    'تغییر',
                                    style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.black,
                                        fontFamily: 'Ordibehesht',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
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
                            child: GridView.builder(
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 200.h,
                                crossAxisSpacing: 20.w,
                                mainAxisSpacing: 10.h,
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 25.h),
                              itemCount: state.students.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {
                                    if (getIt.isRegistered<Student>()) {
                                      getIt.unregister<Student>();
                                      getIt.registerSingleton<Student>(
                                          state.students[index]);
                                    } else {
                                      getIt.registerSingleton<Student>(
                                          state.students[index]);
                                    }
                                    getIt
                                        .get<AppRouter>()
                                        .pushNamed('/student_details_page');
                                  },
                                  child: Container(
                                    width: 143.w,
                                    height: 160.h,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(12.sp),
                                        boxShadow: [
                                          BoxShadow(
                                            color: const Color.fromARGB(
                                                70, 55, 55, 55),
                                            spreadRadius: 0,
                                            blurRadius: 4.sp,
                                          )
                                        ]),
                                    child: ImageInsideContainerWidget(
                                      image: PngAssets.student,
                                      offset: Offset(10.w, 10.h),
                                      paddingContainer: 80.h,
                                      title:
                                          state.students[index].basicInfo!.name,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
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
