import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/course/domain/models/course_model/course.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/custom_textfield_widget.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/course/bloc/course/course_bloc.dart';
import 'package:my_sampad/src/presentation/rollcall/pages/class_rollcall_page.dart';
import 'package:ndialog/ndialog.dart';

class CourseListPage extends StatefulWidget {
  const CourseListPage({super.key});

  @override
  State<CourseListPage> createState() => _CourseListPageState();
}

class _CourseListPageState extends State<CourseListPage> {
  bool editMode = false;

  bool deleteMode = false;

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
                content: CourseDialogWidget(),
              ).show(context);
            },
            child: Container(
              width: 130.w,
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
                'Add Course',
                style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: BlocProvider(
            create: (_) => getIt.get<CourseBloc>(),
            child: BlocBuilder<CourseBloc, CourseState>(
              bloc: getIt.get<CourseBloc>(),
              builder: (context, state) {
                return Column(
                  children: [
                    AppbarSchoolWidget(
                      title: 'Course Manage',
                      titleHelper:
                          'On this page, you can delete, add, or edit classes',
                      pathString: 'Main > Course Manage',
                      isWidget: true,
                      widget: DropdownButton<String>(
                        underline: const SizedBox(),
                        selectedItemBuilder: (context) {
                          return [Container(width: 40.w)];
                        },
                        items: [
                          DropdownMenuItem(
                            alignment: Alignment.center,
                            value: 'delete',
                            onTap: () {
                              getIt.get<AppRouter>().pop();
                              setState(() {
                                deleteMode = true;
                              });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: const Color(0xffe8ffe8),
                                      content: Text(
                                        'Select the desired course to delete',
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )));
                            },
                            child: Text(
                              'Delete',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          DropdownMenuItem(
                            alignment: Alignment.center,
                            value: 'change',
                            onTap: () async {
                              getIt.get<AppRouter>().pop();
                              setState(() {
                                editMode = true;
                              });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: const Color(0xffe8ffe8),
                                      content: Text(
                                        'Select the course you wish to modify',
                                        style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      )));
                            },
                            child: Text(
                              'Change',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: Colors.black,
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
                      child: state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : state.courses.isEmpty
                              ? const Center(
                                  child: EmptyWidget(),
                                )
                              : GridView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.courses.length,
                                  padding: EdgeInsets.all(16.r),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisExtent: 260.h,
                                    crossAxisSpacing: 15.w,
                                    mainAxisSpacing: 10.h,
                                  ),
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: editMode
                                          ? () async {
                                              setState(() {
                                                editMode = false;
                                              });
                                              await NDialog(
                                                dialogStyle: DialogStyle(
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                ),
                                                content: CourseDialogWidget(
                                                  isEditing: true,
                                                  courseName: state
                                                      .courses[index]
                                                      .courseName,
                                                  course: state.courses[index],
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
                                                        'Are you sure you want to delete ${state.courses[index].courseName}?',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 13.sp,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                                                                  .get<
                                                                      AppRouter>()
                                                                  .pop();
                                                            },
                                                            child: Container(
                                                              width: 120.w,
                                                              height: 45.h,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.sp),
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                'cancel',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    color: Colors
                                                                        .black,
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
                                                                      CourseBloc>()
                                                                  .add(
                                                                    CourseEvent
                                                                        .removeCourse(
                                                                      state
                                                                          .courses[
                                                                              index]
                                                                          .courseId,
                                                                    ),
                                                                  );
                                                              getIt
                                                                  .get<
                                                                      AppRouter>()
                                                                  .pop();
                                                            },
                                                            child: Container(
                                                              width: 120.w,
                                                              height: 45.h,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.sp),
                                                              ),
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                'accept',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13.sp,
                                                                    color: Colors
                                                                        .black,
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
                                              : () {},
                                      child: Container(
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
                                                  offset: const Offset(1, 1))
                                            ]),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                                width: 150.w,
                                                height: 160.h,
                                                child: Image.asset(
                                                    PngAssets.course)),
                                            SizedBox(height: 20.h),
                                            Text(
                                              '${state.courses[index].courseName} Course',
                                              style: TextStyle(
                                                  fontSize: 18.sp,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
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

class CourseDialogWidget extends StatelessWidget {
  final bool isEditing;
  CourseDialogWidget({
    super.key,
    this.courseName = '',
    this.course,
    this.isEditing = false,
  });
  final Course? course;
  final String courseName;
  final TextEditingController _courseNameController =
      TextEditingController(text: '');

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    _courseNameController.value = TextEditingValue(text: courseName);
    return SizedBox(
      width: 210.w,
      height: 120.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: isEditing ? 8.0.w : 8.w, top: 5),
              child: Text(
                isEditing ? 'Change Name' : 'Add Course',
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 80.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FormBuilder(
                  key: _formKey,
                  child: CustomTextField(
                    islabel: true,
                    width: 130.w,
                    name: 'course',
                    heghit: 55.h,
                    haveIcon: false,
                    labelText: 'Course Name',
                    labelStyle: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                    controller: _courseNameController,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'Name selection is mandatory'),
                      FormBuilderValidators.maxLength(
                        30,
                        errorText: 'Should be less than 30 characters',
                      ),
                      FormBuilderValidators.minLength(
                        3,
                        errorText: 'Should be more than 3 characters',
                      ),
                    ]),
                    onSubmitted: (value) {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (isEditing) {
                          getIt.get<CourseBloc>().add(
                                CourseEvent.updateCourse(
                                  course!.copyWith(
                                      courseName: _courseNameController.text),
                                ),
                              );
                        } else {
                          getIt.get<CourseBloc>().add(
                                CourseEvent.addCourse(
                                  _courseNameController.text,
                                ),
                              );
                        }
                        _courseNameController.clear();
                        Navigator.pop(getIt
                            .get<AppRouter>()
                            .navigatorKey
                            .currentContext!);
                      } else {}
                    },
                    keyboardType: TextInputType.name,
                  ),
                ),
                SizedBox(width: 15.w),
                InkWell(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (isEditing) {
                        getIt.get<CourseBloc>().add(
                              CourseEvent.updateCourse(
                                course!.copyWith(
                                    courseName: _courseNameController.text),
                              ),
                            );
                      } else {
                        getIt.get<CourseBloc>().add(
                              CourseEvent.addCourse(
                                _courseNameController.text,
                              ),
                            );
                      }
                      _courseNameController.clear();
                      Navigator.pop(
                          getIt.get<AppRouter>().navigatorKey.currentContext!);
                    } else {}
                  },
                  child: Container(
                    width: 70.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffe8ffe8),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Accept',
                      style: TextStyle(
                          fontSize: 13.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
