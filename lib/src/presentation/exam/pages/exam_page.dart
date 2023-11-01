import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/auth/domain/models/otp_handshake_response.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/features/exam/domain/models/exam_model.dart';
import 'package:my_sampad/src/features/student/domain/models/student_model/student.dart';
import 'package:my_sampad/src/features/teacher/domain/models/teacher_get_schools.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/custom_textfield_widget.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/exam/bloc/exam/exam_bloc.dart';
import 'package:my_sampad/src/presentation/exam/widget/custom_card_exam_widget.dart';
import 'package:my_sampad/src/presentation/teacher/bloc/teacher/teacher_bloc.dart';
import 'package:ndialog/ndialog.dart';

class ExamPage extends StatefulWidget {
  const ExamPage({super.key});

  @override
  State<ExamPage> createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  final TextEditingController _controllerExamDescription =
      TextEditingController(text: '');

  @override
  void initState() {
    super.initState();
    getIt.get<ExamBloc>().add(const ExamEvent.getExams());
  }

  @override
  void dispose() {
    _controllerExamDescription.dispose();
    super.dispose();
  }

  bool editMode = false;
  bool deleteMode = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: Colors.white,
        floatingActionButton: GeneralConstants.userType == UserType.teacher
            ? Padding(
                padding: EdgeInsets.only(bottom: 16.h),
                child: Material(
                  elevation: 5,
                  color: const Color.fromARGB(255, 243, 243, 234),
                  borderRadius: BorderRadius.circular(12.r),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    splashColor: GeneralConstants.backgroundColor,
                    onTap: _addExamDialogMethod,
                    child: Container(
                      alignment: Alignment.center,
                      width: 120.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(16.r),
                      ),
                      child: Text(
                        'Exam Registration',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            : null,
        body: BlocBuilder<ExamBloc, ExamState>(
          bloc: getIt.get<ExamBloc>(),
          builder: (context, examState) {
            return SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: Column(
                  children: [
                    AppbarSchoolWidget(
                      title: 'Class Exams',
                      titleHelper:
                          'You can view a list of exams with their descriptions below',
                      pathString: GeneralConstants.userType == UserType.admin ||
                              GeneralConstants.userType == UserType.deputy
                          ? 'Main > Classes > ${getIt.get<Classroom>().className} > Exams'
                          : GeneralConstants.userType == UserType.teacher
                              ? 'Classes > ${getIt.get<Classroom>().className} > Exams'
                              : '${getIt.get<Student>().basicInfo!.name} > Exams',
                      isWidget: true,
                      widget: GeneralConstants.userType != UserType.teacher
                          ? null
                          : DropdownButton<String>(
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

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                const Color(0xffe8ffe8),
                                            content: Text(
                                              'Select the exam you want to delete',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
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

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            backgroundColor:
                                                const Color(0xffe8ffe8),
                                            content: Text(
                                              'Select the exam you want to modify',
                                              style: TextStyle(
                                                  fontSize: 12.sp,
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
                      height: 0.69.sh,
                      child: examState.isLoading
                          ? Center(
                              child: SizedBox(
                                  width: 55.w,
                                  height: 55.w,
                                  child: const CircularProgressIndicator()),
                            )
                          : examState.exams.isEmpty
                              ? SizedBox(
                                  width: 1.sw,
                                  height: 0.8.sh,
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          width: 0.95.sw,
                                          height: 0.5.sh,
                                          child: Padding(
                                            padding: EdgeInsets.all(54.0.r),
                                            child: SvgPicture.asset(
                                              SvgAssets.empty,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'There is no exam available',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w800,
                                              fontSize: 16.r),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: examState.exams.length,
                                  padding: EdgeInsets.only(bottom: 64.h),
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
                                                content: ExamDialogWidget(
                                                  isEditing: true,
                                                  exam: examState.exams[index],
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
                                                        'Are you sure you want to delete this exam?',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
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
                                                                        16.sp,
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
                                                                      ExamBloc>()
                                                                  .add(
                                                                    ExamEvent
                                                                        .removeExam(
                                                                      examState
                                                                          .exams[
                                                                              index]
                                                                          .examId,
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
                                                                'Accept',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        16.sp,
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
                                      child: CustomCardExamWidget(
                                        exam: examState.exams[index],
                                      ),
                                    );
                                  },
                                ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }

  _addExamDialogMethod({bool isEditing = false}) {
    var appRputer = getIt.get<AppRouter>();
    NDialog(
      dialogStyle: DialogStyle(
          titlePadding: EdgeInsets.symmetric(horizontal: 0.r, vertical: 0.r),
          backgroundColor: Colors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.r, vertical: 3.r)),
      content: ExamDialogWidget(isEditing: isEditing),
    ).show(appRputer.navigatorKey.currentContext!);
  }
}

class ExamDialogWidget extends StatelessWidget {
  final bool isEditing;
  final Exam? exam;
  ExamDialogWidget({
    super.key,
    required this.isEditing,
    this.exam,
  });

  final TextEditingController _controller = TextEditingController(text: '');
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    if (exam != null) {
      _controller.value = TextEditingValue(text: exam!.examDescription);
    }
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 210.w,
        minHeight: 150.h,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: FormBuilder(
              key: _formKey,
              child: CustomTextField(
                islabel: true,
                onSubmitted: (text) {
                  if (getIt.get<ExamBloc>().state.isLoading) {
                    return;
                  }
                  Exam tempExam = Exam(
                    classId: GeneralConstants.userType == UserType.parent
                        ? getIt.get<Student>().classId
                        : getIt.get<Classroom>().classID,
                    examDescription: _controller.text,
                    teacherId:
                        getIt.get<OtpHandshakeResponse>().teacher!.teacherId,
                    teacherName: getIt
                        .get<TeacherBloc>()
                        .state
                        .teachers
                        .firstWhere(
                          (element) =>
                              element.teacherId ==
                              getIt.get<TeacherGetSchools>().teacherId,
                        )
                        .basicInfo!
                        .name,
                    examId: exam != null ? exam!.examId : 0,
                    isDone: exam != null ? exam!.isDone : false,
                  );
                  if (isEditing) {
                    getIt.get<ExamBloc>().add(ExamEvent.updateExam(tempExam));
                  } else {
                    getIt.get<ExamBloc>().add(ExamEvent.acceptExam(tempExam));
                  }
                  getIt.get<AppRouter>().pop();
                },
                validator: FormBuilderValidators.compose([
                  FormBuilderValidators.required(
                      errorText: 'Description is mandatory'),
                  FormBuilderValidators.maxLength(
                    200,
                    errorText: 'Should be less than 200 characters',
                  ),
                  FormBuilderValidators.minLength(
                    5,
                    errorText: 'Should be more than 5 characters',
                  ),
                ]),
                width: 180.w,
                name: 'exam',
                isdynamicSize: true,
                heghit: 50.h,
                controller: _controller,
                keyboardType: TextInputType.text,
                labelText: 'Exam Description',
              ),
            ),
          ),
          SizedBox(
            height: 85.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 70.w,
                  height: 40.h,
                ),
                InkWell(
                  onTap: () {
                    if (getIt.get<ExamBloc>().state.isLoading) {
                      return;
                    }
                    Exam tempExam = Exam(
                      classId: GeneralConstants.userType == UserType.parent
                          ? getIt.get<Student>().classId
                          : getIt.get<Classroom>().classID,
                      examDescription: _controller.text,
                      teacherId:
                          getIt.get<OtpHandshakeResponse>().teacher!.teacherId,
                      teacherName: getIt
                          .get<TeacherBloc>()
                          .state
                          .teachers
                          .firstWhere(
                            (element) =>
                                element.teacherId ==
                                getIt.get<TeacherGetSchools>().teacherId,
                          )
                          .basicInfo!
                          .name,
                      examId: exam != null ? exam!.examId : 0,
                      isDone: exam != null ? exam!.isDone : false,
                    );
                    if (isEditing) {
                      getIt.get<ExamBloc>().add(ExamEvent.updateExam(tempExam));
                    } else {
                      getIt.get<ExamBloc>().add(ExamEvent.acceptExam(tempExam));
                    }
                    getIt.get<AppRouter>().pop();
                  },
                  child: Container(
                    width: 130.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.sp),
                        color: const Color(0xffE8FFE8)),
                    alignment: Alignment.center,
                    child: Text(
                      isEditing ? 'Change Exam' : 'Add Exam',
                      textAlign: TextAlign.center,
                      maxLines: null,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
