import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/cubit/language_cubit.dart';
import 'package:movies/cubit/language_state.dart';
import 'package:movies/home_screen.dart';
import 'package:movies/onboarding/onboarding.dart';
import 'package:movies/profile/updateprofile.dart';
import 'package:movies/register/register_screen.dart';
import 'package:movies/services.dart';
import 'package:movies/utils/apptheme.dart';

import 'Login/LoginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MyServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          var languageCubit = context.read<LanguageCubit>();
          return MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              theme: Apptheme.darkTheme,
              debugShowCheckedModeBanner: false,
              themeMode: ThemeMode.dark,
              locale: Locale(languageCubit.currentLocale),
              routes: {
                HomeScreen.routename: (context) => const HomeScreen(),
                OnBoarding.routename: (context) => OnBoarding(),
                Updateprofile.routename: (context) => Updateprofile(),
                LoginScreen.routeName: (context) => LoginScreen(),
                RegisterScreen.routeName: (context) => RegisterScreen(),
              },
              initialRoute: RegisterScreen.routeName
              // MyServices.getString("step") == "1"
              //     ? HomeScreen.routename
              //     : OnBoarding.routename,
              );
        },
      ),
    );
  }
}
