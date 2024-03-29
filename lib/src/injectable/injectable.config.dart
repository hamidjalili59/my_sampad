// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:my_sampad/src/core/interceptors/request_interceptor.dart'
    as _i82;
import 'package:my_sampad/src/features/auth/data/data_sources/local/auth_local_data_source.dart'
    as _i13;
import 'package:my_sampad/src/features/auth/data/data_sources/remote/auth_remote_data_source.dart'
    as _i14;
import 'package:my_sampad/src/features/auth/domain/repositories/auth_repository.dart'
    as _i15;
import 'package:my_sampad/src/features/auth/domain/use_cases/cache_auth_data_use_case.dart'
    as _i16;
import 'package:my_sampad/src/features/auth/domain/use_cases/get_account_data_use_case.dart'
    as _i40;
import 'package:my_sampad/src/features/auth/domain/use_cases/get_cached_auth_data_use_case.dart'
    as _i41;
import 'package:my_sampad/src/features/auth/domain/use_cases/logout_auth_use_case.dart'
    as _i66;
import 'package:my_sampad/src/features/auth/domain/use_cases/otp_handshake_use_case.dart'
    as _i70;
import 'package:my_sampad/src/features/classroom/data/data_sources/local/classroom_local_data_source.dart'
    as _i28;
import 'package:my_sampad/src/features/classroom/data/data_sources/remote/classroom_remote_data_source.dart'
    as _i29;
import 'package:my_sampad/src/features/classroom/domain/repositories/classroom_repository.dart'
    as _i30;
import 'package:my_sampad/src/features/classroom/domain/use_cases/add_classroom_use_case.dart'
    as _i3;
import 'package:my_sampad/src/features/classroom/domain/use_cases/cache_classrooms_data_use_case.dart'
    as _i17;
import 'package:my_sampad/src/features/classroom/domain/use_cases/get_cache_classrooms_data_use_case.dart'
    as _i42;
import 'package:my_sampad/src/features/classroom/domain/use_cases/get_classrooms_use_case.dart'
    as _i52;
import 'package:my_sampad/src/features/classroom/domain/use_cases/get_teacher_classroom_use_case.dart'
    as _i63;
import 'package:my_sampad/src/features/classroom/domain/use_cases/remove_classroom_use_case.dart'
    as _i74;
import 'package:my_sampad/src/features/classroom/domain/use_cases/update_classroom_use_case.dart'
    as _i107;
import 'package:my_sampad/src/features/course/data/data_sources/local/course_local_data_source.dart'
    as _i31;
import 'package:my_sampad/src/features/course/data/data_sources/remote/course_remote_data_sourse.dart'
    as _i32;
import 'package:my_sampad/src/features/course/domain/repositories/course_repository.dart'
    as _i33;
import 'package:my_sampad/src/features/course/domain/use_cases/add_course_use_case.dart'
    as _i4;
import 'package:my_sampad/src/features/course/domain/use_cases/cache_course_data_use_case.dart'
    as _i18;
import 'package:my_sampad/src/features/course/domain/use_cases/get_cached_course_data_use_case.dart'
    as _i43;
import 'package:my_sampad/src/features/course/domain/use_cases/get_courses_use_case.dart'
    as _i53;
import 'package:my_sampad/src/features/course/domain/use_cases/remove_course_use_case.dart'
    as _i75;
import 'package:my_sampad/src/features/course/domain/use_cases/update_course_use_case.dart'
    as _i108;
import 'package:my_sampad/src/features/deputy/data/data_sources/local/deputy_local_data_source.dart'
    as _i34;
import 'package:my_sampad/src/features/deputy/data/data_sources/remote/deputy_remote_data_source.dart'
    as _i35;
import 'package:my_sampad/src/features/deputy/domain/repositories/deputy_repository.dart'
    as _i36;
import 'package:my_sampad/src/features/deputy/domain/use_cases/add_deputy_use_case.dart'
    as _i5;
import 'package:my_sampad/src/features/deputy/domain/use_cases/cache_deputy_data_use_case.dart'
    as _i19;
import 'package:my_sampad/src/features/deputy/domain/use_cases/get_cached_deputy_data_use_case.dart'
    as _i44;
import 'package:my_sampad/src/features/deputy/domain/use_cases/get_deputy_use_case.dart'
    as _i54;
