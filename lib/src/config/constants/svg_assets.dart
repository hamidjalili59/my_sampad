class SvgAssets {
  const SvgAssets._();

  static String get otpIcon => 'otp_login_icon'.iconsSvg;
  static String get course => 'school_icon'.iconsSvg;
  static String get empty => 'empty'.iconsSvg;
}

extension on String {
  String get iconsSvg => 'assets/svgs/icons/$this.svg';
}
