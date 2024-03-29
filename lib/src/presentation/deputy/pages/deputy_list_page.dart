import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sampad/src/config/constants/png_assets.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
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
                content: DeputyDialogWidget(),
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
                'Add Deputy',
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
            create: (_) => getIt.get<DeputyBloc>(),
            child: BlocBuilder<DeputyBloc, DeputyState>(
              bloc: getIt.get<DeputyBloc>(),
              builder: (context, state) {
                return Column(
                  children: [
                    AppbarSchoolWidget(
                      title: 'Deputy Manage',
                      titleHelper:
                          'On this page, you can delete, add, or edit vice-principals',
                      pathString: 'Main > Deputy Manage',
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
                                        'Select the desired vice-principal to delete',
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
                                        'Choose the vice-principal you want to make changes to',
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
                          : GridView.builder(
                              shrinkWrap: true,
                              itemCount: state.deputys.length,
                              padding: EdgeInsets.all(16.r),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 260.h,
                                crossAxisSpacing: 15.w,
                                mainAxisSpacing: 10.h,
                              ),
                              itemBuilder: (context, index) {
                                if (state.deputys.isEmpty) {
                                  return SizedBox(
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
                                            'There is no teacher for this class',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w800,
                                                fontSize: 16.r),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
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
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                ),
                                                title: SizedBox(
                                                  height: 50.h,
                                                  child: Text(
                                                    'Are you sure you want to delete ${state.deputys[index].basicInfo!.name}?',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: Colors.black,
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
                                                            'cancel',
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
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
                                                              .get<DeputyBloc>()
                                                              .add(
                                                                DeputyEvent
                                                                    .removeDeputy(
                                                                  state
                                                                      .deputys[
                                                                          index]
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
                                                            'accept',
                                                            style: TextStyle(
                                                                fontSize: 14.sp,
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
                                                PngAssets.employee)),
                                        SizedBox(height: 20.h),
                                        Text(
                                          'Master ${state.deputys[index].basicInfo!.name}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 16.sp,
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
