import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';

class Apptheme {
  static final ThemeData darkTheme = ThemeData(
dialogTheme: DialogTheme(backgroundColor: AppColor.black),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.grey,
        showUnselectedLabels: false,
        elevation: 0,
      ),
      indicatorColor: AppColor.white,
      primaryColor: AppColor.orange,
      scaffoldBackgroundColor: AppColor.black,
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: AppColor.grey),
      appBarTheme: AppBarTheme(
          titleTextStyle: AppStyles.regular16RobotoOrange,
          color: AppColor.transparent,
          centerTitle: true,
          iconTheme: IconThemeData(color: AppColor.orange)),
      tabBarTheme: TabBarTheme(
        indicatorColor: AppColor.white,
      ));

  // static final ThemeData lightTheme = ThemeData(
  //     indicatorColor: AppColor.black,
  //     primaryColor: AppColor.white,
  //     drawerTheme: DrawerThemeData(backgroundColor: AppColor.black),
  //           bottomSheetTheme: BottomSheetThemeData(
  //       backgroundColor: AppColor.white,

  //     ),
  //     scaffoldBackgroundColor: AppColor.white,
  //     appBarTheme: AppBarTheme(
  //       color: AppColor.white,
  //       centerTitle: true,
  //       iconTheme: IconThemeData(color: AppColor.black)
  //     ),

  //     tabBarTheme: TabBarTheme(
  //       indicatorColor: AppColor.black,
  //     ));
}
