import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_sampad/src/config/constants/svg_assets.dart';
import 'package:my_sampad/src/features/student/domain/models/student_model/student.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/score/bloc/score/score_bloc.dart';
import 'package:persian_datetimepickers/persian_datetimepickers.dart';

class SingleScoreViewPage extends StatefulWidget {
  const SingleScoreViewPage({super.key});

  @override
  State<SingleScoreViewPage> createState() => _SingleScoreViewPageState();
}

class _SingleScoreViewPageState extends State<SingleScoreViewPage> {
  final ScoreBloc bloc = getIt.get<ScoreBloc>();
  ScrollController? _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    bloc.add(ScoreEvent.getScores(getIt.get<Student>().studentId));
    super.initState();
  }

  @override
  void dispose() {
    _scrollController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<ScoreBloc, ScoreState>(
          bloc: bloc,
          builder: (context, scoreState) {
            if (scoreState.isLoading) {
              return Center(
                child: SizedBox(
                    width: 55.w,
                    height: 55.w,
                    child: const CircularProgressIndicator()),
              );
            } else {
              return SizedBox(
                width: 1.sw,
                height: 1.sh,
                child: Column(
                  children: [
                    const AppbarSchoolWidget(
                        title: 'نمرات دانش آموز : ',
                        titleHelper:
                            'هر یک از کاشی های زیر حاوی اطلاعات روز و ساعت کلاس هر نمره ثبت شده این دانش‌آموز است',
                        pathString:
                            'شهید بهشتی  --  کلاس‌ها -- ریاضی 2 -- نمرات',
                        isWidget: true,
                        widget: null),
                    SizedBox(
                      height: 0.69.sh,
                      child: scoreState.scores.isEmpty
                          ? SizedBox(
                              width: 1.sw,
                              height: 0.65.sh,
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
                                      'اطلاعاتی وجود ندارد',
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 18.r),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              padding: EdgeInsets.only(top: 10.h),
                              itemCount: scoreState.scores.length,
                              itemBuilder: (context, index) {
                                //date mored nazar
                                String tarikh = scoreState
                                    .scores[index].createdDate!
                                    .toFancyString();
                                // darse morde nazars

                                String dars = scoreState.scores
                                    .map((e) => e.courseName)
                                    .toList()[index];

                                // nomre mored nazar
                                String grade = scoreState.scores
                                    .where((element) =>
                                        element.courseName ==
                                        (scoreState.scores
                                            .map((e) => e.courseName)
                                            .toList()[(index) ~/ 2]))
                                    .toList()[index]
                                    .grade
                                    .toStringAsFixed(1);
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
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
                                    width: 341.w,
                                    height: 100.h,
                                    child: Stack(
                                      children: [
                                        Positioned(
                                            right: 0,
                                            child: Container(
                                              width: 200.w,
                                              height: 35.h,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffe8ffe8),
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topRight:
                                                              Radius.circular(
                                                                  12.sp))),
                                              alignment: Alignment.center,
                                              child: Text(
                                                'درس $dars',
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    color: Colors.black,
                                                    fontFamily: 'Ordibehesht',
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            )),
                                        Positioned(
                                            bottom: 10.h,
                                            left: 20.w,
                                            right: 20.w,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 5,
                                                  child: Text(
                                                    tarikh,
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: 20.sp,
                                                        color: Colors.black,
                                                        fontFamily:
                                                            'Ordibehesht',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Text(
                                                    'نمره : $grade',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                        fontSize: 22.sp,
                                                        color: Colors.black,
                                                        fontFamily:
                                                            'Ordibehesht',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: SizedBox(
                                                      width: 60.w,
                                                      height: 60.w,
                                                      child: SvgPicture.asset(
                                                          SvgAssets.nomre)),
                                                ),
                                              ],
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
