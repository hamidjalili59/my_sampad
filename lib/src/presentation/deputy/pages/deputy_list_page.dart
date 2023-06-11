import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/routes/router.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/deputy/bloc/deputy/deputy_bloc.dart';
import 'package:my_sampad/src/presentation/deputy/widgets/deputy_dialog_widget.dart';
import 'package:ndialog/ndialog.dart';

class DeputyListPage extends StatefulWidget {
  const DeputyListPage({super.key});

  @override
  State<DeputyListPage> createState() => _DeputyListPageState();
}

class _DeputyListPageState extends State<DeputyListPage> {
  bool deleteMode = false;
  bool editMode = false;
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
                content: const DeputyDialogWidget(),
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
                'اضافه کردن دبیر',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.black,
                    fontFamily: 'Ordibehesht',
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        body: SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: BlocProvider(
            create: (_) => getIt.get<DeputyBloc>(),
            child: BlocBuilder<DeputyBloc, DeputyState>(
              bloc: getIt.get<DeputyBloc>(),
              builder: (context, state) {
                return Column(
                  children: [
                    AppbarSchoolWidget(
                      title: 'مدیریت دبیران',
                      titleHelper:
                          'در این صفحه می‌توانید دبیران را حذف یا اضافه یا پاک کنید',
                      pathString: 'صفحه‌اصلی > مدیریت دبیران',
                      isWidget: true,
                      widget: DropdownButton<String>(
                        underline: const SizedBox(),
                        selectedItemBuilder: (context) {
                          return [Container(width: 40.w)];
                        },
                        items: [
                          DropdownMenuItem(
                            alignment: Alignment.center,
                            value: 'حذف',
                            onTap: () {
                              getIt.get<AppRouter>().pop();
                              setState(() {
                                deleteMode = true;
                              });

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: const Color(0xffe8ffe8),
                                      content: Text(
                                        'دبیر مورد نظر را برای حذف انتخاب کنید',
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

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      backgroundColor: const Color(0xffe8ffe8),
                                      content: Text(
                                        'دبیر مورد نظر را برای تغییر انتخاب کنید',
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
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: state.deputys.length,
                        padding: EdgeInsets.all(16.r),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 260.h,
                          crossAxisSpacing: 15.w,
                          mainAxisSpacing: 10.h,
                        ),
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
                                      content: DeputyDialogWidget(
                                        isEditing: true,
                                        deputy: state.deputys[index],
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
                                            contentPadding: EdgeInsets.zero,
                                          ),
                                          title: SizedBox(
                                            height: 50.h,
                                            child: Text(
                                              'آیا از حذف ${state.deputys[index].basicInfo!.name} اطمینان دارید',
                                              textAlign: TextAlign.center,
                                              textDirection: TextDirection.rtl,
                                              style: TextStyle(
                                                  fontSize: 20.sp,
                                                  color: Colors.black,
                                                  fontFamily: 'Ordibehesht',
                                                  fontWeight: FontWeight.bold),
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
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.sp),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'خیر',
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
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    getIt.get<DeputyBloc>().add(
                                                          DeputyEvent
                                                              .removeDeputy(
                                                            state.deputys[index]
                                                                .deputyId,
                                                          ),
                                                        );
                                                    getIt
                                                        .get<AppRouter>()
                                                        .pop();
                                                  },
                                                  child: Container(
                                                    width: 120.w,
                                                    height: 45.h,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.sp),
                                                    ),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      'بله',
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
                                  borderRadius: BorderRadius.circular(12.sp),
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
                                      child: Image.asset(PngAssets.employee)),
                                  SizedBox(height: 20.h),
                                  Text(
                                    'استاد ${state.deputys[index].basicInfo!.name}',
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22.sp,
                                        color: Colors.black,
                                        fontFamily: 'Ordibehesht',
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
