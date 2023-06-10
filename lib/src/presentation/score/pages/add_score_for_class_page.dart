import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:my_sampad/src/features/classroom/domain/models/classroom_model.dart';
import 'package:my_sampad/src/injectable/injectable.dart';
import 'package:my_sampad/src/presentation/core/widgets/my_sampad_appbar_widget.dart';
import 'package:my_sampad/src/presentation/rollcall/pages/class_rollcall_page.dart';
import 'package:my_sampad/src/presentation/score/bloc/score_board/score_board_bloc.dart';

class AddScoreForClassPage extends StatefulWidget {
  const AddScoreForClassPage({super.key});

  @override
  State<AddScoreForClassPage> createState() => _AddScoreForClassPageState();
}

class _AddScoreForClassPageState extends State<AddScoreForClassPage> {
  final ScoreBoardBloc bloc = getIt.get<ScoreBoardBloc>();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: InkWell(
        onTap: () {
          if (bloc.state.isLoading) {
            return;
          }
          if (_formKey.currentState?.validate() ?? false) {
            bloc.add(const ScoreBoardEvent.acceptScores());
          }
        },
        child: Container(
          width: 120.w,
          height: 50.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            color: const Color(0xffe8ffe8),
            boxShadow: [
              BoxShadow(
                color: const Color(0xff6A6A6A).withAlpha(70),
                blurRadius: 3.sp,
                spreadRadius: 0,
                offset: const Offset(1, 2),
              )
            ],
          ),
          child: Center(
            child: Text(
              'ثبت نمره',
              textAlign: TextAlign.center,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
                fontFamily: 'Ordibehesht',
              ),
            ),
          ),
        ),
      ),
      body: SizedBox(
        width: 1.sw,
        height: 1.sh,
        child: BlocProvider(
          create: (_) => bloc,
          child: BlocBuilder<ScoreBoardBloc, ScoreBoardState>(
            bloc: bloc,
            builder: (context, scoreBoardState) {
              return FormBuilder(
                key: _formKey,
                child: Column(
                  children: [
                    AppbarSchoolWidget(
                      title: 'ثبت نمرات : ',
                      titleHelper:
                          'شما میتوانید روبه‌روی هر دانش آموز نمره مربوط به آنرا وارد کنید و دکمه ثبت نمره را بفشارید',
                      pathString:
                          'کلاس‌ها > ${getIt.get<Classroom>().className} > دانش‌آموزان > ثبت نمره',
                      isWidget: true,
                      widget: null,
                    ),
                    scoreBoardState.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : scoreBoardState.students.isEmpty
                            ? const Center(
                                child: EmptyWidget(),
                              )
                            : Directionality(
                                textDirection: TextDirection.rtl,
                                child: SingleChildScrollView(
                                  child: DataTable(
                                    headingRowHeight: 70.h,
                                    headingTextStyle: TextStyle(
                                        fontSize: 10.r, color: Colors.black),
                                    border: TableBorder.all(
                                        color: Colors.black54,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        width: 1.w),
                                    horizontalMargin: 0,
                                    checkboxHorizontalMargin: 0,
                                    columns: <DataColumn>[
                                      DataColumn(
                                        onSort: (index, isfelan) {},
                                        label: Flexible(
                                          flex: 4,
                                          child: Center(
                                            child: Text(
                                              'نام و نام‌خانوادگی',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w900,
                                                fontSize: 16.r,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        onSort: (index, isfelan) {},
                                        label: Flexible(
                                          flex: 1,
                                          child: Center(
                                            child: Text('نمره',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w900,
                                                    fontSize: 16.r)),
                                          ),
                                        ),
                                      ),
                                    ],
                                    rows: List.generate(
                                      scoreBoardState.students.length,
                                      (index) => DataRow(cells: [
                                        DataCell(
                                          SizedBox(
                                            width: 0.64.sw,
                                            child: Center(
                                              child: Text(
                                                  scoreBoardState
                                                      .students[index]
                                                      .basicInfo!
                                                      .name,
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 16.r)),
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          SizedBox(
                                            width: 0.35.sw,
                                            child: TextFormField(
                                              validator: FormBuilderValidators
                                                  .compose([
                                                FormBuilderValidators.required(
                                                    errorText:
                                                        'نمره اجباری است'),
                                                FormBuilderValidators.numeric(
                                                    errorText:
                                                        'اعداد با کیبورد انگلیسی'),
                                                FormBuilderValidators.max(20,
                                                    errorText:
                                                        'حداکثر 20 باشد'),
                                              ]),
                                              controller: scoreBoardState
                                                  .scoresNumeric[index],
                                              expands: true,
                                              maxLength: 4,
                                              keyboardType:
                                                  TextInputType.number,
                                              decoration: const InputDecoration(
                                                  border: OutlineInputBorder(),
                                                  contentPadding:
                                                      EdgeInsets.zero,
                                                  counterText: '',
                                                  counterStyle:
                                                      TextStyle(fontSize: 0)),
                                              textAlign: TextAlign.center,
                                              maxLines: null,
                                              minLines: null,
                                            ),
                                          ),
                                        )
                                      ]),
                                    ),
                                    columnSpacing: 0,
                                  ),
                                ),
                              )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ));
  }
}
