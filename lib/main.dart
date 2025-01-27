import 'package:flutter/material.dart';
import 'package:movies/home_screen.dart';
import 'package:movies/onboarding/onboarding.dart';
import 'package:movies/profile/updateprofile.dart';
import 'package:movies/Auth/register/register_screen.dart';
import 'package:movies/services.dart';
import 'package:movies/utils/apptheme.dart';

import 'Auth/Login/loginscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Apptheme.darkTheme,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      routes: {
        HomeScreen.routename: (context) => const HomeScreen(),
        OnBoarding.routename: (context) => OnBoarding(),
        Updateprofile.routename: (context) => Updateprofile(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName : (context) => RegisterScreen(),
      },
      initialRoute: 
      MyServices.getString("step") == "1"
          ? LoginScreen.routeName
          : OnBoarding.routename,
    );
  }
}
