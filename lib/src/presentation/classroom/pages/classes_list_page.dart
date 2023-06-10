import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_sampad/src/config/constants/general_constants.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/classroom/bloc/classroom_bloc.dart';
import 'package:my_sampad/src/presentation/core/widgets/custom_textfield_widget.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:ndialog/ndialog.dart';

class ClassesListPage extends StatefulWidget {
  const ClassesListPage({super.key});

  @override
  State<ClassesListPage> createState() => _ClassesListPageState();
}

class _ClassesListPageState extends State<ClassesListPage> {
  bool editMode = false;
  bool deleteMode = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => getIt.get<ClassroomBloc>(),
          child: SizedBox(
            width: 1.sw,
            height: 1.sh,
            child: BlocBuilder<ClassroomBloc, ClassroomState>(
              bloc: getIt.get<ClassroomBloc>(),
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppbarSchoolWidget(
                      title: 'کلاس ها : ',
                      titleHelper:
                          'با کلیک بر روی هر کلاس میتوانید گزینه های بیشتری برای کلاس را مشاهده کنید',
                      pathString: 'صفحه‌اصلی > کلاس‌ها',
                      isWidget: true,
                      widget: GeneralConstants.userType != UserType.admin
                          ? null
                          : DropdownButton<String>(
                              items: [
                                DropdownMenuItem(
                                  alignment: Alignment.center,
                                  value: 'add',
                                  onTap: () {
                                    getIt
                                        .get<ClassroomBloc>()
                                        .add(const ClassroomEvent.showDialog());
                                  },
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
                                  value: 'remove',
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
                                              'کلاس مورد نظر را برای حذف انتخاب کنید',
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
                                              'کلاس مورد نظر را برای تغییر انتخاب کنید',
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
                            flex: 4,
                            child: state.isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : ListView.builder(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 12.w, vertical: 20.h),
                                    itemCount: state.classes.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(top: 15.0.h),
                                        child: InkWell(
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
                                                    content:
                                                        ClassroomDialogWidget(
                                                      isEditing: true,
                                                      className: state
                                                          .classes[index]
                                                          .className,
                                                      classroom:
                                                          state.classes[index],
                                                    ),
                                                  ).show(context);
                                                }
                                              : deleteMode
                                                  ? () async {
                                                      setState(() {
                                                        deleteMode = false;
                                                      });
                                                      await NDialog(
                                                        dialogStyle:
                                                            DialogStyle(
                                                          contentPadding:
                                                              EdgeInsets.zero,
                                                        ),
                                                        title: SizedBox(
                                                          height: 50.h,
                                                          child: Text(
                                                            'آیا از حذف ${state.classes[index].className} اطمینان دارید',
                                                            textAlign: TextAlign
                                                                .center,
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
                                                                child:
                                                                    Container(
                                                                  width: 120.w,
                                                                  height: 45.h,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.sp),
                                                                  ),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    'خیر',
                                                                    textDirection:
                                                                        TextDirection
                                                                            .rtl,
                                                                    style: TextStyle(
                                                                        fontSize: 20
                                                                            .sp,
                                                                        color: Colors
                                                                            .black,
                                                                        fontFamily:
                                                                            'Ordibehesht',
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              ),
                                                              InkWell(
                                                                onTap: () {
                                                                  getIt
                                                                      .get<
                                                                          ClassroomBloc>()
                                                                      .add(
                                                                        ClassroomEvent
                                                                            .removeClass(
                                                                          state
                                                                              .classes[index]
                                                                              .classID,
                                                                        ),
                                                                      );
                                                                  getIt
                                                                      .get<
                                                                          AppRouter>()
                                                                      .pop();
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 120.w,
                                                                  height: 45.h,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.sp),
                                                                  ),
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  child: Text(
                                                                    'بله',
                                                                    textDirection:
                                                                        TextDirection
                                                                            .rtl,
                                                                    style: TextStyle(
                                                                        fontSize: 20
                                                                            .sp,
                                                                        color: Colors
                                                                            .black,
                                                                        fontFamily:
                                                                            'Ordibehesht',
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ).show(context);
                                                    }
                                                  : () {
                                                      if (getIt.isRegistered<
                                                          Classroom>()) {
                                                        getIt.unregister<
                                                            Classroom>();
                                                        getIt.registerSingleton<
                                                                Classroom>(
                                                            state.classes[
                                                                index]);
                                                      } else {
                                                        getIt.registerSingleton<
                                                                Classroom>(
                                                            state.classes[
                                                                index]);
                                                      }
                                                      getIt
                                                          .get<AppRouter>()
                                                          .pushNamed(
                                                              '/class_details_page');
                                                    },
                                          child: Container(
                                            width: 339.w,
                                            height: 129.h,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: const Color.fromARGB(
                                                      70, 55, 55, 55),
                                                  offset: const Offset(1, 1),
                                                  blurRadius: 4.sp,
                                                  spreadRadius: 0,
                                                )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12.sp),
                                            ),
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: Container(
                                                    width: 110.w,
                                                    height: 50.h,
                                                    padding: EdgeInsets.only(
                                                        right: 16.w),
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Text(
                                                      state.classes[index]
                                                          .className,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        fontSize: 20.sp,
                                                        color: Colors.black,
                                                        fontFamily:
                                                            'Ordibehesht',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                    flex: 4,
                                                    child: SizedBox(
                                                      height: 96.h,
                                                      child: Image.asset(
                                                          PngAssets.classroom),
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ),
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
                                  'شما میتوانید بعد از انتخاب هر کدام داخل صفحه اصلی با فشردن کلید بازگشت به این صفحه بازگردید',
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
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ClassroomDialogWidget extends StatelessWidget {
  final bool isEditing;
  ClassroomDialogWidget({
    super.key,
    this.className = '',
    this.classroom,
    this.isEditing = false,
  });
  final Classroom? classroom;
  final String className;
  final TextEditingController _classNameController =
      TextEditingController(text: '');

  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    _classNameController.value = TextEditingValue(text: className);
    return SizedBox(
      width: 210.w,
      height: 95.h,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: isEditing ? 8.0.w : 0),
              child: Text(
                isEditing ? 'تغییر اسم' : 'اضافه کردن کلاس',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 22.sp,
                    color: Colors.black,
                    fontFamily: 'Ordibehesht',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 60.h,
            child: Row(
              children: [
                FormBuilder(
                  key: _formKey,
                  child: CustomTextField(
                    islabel: true,
                    width: 130.w,
                    name: 'class',
                    heghit: 40.h,
                    haveIcon: false,
                    labelText: 'اسم‌کلاس',
                    labelStyle: TextStyle(
                        fontSize: 18.sp,
                        color: Colors.black45,
                        fontFamily: 'Ordibehesht',
                        fontWeight: FontWeight.bold),
                    controller: _classNameController,
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(
                          errorText: 'انتخاب اسم اجباری است'),
                      FormBuilderValidators.maxLength(
                        30,
                        errorText: 'کمتر از 30 حرف داشته باشد',
                      ),
                      FormBuilderValidators.minLength(
                        3,
                        errorText: 'بیشتر از 3 حرف داشته باشد',
                      ),
                    ]),
                    onSubmitted: (value) {
                      if (_formKey.currentState?.validate() ?? false) {
                        if (isEditing) {
                          getIt.get<ClassroomBloc>().add(
                                ClassroomEvent.updateClass(
                                  classroom!.copyWith(
                                      className: _classNameController.text),
                                ),
                              );
                        } else {
                          getIt.get<ClassroomBloc>().add(
                                ClassroomEvent.createClasses(
                                  _classNameController.text,
                                ),
                              );
                        }
                        _classNameController.clear();
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
                        getIt.get<ClassroomBloc>().add(
                              ClassroomEvent.updateClass(
                                classroom!.copyWith(
                                    className: _classNameController.text),
                              ),
                            );
                      } else {
                        getIt.get<ClassroomBloc>().add(
                              ClassroomEvent.createClasses(
                                _classNameController.text,
                              ),
                            );
                      }
                      _classNameController.clear();
                      Navigator.pop(
                          getIt.get<AppRouter>().navigatorKey.currentContext!);
                    } else {}
                  },
                  child: Container(
                    width: 70.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffe8ffe8),
                      borderRadius: BorderRadius.circular(10.sp),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'تایید',
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.black,
                          fontFamily: 'Ordibehesht',
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