import 'package:my_sampad/src/features/deputy/domain/use_cases/remove_deputy_use_case.dart'
    as _i76;
import 'package:my_sampad/src/features/deputy/domain/use_cases/update_deputy_use_case.dart'
    as _i109;
import 'package:my_sampad/src/features/exam/data/data_sources/local/exam_local_data_source.dart'
    as _i37;
import 'package:my_sampad/src/features/exam/data/data_sources/remote/exam_remote_data_source.dart'
    as _i38;
import 'package:my_sampad/src/features/exam/domain/repositories/exam_repository.dart'
    as _i39;
import 'package:my_sampad/src/features/exam/domain/use_cases/add_exam_use_case.dart'
    as _i6;
import 'package:my_sampad/src/features/exam/domain/use_cases/cache_exam_data_use_case.dart'
    as _i20;
import 'package:my_sampad/src/features/exam/domain/use_cases/get_cached_exam_data_use_case.dart'
    as _i45;
import 'package:my_sampad/src/features/exam/domain/use_cases/get_exams_use_case.dart'
    as _i55;
import 'package:my_sampad/src/features/exam/domain/use_cases/remove_exam_use_case.dart'
    as _i77;
import 'package:my_sampad/src/features/exam/domain/use_cases/update_exam_use_case.dart'
    as _i110;
import 'package:my_sampad/src/features/mediator_tc/data/data_sources/local/mediator_local_data_source.dart'
    as _i67;
import 'package:my_sampad/src/features/mediator_tc/data/data_sources/remote/mediator_remote_data_source.dart'
    as _i68;
import 'package:my_sampad/src/features/mediator_tc/domain/repositories/mediator_repository.dart'
    as _i69;
import 'package:my_sampad/src/features/mediator_tc/domain/use_cases/add_mediator_use_case.dart'
    as _i7;
import 'package:my_sampad/src/features/mediator_tc/domain/use_cases/cache_mediator_data_use_case.dart'
    as _i21;
import 'package:my_sampad/src/features/mediator_tc/domain/use_cases/get_cached_mediator_data_use_case.dart'
    as _i46;
import 'package:my_sampad/src/features/mediator_tc/domain/use_cases/get_mediators_use_case.dart'
    as _i56;
import 'package:my_sampad/src/features/mediator_tc/domain/use_cases/remove_mediator_use_case.dart'
    as _i78;
import 'package:my_sampad/src/features/parent/data/data_sources/local/parent_local_data_source.dart'
    as _i71;
import 'package:my_sampad/src/features/parent/data/data_sources/remote/parent_remote_data_source.dart'
    as _i72;
import 'package:my_sampad/src/features/parent/domain/repositories/parent_repository.dart'
    as _i73;
import 'package:my_sampad/src/features/parent/domain/use_cases/cache_parent_data_use_case.dart'
    as _i22;
import 'package:my_sampad/src/features/parent/domain/use_cases/get_cached_parent_data_use_case.dart'
    as _i47;
import 'package:my_sampad/src/features/parent/domain/use_cases/get_parent_use_case.dart'
    as _i57;
import 'package:my_sampad/src/features/parent/domain/use_cases/update_parent_use_case.dart'
    as _i111;
import 'package:my_sampad/src/features/role_call/data/data_sources/local/rollcall_local_data_source.dart'
    as _i84;
import 'package:my_sampad/src/features/role_call/data/data_sources/remote/rollcall_remote_data_source.dart'
    as _i85;
import 'package:my_sampad/src/features/role_call/domain/repositories/rollcall_repository.dart'
    as _i86;
import 'package:my_sampad/src/features/role_call/domain/use_cases/add_rollcall_use_case.dart'
    as _i8;
import 'package:my_sampad/src/features/role_call/domain/use_cases/cache_rollcall_data_use_case.dart'
    as _i23;
import 'package:my_sampad/src/features/role_call/domain/use_cases/get_cached_rollcall_data_use_case.dart'
    as _i48;
import 'package:my_sampad/src/features/role_call/domain/use_cases/get_rollcalls_use_case.dart'
    as _i58;
import 'package:my_sampad/src/features/school/data/data_sources/remote/school_remote_data_source.dart'
    as _i88;
import 'package:my_sampad/src/features/school/domain/reposiotories/school_repository.dart'
    as _i89;
