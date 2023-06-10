class PngAssets {
  const PngAssets._();

  static String get logo => 'logo'.png;
  static String get employee => 'employee'.png;
  static String get schoolIcon => 'school_icon'.png;
  static String get student => 'student'.studentsPng;
  static String get teacher => 'teacher'.teachersPng;
  static String get parent => 'parent'.parentsPng;
  static String get modir => 'modir'.headMasterPng;
  static String get school => 'school'.png;
  static String get classroom => 'classroom'.png;
  static String get course => 'course_icon'.coursePng;
}

extension on String {
  String get png => 'assets/icons/$this.png';
  String get coursePng => 'assets/icons/course/$this.png';
  String get studentsPng => 'assets/icons/students/$this.png';
  String get teachersPng => 'assets/icons/teachers/$this.png';
  String get parentsPng => 'assets/icons/parents/$this.png';
  String get headMasterPng => 'assets/icons/head_master/$this.png';
}
