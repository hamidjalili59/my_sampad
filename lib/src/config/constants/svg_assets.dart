class SvgAssets {
  const SvgAssets._();

  static String get otpIcon => 'otp_login_icon'.iconsSvg;
  static String get course => 'school_icon'.iconsSvg;
  static String get empty => 'empty'.iconsSvg;
  static String get absent => 'gheibat'.iconsSvg;
  static String get movajah => 'abcent_with'.iconsSvg;
  static String get gheirMovajah => 'abcent_without'.iconsSvg;
  static String get nomre => 'grade'.iconsSvg;
}

extension on String {
  String get iconsSvg => 'assets/svgs/icons/$this.svg';
}