import 'package:my_sampad/src/features/school/domain/usecase/get_schools_usecase.dart'
    as _i59;
import 'package:my_sampad/src/features/score/data/data_sources/local/score_local_data_source.dart'
    as _i92;
import 'package:my_sampad/src/features/score/data/data_sources/remote/score_remote_data_source.dart'
    as _i93;
import 'package:my_sampad/src/features/score/domain/repositories/score_repository.dart'
    as _i94;
import 'package:my_sampad/src/features/score/domain/use_cases/add_score_use_case.dart'
    as _i9;
import 'package:my_sampad/src/features/score/domain/use_cases/cache_score_data_use_case.dart'
    as _i24;
import 'package:my_sampad/src/features/score/domain/use_cases/get_cached_score_data_use_case.dart'
    as _i49;
import 'package:my_sampad/src/features/score/domain/use_cases/get_scores_use_case.dart'
    as _i60;
import 'package:my_sampad/src/features/score/domain/use_cases/remove_score_use_case.dart'
    as _i79;
import 'package:my_sampad/src/features/score/domain/use_cases/update_score_use_case.dart'
    as _i112;
import 'package:my_sampad/src/features/student/data/data_sources/local/student_local_data_source.dart'
    as _i96;
import 'package:my_sampad/src/features/student/data/data_sources/remote/student_remote_data_source.dart'
    as _i97;
import 'package:my_sampad/src/features/student/domain/repositories/student_repository.dart'
    as _i98;
import 'package:my_sampad/src/features/student/domain/use_cases/add_student_use_case.dart'
    as _i10;
import 'package:my_sampad/src/features/student/domain/use_cases/cache_student_data_use_case.dart'
    as _i25;
import 'package:my_sampad/src/features/student/domain/use_cases/get_cached_student_data_use_case.dart'
    as _i50;
import 'package:my_sampad/src/features/student/domain/use_cases/get_students_parent_use_case.dart'
    as _i61;
import 'package:my_sampad/src/features/student/domain/use_cases/get_students_use_case.dart'
    as _i62;
import 'package:my_sampad/src/features/student/domain/use_cases/remove_student_use_case.dart'
    as _i80;
import 'package:my_sampad/src/features/student/domain/use_cases/update_student_use_case.dart'
    as _i113;
import 'package:my_sampad/src/features/teacher/data/data_sources/local/teacher_local_data_source.dart'
    as _i101;
import 'package:my_sampad/src/features/teacher/data/data_sources/remote/teacher_remote_data_source.dart'
    as _i102;
import 'package:my_sampad/src/features/teacher/domain/repositories/teacher_repository.dart'
    as _i103;
import 'package:my_sampad/src/features/teacher/domain/use_cases/add_teacher_use_case.dart'
    as _i12;
import 'package:my_sampad/src/features/teacher/domain/use_cases/cache_teacher_data_use_case.dart'
    as _i26;
import 'package:my_sampad/src/features/teacher/domain/use_cases/get_cached_teacher_data_use_case.dart'
    as _i51;
import 'package:my_sampad/src/features/teacher/domain/use_cases/get_teachers_use_case.dart'
    as _i65;
import 'package:my_sampad/src/features/teacher/domain/use_cases/remove_teacher_use_case.dart'
    as _i81;
import 'package:my_sampad/src/features/teacher/domain/use_cases/update_teacher_use_case.dart'
    as _i114;
import 'package:my_sampad/src/features/teacher_rollcall/data/data_sources/remote/teacher_rollcall_remote_data_source.dart'
    as _i105;
import 'package:my_sampad/src/features/teacher_rollcall/domain/repositories/teacher_rollcall_repository.dart'
    as _i106;
import 'package:my_sampad/src/features/teacher_rollcall/domain/use_cases/add_teacher_rollcall_use_case.dart'
    as _i11;
import 'package:my_sampad/src/features/teacher_rollcall/domain/use_cases/get_teacher_rollcalls_use_case.dart'
    as _i64;
import 'package:my_sampad/src/injectable/module_injection/feature/auth_feature_module.dart'
    as _i123;
import 'package:my_sampad/src/injectable/module_injection/feature/classroom_feature_module.dart'
    as _i124;
import 'package:my_sampad/src/injectable/module_injection/feature/course_feature_module.dart'
    as _i125;
import 'package:my_sampad/src/injectable/module_injection/feature/deputy_feature_module.dart'
    as _i126;
