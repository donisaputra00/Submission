import 'package:flutter/cupertino.dart';
import 'package:submission/preferences/preferences.dart';

class AppTexStyle {
  static const TextStyle title = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static const TextStyle subTitle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static const TextStyle desc = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.darkColor,
  );

  static const TextStyle button = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    color: AppColors.primaryColor,
  );

  static const TextStyle textInput = TextStyle(
    fontFamily: 'Poppins',
    color: AppColors.primaryColor,
  );
}

class Dimens {
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
}
