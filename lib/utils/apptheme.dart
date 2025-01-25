import 'package:flutter/material.dart';
import 'package:movies/utils/colors.dart';

class Apptheme {
  static final ThemeData darkTheme = ThemeData(
    indicatorColor: AppColor.white,
      primaryColor: AppColor.black,
      scaffoldBackgroundColor: AppColor.black,
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColor.black,
        
      ),
      appBarTheme: const AppBarTheme(
        
        color: AppColor.black,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.white)
      ),
      drawerTheme: DrawerThemeData(backgroundColor: AppColor.black),

      tabBarTheme: TabBarTheme(
        indicatorColor: AppColor.white,
      ));

  static final ThemeData lightTheme = ThemeData(
      indicatorColor: AppColor.black,
      primaryColor: AppColor.white,
      drawerTheme: DrawerThemeData(backgroundColor: AppColor.black),
            bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: AppColor.white,
        
      ),
      scaffoldBackgroundColor: AppColor.white,
      appBarTheme: AppBarTheme(
        color: AppColor.white,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColor.black)
      ),


      tabBarTheme: TabBarTheme(
        indicatorColor: AppColor.black,
      ));
}
