import 'package:flutter/material.dart';
import 'package:my_sampad/src/features/auth/domain/models/auth_types.dart';

class GeneralConstants {
  static Size defaultDesignSize = const Size(360, 800);

  static double defaultBorderRadius = 10;
  static int currentIndexPage = 0;
  static List<String> roleCount = [];
  static String defaultFontName = '';
  static String host = 'https://mysampad.iran.liara.run/';
  static String firstAppbarItem = '';
  static String jwt = '';
  static bool isParent = false;
  static bool isTeacher = false;
  static bool isAdmin = false;
  static bool isDeputy = false;
  static UserType userType = UserType.admin;
  static bool didStartSetup = false;

  static Color backgroundColor = const Color.fromARGB(255, 250, 239, 222);
  static Color mainColor = const Color.fromARGB(255, 120, 97, 177);
}
