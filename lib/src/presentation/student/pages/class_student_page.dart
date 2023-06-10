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
import 'package:my_sampad/src/presentation/student/widgets/add_student_dialog_widget.dart';
import 'package:ndialog/ndialog.dart';

class ClassStudentPage extends StatefulWidget {
  const ClassStudentPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ClassStudentPage> createState() => _ClassStudentPageState();
}

class _ClassStudentPageState extends State<ClassStudentPage> {
  final StudentBloc bloc = getIt.get<StudentBloc>();
  bool editMode = false;
  bool deleteMode = false;
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
              : GeneralConstants.userType == UserType.admin
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: () async {
                          await NDialog(
                            dialogStyle: DialogStyle(
                              // borderRadius: BorderRadius.circular(12.sp),
                              contentPadding: EdgeInsets.zero,
                            ),
                            content: AddStudentDialog(),
                          ).show(context);
                        },
                        child: Container(
                          width: 140.w,
                          height: 60.h,
                          decoration: BoxDecoration(
                              color: const Color(0xffe8ffe8),
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
                            'اضافه کردن دانش‌آموز',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.black,
                                fontFamily: 'Ordibehesht',
                                fontWeight: FontWeight.bold),
                          ),
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
                      pathString: GeneralConstants.userType == UserType.admin ||
                              GeneralConstants.userType == UserType.deputy
                          ? 'صفحه‌اصلی > کلاس‌ها > ${getIt.get<Classroom>().className} > دانش‌آموزان'
                          : GeneralConstants.userType == UserType.parent
                              ? 'دانش‌آموزان'
                              : 'کلاس‌ها > ${getIt.get<Classroom>().className} > دانش‌آموزان',
                      isWidget: true,
                      widget: GeneralConstants.userType != UserType.admin
                          ? null
                          : DropdownButton<String>(
                              items: [
                                DropdownMenuItem(
                                  alignment: Alignment.center,
                                  value: 'حذف',
                                  onTap: () {
                                    getIt.get<AppRouter>().pop();
                                    setState(() {
                                      deleteMode = true;
                                    });

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                const Color(0xffe8ffe8),
                                            content: Text(
                                              'دانش‌آموز مورد نظر را برای حذف انتخاب کنید',
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.black,
                                                  fontFamily: 'Ordibehesht',
                                                  fontWeight: FontWeight.bold),
                                            )));
                                  },
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
                                  onTap: () async {
                                    getIt.get<AppRouter>().pop();
                                    setState(() {
                                      editMode = true;
                                    });

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                const Color(0xffe8ffe8),
                                            content: Text(
                                              'دانش‌آموز مورد نظر را برای تغییر انتخاب کنید',
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.black,
                                                  fontFamily: 'Ordibehesht',
                                                  fontWeight: FontWeight.bold),
                                            )));
                                  },
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
                                if (state.isLoading) {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }
                                return InkWell(
                                  onTap: editMode
                                      ? () async {
                                          setState(() {
                                            editMode = false;
                                          });
                                          await NDialog(
                                            dialogStyle: DialogStyle(
                                              contentPadding: EdgeInsets.zero,
                                            ),
                                            content: AddStudentDialog(
                                              isEditing: true,
                                              student: state.students[index],
                                            ),
                                          ).show(context);
                                        }
                                      : deleteMode
                                          ? () async {
                                              setState(() {
                                                deleteMode = false;
                                              });
                                              await NDialog(
                                                dialogStyle: DialogStyle(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                ),
                                                title: SizedBox(
                                                  height: 50.h,
                                                  child: Text(
                                                    'آیا از حذف ${state.students[index].basicInfo!.name} اطمینان دارید',
                                                    textAlign: TextAlign.center,
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        color: Colors.black,
                                                        fontFamily:
                                                            'Ordibehesht',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                content: SizedBox(
                                                  width: 120.w,
                                                  height: 50.h,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        onTap: () {
                                                          getIt
                                                              .get<AppRouter>()
                                                              .pop();
                                                        },
                                                        child: Container(
                                                          width: 120.w,
                                                          height: 45.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.sp),
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            'خیر',
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            style: TextStyle(
                                                                fontSize: 20.sp,
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    'Ordibehesht',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          getIt
                                                              .get<
                                                                  StudentBloc>()
                                                              .add(
                                                                StudentEvent
                                                                    .removeStudent(
                                                                  state
                                                                      .students[
                                                                          index]
                                                                      .studentId,
                                                                ),
                                                              );
                                                          getIt
                                                              .get<AppRouter>()
                                                              .pop();
                                                        },
                                                        child: Container(
                                                          width: 120.w,
                                                          height: 45.h,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.sp),
                                                          ),
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                            'بله',
                                                            textDirection:
                                                                TextDirection
                                                                    .rtl,
                                                            style: TextStyle(
                                                                fontSize: 20.sp,
                                                                color: Colors
                                                                    .black,
                                                                fontFamily:
                                                                    'Ordibehesht',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ).show(context);
                                            }
                                          : () async {
                                              if (getIt
                                                  .isRegistered<Student>()) {
                                                getIt.unregister<Student>();
                                                getIt
                                                    .registerSingleton<Student>(
                                                        state.students[index]);
                                              } else {
                                                getIt
                                                    .registerSingleton<Student>(
                                                        state.students[index]);
                                              }
                                              getIt.get<AppRouter>().pushNamed(
                                                  '/student_details_page');
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
