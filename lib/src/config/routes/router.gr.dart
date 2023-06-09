// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
    AuthRoute.name: (routeData) {
      final args =
          routeData.argsAs<AuthRouteArgs>(orElse: () => const AuthRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: AuthPage(key: args.key),
      );
    },
    SelectRuleRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SelectRulePage(),
      );
    },
    SelectSchoolRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SelectSchoolPage(),
      );
    },
    ClassesListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ClassesListPage(),
      );
    },
    TeacherClassesRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TeacherClassesPage(),
      );
    },
    TeacherListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TeacherListPage(),
      );
    },
    CourseListRoute.name: (routeData) {
      final args = routeData.argsAs<CourseListRouteArgs>(
          orElse: () => const CourseListRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CourseListPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    SingleStudentRollcallsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SingleStudentRollcallsPage(),
      );
    },
    SingleScoreViewRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const SingleScoreViewPage(),
      );
    },
    ExamRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ExamPage(),
      );
    },
    TeacherClassWidget.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TeacherClassWidget(),
      );
    },
    ClassDetailsRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ClassDetailsPage(),
      );
    },
    StudentDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<StudentDetailsRouteArgs>(
          orElse: () => const StudentDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: StudentDetailsPage(key: args.key),
      );
    },
    ClassStudentRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const ClassStudentPage(),
      );
    },
    ClassRollCallRoute.name: (routeData) {
      final args = routeData.argsAs<ClassRollCallRouteArgs>(
          orElse: () => const ClassRollCallRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ClassRollCallPage(key: args.key),
      );
    },
    AddScoreForClassRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AddScoreForClassPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/splash',
          fullMatch: true,
        ),
        RouteConfig(
          SplashRoute.name,
          path: '/splash',
        ),
        RouteConfig(
          AuthRoute.name,
          path: '/auth',
        ),
        RouteConfig(
          SelectRuleRoute.name,
          path: '/rulePage',
        ),
        RouteConfig(
          SelectSchoolRoute.name,
          path: '/school_select_page',
        ),
        RouteConfig(
          ClassesListRoute.name,
          path: '/classes',
        ),
        RouteConfig(
          TeacherClassesRoute.name,
          path: '/teacher_classes',
        ),
        RouteConfig(
          TeacherListRoute.name,
          path: '/teacher',
        ),
        RouteConfig(
          CourseListRoute.name,
          path: '/course',
        ),
        RouteConfig(
          HomeRoute.name,
          path: '/home_page',
        ),
        RouteConfig(
          SingleStudentRollcallsRoute.name,
          path: '/student_rollcall_view',
        ),
        RouteConfig(
          SingleScoreViewRoute.name,
          path: '/student_score_view',
        ),
        RouteConfig(
          ExamRoute.name,
          path: '/exam_page',
        ),
        RouteConfig(
          TeacherClassWidget.name,
          path: '/mediator_page',
        ),
        RouteConfig(
          ClassDetailsRoute.name,
          path: '/class_details_page',
        ),
        RouteConfig(
          StudentDetailsRoute.name,
          path: '/student_details_page',
        ),
        RouteConfig(
          ClassStudentRoute.name,
          path: '/class_student_page',
        ),
        RouteConfig(
          ClassRollCallRoute.name,
          path: '/class_rollcalls_page',
        ),
        RouteConfig(
          AddScoreForClassRoute.name,
          path: '/add_score_for_class_page',
        ),
      ];
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: '/splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<AuthRouteArgs> {
  AuthRoute({Key? key})
      : super(
          AuthRoute.name,
          path: '/auth',
          args: AuthRouteArgs(key: key),
        );

  static const String name = 'AuthRoute';
}

class AuthRouteArgs {
  const AuthRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AuthRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SelectRulePage]
class SelectRuleRoute extends PageRouteInfo<void> {
  const SelectRuleRoute()
      : super(
          SelectRuleRoute.name,
          path: '/rulePage',
        );

  static const String name = 'SelectRuleRoute';
}

/// generated route for
/// [SelectSchoolPage]
class SelectSchoolRoute extends PageRouteInfo<void> {
  const SelectSchoolRoute()
      : super(
          SelectSchoolRoute.name,
          path: '/school_select_page',
        );

  static const String name = 'SelectSchoolRoute';
}