import 'package:my_sampad/src/injectable/module_injection/feature/exam_feature_module.dart'
    as _i127;
import 'package:my_sampad/src/injectable/module_injection/feature/mediator_feature_module.dart'
    as _i128;
import 'package:my_sampad/src/injectable/module_injection/feature/parent_feature_module.dart'
    as _i129;
import 'package:my_sampad/src/injectable/module_injection/feature/rollcall_feature_module.dart'
    as _i130;
import 'package:my_sampad/src/injectable/module_injection/feature/school_feature_module.dart'
    as _i131;
import 'package:my_sampad/src/injectable/module_injection/feature/score_feature_module.dart'
    as _i132;
import 'package:my_sampad/src/injectable/module_injection/feature/student_feature_module.dart'
    as _i133;
import 'package:my_sampad/src/injectable/module_injection/feature/teacher_feature_module.dart'
    as _i134;
import 'package:my_sampad/src/injectable/module_injection/feature/teacher_rollcall_feature_module.dart'
    as _i135;
import 'package:my_sampad/src/presentation/auth/bloc/auth_bloc.dart' as _i115;
import 'package:my_sampad/src/presentation/classroom/bloc/classroom_bloc.dart'
    as _i116;
import 'package:my_sampad/src/presentation/classroom/bloc/teacher_classroom/teacher_classroom_bloc.dart'
    as _i99;
import 'package:my_sampad/src/presentation/course/bloc/course/course_bloc.dart'
    as _i117;
import 'package:my_sampad/src/presentation/deputy/bloc/deputy/deputy_bloc.dart'
    as _i118;
import 'package:my_sampad/src/presentation/exam/bloc/exam/exam_bloc.dart'
    as _i119;
import 'package:my_sampad/src/presentation/home/bloc/home_bloc.dart' as _i120;
import 'package:my_sampad/src/presentation/rollcall/bloc/rollcall_class/class_rollcall/class_rollcall_bloc.dart'
    as _i27;
import 'package:my_sampad/src/presentation/rollcall/bloc/rollcall_single/rollcall_bloc.dart'
    as _i83;
import 'package:my_sampad/src/presentation/rollcall/bloc/teacher_rollcall/teacher_rollcall_bloc.dart'
    as _i104;
import 'package:my_sampad/src/presentation/school/bloc/school/school_bloc.dart'
    as _i87;
import 'package:my_sampad/src/presentation/score/bloc/score/score_bloc.dart'
    as _i90;
import 'package:my_sampad/src/presentation/score/bloc/score_board/score_board_bloc.dart'
    as _i91;
import 'package:my_sampad/src/presentation/splash/bloc/splash_bloc.dart'
    as _i95;
import 'package:my_sampad/src/presentation/student/bloc/student/student_bloc.dart'
    as _i121;
import 'package:my_sampad/src/presentation/teacher/bloc/teacher/teacher_bloc.dart'
    as _i122;
