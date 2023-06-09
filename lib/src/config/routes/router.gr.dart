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
    IntroRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const IntroPage(),
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
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const CourseListPage(),
      );
    },
    HomeRoute.name: (routeData) {
      final args =
          routeData.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: HomePage(key: args.key),
      );
    },
    ClassDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<ClassDetailsRouteArgs>(
          orElse: () => const ClassDetailsRouteArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ClassDetailsPage(key: args.key),
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
          IntroRoute.name,
          path: '/intro',
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
/// [IntroPage]
class IntroRoute extends PageRouteInfo<void> {
  const IntroRoute()
      : super(
          IntroRoute.name,
          path: '/intro',
        );

  static const String name = 'IntroRoute';
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
class CourseListRoute extends PageRouteInfo<void> {
  const CourseListRoute()
      : super(
          CourseListRoute.name,
          path: '/course',
        );

  static const String name = 'CourseListRoute';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<HomeRouteArgs> {
  HomeRoute({Key? key})
      : super(
          HomeRoute.name,
          path: '/home_page',
          args: HomeRouteArgs(key: key),
        );

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'HomeRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ClassDetailsPage]
class ClassDetailsRoute extends PageRouteInfo<ClassDetailsRouteArgs> {
  ClassDetailsRoute({Key? key})
      : super(
          ClassDetailsRoute.name,
          path: '/class_details_page',
          args: ClassDetailsRouteArgs(key: key),
        );

  static const String name = 'ClassDetailsRoute';
}

class ClassDetailsRouteArgs {
  const ClassDetailsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ClassDetailsRouteArgs{key: $key}';
  }
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
