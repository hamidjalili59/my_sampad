import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:my_sampad/src/presentation/auth/pages/auth_page.dart';
import 'package:my_sampad/src/presentation/classroom/pages/class_details_page.dart';
import 'package:my_sampad/src/presentation/classroom/pages/classes_list_page.dart';
import 'package:my_sampad/src/presentation/classroom/pages/teacher_classes_page.dart';
import 'package:my_sampad/src/presentation/course/pages/course_list_page.dart';
import 'package:my_sampad/src/presentation/exam/pages/exam_page.dart';
import 'package:my_sampad/src/presentation/home/pages/home_page.dart';
import 'package:my_sampad/src/presentation/rollcall/pages/class_rollcall_page.dart';
import 'package:my_sampad/src/presentation/rollcall/pages/single_student_rollcalls_page.dart';
import 'package:my_sampad/src/presentation/school/pages/select_school_page.dart';
import 'package:my_sampad/src/presentation/score/pages/add_score_for_class_page.dart';
import 'package:my_sampad/src/presentation/score/pages/single_score_view_page.dart';
import 'package:my_sampad/src/presentation/splash/pages/select_role_page.dart';
import 'package:my_sampad/src/presentation/splash/pages/splash_page.dart';
import 'package:my_sampad/src/presentation/student/pages/class_student_page.dart';
import 'package:my_sampad/src/presentation/student/pages/student_details_page.dart';
import 'package:my_sampad/src/presentation/teacher/pages/teacher_list_page.dart';
import 'package:my_sampad/src/presentation/teacher/widget/teacher_class_card_widget.dart'
    as teacher;

part 'router.gr.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(
    path: "/splash",
    page: SplashPage,
    initial: true,
  ),
  AutoRoute(path: "/auth", page: AuthPage),
  AutoRoute(path: "/rulePage", page: SelectRulePage),
  AutoRoute(path: "/school_select_page", page: SelectSchoolPage),
  AutoRoute(path: "/classes", page: ClassesListPage),
  AutoRoute(path: "/teacher_classes", page: TeacherClassesPage),
  AutoRoute(path: "/teacher", page: TeacherListPage),
  AutoRoute(path: "/course", page: CourseListPage),
  AutoRoute(path: "/home_page", page: HomePage),
  AutoRoute(path: "/student_rollcall_view", page: SingleStudentRollcallsPage),
  AutoRoute(path: "/student_score_view", page: SingleScoreViewPage),
  AutoRoute(path: "/exam_page", page: ExamPage),
  AutoRoute(path: "/mediator_page", page: teacher.TeacherClassListWidget),
  // class page
  AutoRoute(
    path: "/class_details_page",
    page: ClassDetailsPage,
  ),
  AutoRoute(
    path: "/student_details_page",
    page: StudentDetailsPage,
  ),
  AutoRoute(
    path: "/class_student_page",
    page: ClassStudentPage,
  ),
  AutoRoute(
    path: "/class_rollcalls_page",
    page: ClassRollCallPage,
  ),
  AutoRoute(
    path: "/add_score_for_class_page",
    page: AddScoreForClassPage,
  ),
])
class AppRouter extends _$AppRouter {}