import 'package:my_sampad/src/presentation/teacher/bloc/teacher_detail/teacher_detail_bloc.dart'
    as _i100;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final classroomFeatureModule = _$ClassroomFeatureModule();
    final courseFeatureModule = _$CourseFeatureModule();
    final deputyFeatureModule = _$DeputyFeatureModule();
    final examFeatureModule = _$ExamFeatureModule();
    final mediatorFeatureModule = _$MediatorFeatureModule();
    final rollcallFeatureModule = _$RollcallFeatureModule();
    final scoreFeatureModule = _$ScoreFeatureModule();
    final studentFeatureModule = _$StudentFeatureModule();
    final teacherRollcallFeatureModule = _$TeacherRollcallFeatureModule();
    final teacherFeatureModule = _$TeacherFeatureModule();
    final authFeatureModule = _$AuthFeatureModule();
    final parentFeatureModule = _$ParentFeatureModule();
    final schoolFeatureModule = _$SchoolFeatureModule();
    gh.factory<_i3.AddClassroomUseCase>(
        () => classroomFeatureModule.addClassroomUseCase);
    gh.factory<_i4.AddCourseUseCase>(
        () => courseFeatureModule.getCourseUseCase);
    gh.factory<_i5.AddDeputyUseCase>(
        () => deputyFeatureModule.getDeputyUseCase);
    gh.factory<_i6.AddExamUseCase>(() => examFeatureModule.getExamUseCase);
    gh.factory<_i7.AddMediatorUseCase>(
        () => mediatorFeatureModule.getMediatorUseCase);
    gh.factory<_i8.AddRollcallUseCase>(
        () => rollcallFeatureModule.getRollcallUseCase);
    gh.factory<_i9.AddScoreUseCase>(() => scoreFeatureModule.getScoreUseCase);
    gh.factory<_i10.AddStudentUseCase>(
        () => studentFeatureModule.getStudentUseCase);
    gh.factory<_i11.AddTeacherRollcallUseCase>(
        () => teacherRollcallFeatureModule.getTeacherRollcallUseCase);
    gh.factory<_i12.AddTeacherUseCase>(
        () => teacherFeatureModule.getTeacherUseCase);
    gh.factory<_i13.AuthLocalDataSource>(() => authFeatureModule.localDS);
    gh.factory<_i14.AuthRemoteDataSource>(() => authFeatureModule.remoteDS);
    gh.factory<_i15.AuthRepository>(() => authFeatureModule.repo);
    gh.factory<_i16.CacheAuthDataUseCase>(
        () => authFeatureModule.cacheAuthDataUseCase);
    gh.factory<_i17.CacheClassroomsDataUseCase>(
        () => classroomFeatureModule.cacheClassroomDataUseCase);
    gh.factory<_i18.CacheCourseDataUseCase>(
        () => courseFeatureModule.cacheCourseDataUseCase);
    gh.factory<_i19.CacheDeputyDataUseCase>(
        () => deputyFeatureModule.cacheDeputyDataUseCase);
    gh.factory<_i20.CacheExamDataUseCase>(
        () => examFeatureModule.cacheExamDataUseCase);
    gh.factory<_i21.CacheMediatorDataUseCase>(
        () => mediatorFeatureModule.cacheMediatorDataUseCase);
    gh.factory<_i22.CacheParentDataUseCase>(
        () => parentFeatureModule.cacheParentDataUseCase);
    gh.factory<_i23.CacheRollcallDataUseCase>(
        () => rollcallFeatureModule.cacheRollcallDataUseCase);
    gh.factory<_i24.CacheScoreDataUseCase>(
        () => scoreFeatureModule.cacheScoreDataUseCase);
    gh.factory<_i25.CacheStudentDataUseCase>(
        () => studentFeatureModule.cacheStudentDataUseCase);
    gh.factory<_i26.CacheTeacherDataUseCase>(
        () => teacherFeatureModule.cacheTeacherDataUseCase);
    gh.factory<_i27.ClassRollcallBloc>(
        () => _i27.ClassRollcallBloc(gh<_i8.AddRollcallUseCase>()));
    gh.factory<_i28.ClassroomLocalDataSource>(
        () => classroomFeatureModule.localDS);
    gh.factory<_i29.ClassroomRemoteDataSource>(
        () => classroomFeatureModule.remoteDS);
    gh.factory<_i30.ClassroomRepository>(() => classroomFeatureModule.repo);
    gh.factory<_i31.CourseLocalDataSource>(() => courseFeatureModule.localDS);
    gh.factory<_i32.CourseRemoteDataSource>(() => courseFeatureModule.remoteDS);
    gh.factory<_i33.CourseRepository>(() => courseFeatureModule.repo);
    gh.factory<_i34.DeputyLocalDataSource>(() => deputyFeatureModule.localDS);
    gh.factory<_i35.DeputyRemoteDataSource>(() => deputyFeatureModule.remoteDS);
    gh.factory<_i36.DeputyRepository>(() => deputyFeatureModule.repo);
    gh.factory<_i37.ExamLocalDataSource>(() => examFeatureModule.localDS);
    gh.factory<_i38.ExamRemoteDataSource>(() => examFeatureModule.remoteDS);
    gh.factory<_i39.ExamRepository>(() => examFeatureModule.repo);
    gh.factory<_i40.GetAccountDataUseCase>(
        () => authFeatureModule.getAccountDataUseCase);
    gh.factory<_i41.GetCachedAuthDataUseCase>(
        () => authFeatureModule.getCacheDataUseCase);
    gh.factory<_i42.GetCachedClassroomsDataUseCase>(
        () => classroomFeatureModule.getCachedClassroomDataUseCase);
    gh.factory<_i43.GetCachedCourseDataUseCase>(
        () => courseFeatureModule.getCachedCourseDataUseCase);
    gh.factory<_i44.GetCachedDeputyDataUseCase>(
        () => deputyFeatureModule.getCachedDeputyDataUseCase);
    gh.factory<_i45.GetCachedExamDataUseCase>(
        () => examFeatureModule.getCachedExamDataUseCase);
    gh.factory<_i46.GetCachedMediatorDataUseCase>(
        () => mediatorFeatureModule.getCachedMediatorDataUseCase);
    gh.factory<_i47.GetCachedParentDataUseCase>(
        () => parentFeatureModule.getCachedParentDataUseCase);
    gh.factory<_i48.GetCachedRollcallDataUseCase>(
        () => rollcallFeatureModule.getCachedRollcallDataUseCase);
    gh.factory<_i49.GetCachedScoreDataUseCase>(
        () => scoreFeatureModule.getCachedScoreDataUseCase);
    gh.factory<_i50.GetCachedStudentDataUseCase>(
        () => studentFeatureModule.getCachedStudentDataUseCase);
    gh.factory<_i51.GetCachedTeacherDataUseCase>(
        () => teacherFeatureModule.getCachedTeacherDataUseCase);
    gh.factory<_i52.GetClassroomsUseCase>(
        () => classroomFeatureModule.getClassroomsUseCase);
    gh.factory<_i53.GetCoursesUseCase>(
        () => courseFeatureModule.getCoursesUseCase);
    gh.factory<_i54.GetDeputyUseCase>(
        () => deputyFeatureModule.getDeputysUseCase);
    gh.factory<_i55.GetExamsUseCase>(() => examFeatureModule.getExamsUseCase);
    gh.factory<_i56.GetMediatorUseCase>(
        () => mediatorFeatureModule.getMediatorsUseCase);
    gh.factory<_i57.GetParentUseCase>(
        () => parentFeatureModule.getParentsUseCase);
    gh.factory<_i58.GetRollCallsUseCase>(
        () => rollcallFeatureModule.getRollcallsUseCase);
    gh.factory<_i59.GetSchoolsUseCase>(
        () => schoolFeatureModule.getSchoolsUseCase);
    gh.factory<_i60.GetScoreUseCase>(() => scoreFeatureModule.getScoresUseCase);
    gh.factory<_i61.GetStudentParentUseCase>(
        () => studentFeatureModule.getStudentParentUseCase);
    gh.factory<_i62.GetStudentUseCase>(
        () => studentFeatureModule.getStudentsUseCase);
    gh.factory<_i63.GetTeacherClassroomsUseCase>(
        () => classroomFeatureModule.getTeacherClassroomDataUseCase);
    gh.factory<_i64.GetTeacherRollCallsUseCase>(
        () => teacherRollcallFeatureModule.getTeacherRollcallsUseCase);
    gh.factory<_i65.GetTeacherUseCase>(
        () => teacherFeatureModule.getTeachersUseCase);
    gh.factory<_i66.LogoutAuthDataUseCase>(
        () => authFeatureModule.logoutAuthDataUseCase);
    gh.factory<_i67.MediatorLocalDataSource>(
        () => mediatorFeatureModule.localDS);
    gh.factory<_i68.MediatorRemoteDataSource>(
        () => mediatorFeatureModule.remoteDS);
    gh.factory<_i69.MediatorRepository>(() => mediatorFeatureModule.repo);
    gh.factory<_i70.OtpHandshakeUseCase>(
        () => authFeatureModule.otpAuthorizaUseCase);
    gh.factory<_i71.ParentLocalDataSource>(() => parentFeatureModule.localDS);
    gh.factory<_i72.ParentRemoteDataSource>(() => parentFeatureModule.remoteDS);
    gh.factory<_i73.ParentRepository>(() => parentFeatureModule.repo);
    gh.factory<_i74.RemoveClassroomUseCase>(
        () => classroomFeatureModule.removeClassroomUseCase);
    gh.factory<_i75.RemoveCourseUseCase>(
        () => courseFeatureModule.removeCourseUseCase);
    gh.factory<_i76.RemoveDeputyUseCase>(
        () => deputyFeatureModule.removeDeputyUseCase);
    gh.factory<_i77.RemoveExamUseCase>(
        () => examFeatureModule.removeExamUseCase);
    gh.factory<_i78.RemoveMediatorUseCase>(
        () => mediatorFeatureModule.removeMediatorUseCase);
    gh.factory<_i79.RemoveScoreUseCase>(
        () => scoreFeatureModule.removeScoreUseCase);
    gh.factory<_i80.RemoveStudentUseCase>(
        () => studentFeatureModule.removeStudentUseCase);
    gh.factory<_i81.RemoveTeacherUseCase>(
        () => teacherFeatureModule.removeTeacherUseCase);
    gh.factory<_i82.RequestInterceptor>(() => _i82.RequestInterceptor());
    gh.lazySingleton<_i83.RollcallBloc>(
        () => _i83.RollcallBloc(gh<_i58.GetRollCallsUseCase>()));
    gh.factory<_i84.RollcallLocalDataSource>(
        () => rollcallFeatureModule.localDS);
    gh.factory<_i85.RollcallRemoteDataSource>(
        () => rollcallFeatureModule.remoteDS);
    gh.factory<_i86.RollcallRepository>(() => rollcallFeatureModule.repo);
    gh.lazySingleton<_i87.SchoolBloc>(
        () => _i87.SchoolBloc(gh<_i59.GetSchoolsUseCase>()));
    gh.factory<_i88.SchoolRemoteDataSource>(() => schoolFeatureModule.remoteDS);
    gh.factory<_i89.SchoolRepository>(() => schoolFeatureModule.repo);
    gh.factory<_i90.ScoreBloc>(() => _i90.ScoreBloc(
          gh<_i60.GetScoreUseCase>(),
          gh<_i79.RemoveScoreUseCase>(),
        ));
    gh.factory<_i91.ScoreBoardBloc>(() => _i91.ScoreBoardBloc(
          gh<_i62.GetStudentUseCase>(),
          gh<_i9.AddScoreUseCase>(),
        ));
    gh.factory<_i92.ScoreLocalDataSource>(() => scoreFeatureModule.localDS);
    gh.factory<_i93.ScoreRemoteDataSource>(() => scoreFeatureModule.remoteDS);
    gh.factory<_i94.ScoreRepository>(() => scoreFeatureModule.repo);
    gh.lazySingleton<_i95.SplashBloc>(() => _i95.SplashBloc(
          gh<_i41.GetCachedAuthDataUseCase>(),
          gh<_i40.GetAccountDataUseCase>(),
        ));
    gh.factory<_i96.StudentLocalDataSource>(() => studentFeatureModule.localDS);
    gh.factory<_i97.StudentRemoteDataSource>(
        () => studentFeatureModule.remoteDS);
    gh.factory<_i98.StudentRepository>(() => studentFeatureModule.repo);
    gh.lazySingleton<_i99.TeacherClassroomBloc>(() =>
        _i99.TeacherClassroomBloc(gh<_i63.GetTeacherClassroomsUseCase>()));
    gh.lazySingleton<_i100.TeacherDetailBloc>(() => _i100.TeacherDetailBloc(
          gh<_i56.GetMediatorUseCase>(),
          gh<_i7.AddMediatorUseCase>(),
          gh<_i78.RemoveMediatorUseCase>(),
        ));
    gh.factory<_i101.TeacherLocalDataSource>(
        () => teacherFeatureModule.localDS);
    gh.factory<_i102.TeacherRemoteDataSource>(
        () => teacherFeatureModule.remoteDS);
    gh.factory<_i103.TeacherRepository>(() => teacherFeatureModule.repo);
    gh.factory<_i104.TeacherRollcallBloc>(() => _i104.TeacherRollcallBloc(
          gh<_i11.AddTeacherRollcallUseCase>(),
          gh<_i64.GetTeacherRollCallsUseCase>(),
        ));
    gh.factory<_i105.TeacherRollcallRemoteDataSource>(
        () => teacherRollcallFeatureModule.remoteDS);
    gh.factory<_i106.TeacherRollcallRepository>(
        () => teacherRollcallFeatureModule.repo);
    gh.factory<_i107.UpdateClassroomUseCase>(
        () => classroomFeatureModule.updateClassroomUseCase);
    gh.factory<_i108.UpdateCourseUseCase>(
        () => courseFeatureModule.updateCourseUseCase);
    gh.factory<_i109.UpdateDeputyUseCase>(
        () => deputyFeatureModule.updateDeputyUseCase);
    gh.factory<_i110.UpdateExamUseCase>(
        () => examFeatureModule.updateExamUseCase);
    gh.factory<_i111.UpdateParentUseCase>(
        () => parentFeatureModule.updateParentUseCase);
    gh.factory<_i112.UpdateScoreUseCase>(
        () => scoreFeatureModule.updateScoreUseCase);
    gh.factory<_i113.UpdateStudentUseCase>(
        () => studentFeatureModule.updateStudentUseCase);
    gh.factory<_i114.UpdateTeacherUseCase>(
        () => teacherFeatureModule.updateTeacherUseCase);
    gh.factory<_i115.AuthBloc>(() => _i115.AuthBloc(
          gh<_i70.OtpHandshakeUseCase>(),
          gh<_i16.CacheAuthDataUseCase>(),
          gh<_i66.LogoutAuthDataUseCase>(),
        ));
    gh.lazySingleton<_i116.ClassroomBloc>(() => _i116.ClassroomBloc(
          gh<_i52.GetClassroomsUseCase>(),
          gh<_i3.AddClassroomUseCase>(),
          gh<_i63.GetTeacherClassroomsUseCase>(),
          gh<_i107.UpdateClassroomUseCase>(),
          gh<_i74.RemoveClassroomUseCase>(),
        ));
    gh.lazySingleton<_i117.CourseBloc>(() => _i117.CourseBloc(
          gh<_i53.GetCoursesUseCase>(),
          gh<_i4.AddCourseUseCase>(),
          gh<_i108.UpdateCourseUseCase>(),
          gh<_i75.RemoveCourseUseCase>(),
        ));
    gh.lazySingleton<_i118.DeputyBloc>(() => _i118.DeputyBloc(
          gh<_i54.GetDeputyUseCase>(),
          gh<_i5.AddDeputyUseCase>(),
          gh<_i109.UpdateDeputyUseCase>(),
          gh<_i76.RemoveDeputyUseCase>(),
        ));
    gh.lazySingleton<_i119.ExamBloc>(() => _i119.ExamBloc(
          gh<_i55.GetExamsUseCase>(),
          gh<_i6.AddExamUseCase>(),
          gh<_i77.RemoveExamUseCase>(),
          gh<_i110.UpdateExamUseCase>(),
        ));
    gh.factory<_i120.HomeBloc>(
        () => _i120.HomeBloc(gh<_i66.LogoutAuthDataUseCase>()));
    gh.lazySingleton<_i121.StudentBloc>(() => _i121.StudentBloc(
          gh<_i62.GetStudentUseCase>(),
          gh<_i10.AddStudentUseCase>(),
          gh<_i61.GetStudentParentUseCase>(),
          gh<_i113.UpdateStudentUseCase>(),
          gh<_i80.RemoveStudentUseCase>(),
        ));
    gh.lazySingleton<_i122.TeacherBloc>(() => _i122.TeacherBloc(
          gh<_i65.GetTeacherUseCase>(),
          gh<_i12.AddTeacherUseCase>(),
          gh<_i114.UpdateTeacherUseCase>(),
          gh<_i81.RemoveTeacherUseCase>(),
        ));
    return this;
  }
}

class _$AuthFeatureModule extends _i123.AuthFeatureModule {}

class _$ClassroomFeatureModule extends _i124.ClassroomFeatureModule {}

class _$CourseFeatureModule extends _i125.CourseFeatureModule {}

class _$DeputyFeatureModule extends _i126.DeputyFeatureModule {}

class _$ExamFeatureModule extends _i127.ExamFeatureModule {}

class _$MediatorFeatureModule extends _i128.MediatorFeatureModule {}

class _$ParentFeatureModule extends _i129.ParentFeatureModule {}

class _$RollcallFeatureModule extends _i130.RollcallFeatureModule {}

class _$SchoolFeatureModule extends _i131.SchoolFeatureModule {}

class _$ScoreFeatureModule extends _i132.ScoreFeatureModule {}

class _$StudentFeatureModule extends _i133.StudentFeatureModule {}

class _$TeacherFeatureModule extends _i134.TeacherFeatureModule {}

class _$TeacherRollcallFeatureModule
    extends _i135.TeacherRollcallFeatureModule {}