/// generated route for
/// [ClassesListPage]
class ClassesListRoute extends PageRouteInfo<void> {
  const ClassesListRoute()
      : super(
          ClassesListRoute.name,
          path: '/classes',
        );

  static const String name = 'ClassesListRoute';
}

/// generated route for
/// [TeacherClassesPage]
class TeacherClassesRoute extends PageRouteInfo<void> {
  const TeacherClassesRoute()
      : super(
          TeacherClassesRoute.name,
          path: '/teacher_classes',
        );

  static const String name = 'TeacherClassesRoute';
}

/// generated route for
/// [TeacherListPage]
class TeacherListRoute extends PageRouteInfo<void> {
  const TeacherListRoute()
      : super(
          TeacherListRoute.name,
          path: '/teacher',
        );

  static const String name = 'TeacherListRoute';
}

/// generated route for
/// [CourseListPage]
class CourseListRoute extends PageRouteInfo<CourseListRouteArgs> {
  CourseListRoute({Key? key})
      : super(
          CourseListRoute.name,
          path: '/course',
          args: CourseListRouteArgs(key: key),
        );

  static const String name = 'CourseListRoute';
}

class CourseListRouteArgs {
  const CourseListRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'CourseListRouteArgs{key: $key}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/home_page',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [SingleStudentRollcallsPage]
class SingleStudentRollcallsRoute extends PageRouteInfo<void> {
  const SingleStudentRollcallsRoute()
      : super(
          SingleStudentRollcallsRoute.name,
          path: '/student_rollcall_view',
        );

  static const String name = 'SingleStudentRollcallsRoute';
}

/// generated route for
/// [SingleScoreViewPage]
class SingleScoreViewRoute extends PageRouteInfo<void> {
  const SingleScoreViewRoute()
      : super(
          SingleScoreViewRoute.name,
          path: '/student_score_view',
        );

  static const String name = 'SingleScoreViewRoute';
}

/// generated route for
/// [ExamPage]
class ExamRoute extends PageRouteInfo<void> {
  const ExamRoute()
      : super(
          ExamRoute.name,
          path: '/exam_page',
        );

  static const String name = 'ExamRoute';
}

/// generated route for
/// [TeacherClassWidget]
class TeacherClassWidget extends PageRouteInfo<void> {
  const TeacherClassWidget()
      : super(
          TeacherClassWidget.name,
          path: '/mediator_page',
        );

  static const String name = 'TeacherClassWidget';
}

/// generated route for
/// [ClassDetailsPage]
class ClassDetailsRoute extends PageRouteInfo<void> {
  const ClassDetailsRoute()
      : super(
          ClassDetailsRoute.name,
          path: '/class_details_page',
        );

  static const String name = 'ClassDetailsRoute';
}

/// generated route for
/// [StudentDetailsPage]
class StudentDetailsRoute extends PageRouteInfo<StudentDetailsRouteArgs> {
  StudentDetailsRoute({Key? key})
      : super(
          StudentDetailsRoute.name,
          path: '/student_details_page',
          args: StudentDetailsRouteArgs(key: key),
        );

  static const String name = 'StudentDetailsRoute';
}

class StudentDetailsRouteArgs {
  const StudentDetailsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'StudentDetailsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ClassStudentPage]
class ClassStudentRoute extends PageRouteInfo<void> {
  const ClassStudentRoute()
      : super(
          ClassStudentRoute.name,
          path: '/class_student_page',
        );

  static const String name = 'ClassStudentRoute';
}

/// generated route for
/// [ClassRollCallPage]
class ClassRollCallRoute extends PageRouteInfo<ClassRollCallRouteArgs> {
  ClassRollCallRoute({Key? key})
      : super(
          ClassRollCallRoute.name,
          path: '/class_rollcalls_page',
          args: ClassRollCallRouteArgs(key: key),
        );

  static const String name = 'ClassRollCallRoute';
}

class ClassRollCallRouteArgs {
  const ClassRollCallRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ClassRollCallRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AddScoreForClassPage]
class AddScoreForClassRoute extends PageRouteInfo<void> {
  const AddScoreForClassRoute()
      : super(
          AddScoreForClassRoute.name,
          path: '/add_score_for_class_page',
        );

  static const String name = 'AddScoreForClassRoute';
}
