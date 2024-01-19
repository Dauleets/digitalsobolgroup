import 'package:flutter/material.dart';

import 'constants_theme/colors.dart';

class Styles {
  static ThemeData themeData(BuildContext context) {
    return ThemeData(
      colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.mainColor,
          onPrimary: AppColors.textColorDarker,
          secondary: AppColors.mainColorYellow,
          onSecondary: AppColors.mainColorGrey,
          shadow: AppColors.shadowColor,
          error: Color.fromRGBO(244, 67, 54, 0.867),
          onError: Color.fromRGBO(244, 67, 54, 0.867),
          background: AppColors.whitebackground,
          onBackground: AppColors.mainColorWhite,
          surface: AppColors.mainColorWhite,
          onSurface: AppColors.mainColorGrey),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      shadowColor: AppColors.shadowColor,
      scaffoldBackgroundColor: AppColors.whitebackground,
      brightness: Brightness.light,
      textTheme: TextThemes.textTheme(context),
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: AppColors.whiteColor,
          elevation: 0),
      popupMenuTheme: PopupMenuThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        // hintStyle: TextStyle(
        //     fontFamily: 'SFPRO',
        //     color: AppColors.textColorGrey,
        //     fontWeight: FontWeight.w400,
        //     fontSize: 14),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainColorGrey,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainColorGrey,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.mainColorGrey,
          ),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}

class TextThemes {
  static TextTheme textTheme(BuildContext context) {
    return Theme.of(context).textTheme.copyWith(
          displayLarge: const TextStyle(
            fontFamily: 'SFPRO',
            color: AppColors.textColorDarker,
          ),
          displayMedium: const TextStyle(
            fontFamily: 'SFPRO',
            color: AppColors.textColorDarker,
          ),
          displaySmall: const TextStyle(
            fontFamily: 'SFPRO',
            color: AppColors.textColorDarker,
          ),
          headlineMedium: const TextStyle(
            fontFamily: 'SFPRO',
            color: AppColors.textColorDarker,
          ),
          headlineSmall: const TextStyle(
            fontFamily: 'SFPRO',
            color: AppColors.textColorDarker,
          ),
          titleLarge: const TextStyle(
            fontFamily: 'SFPRO',
            color: AppColors.textColorDarker,
          ),
          titleSmall: const TextStyle(
            fontFamily: 'SFPRO',
            color: AppColors.textColorDarker,
          ),
        );
  }
}
