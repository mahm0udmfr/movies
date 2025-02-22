import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movies/Auth/forget_password/forget_password.dart';
import 'package:movies/Auth/reset_password/reset_password_view.dart';
import 'package:movies/cubit/language_cubit.dart';
import 'package:movies/cubit/language_state.dart';
import 'package:movies/home_screen.dart';
import 'package:movies/onboarding/onboarding.dart';
import 'package:movies/profile/updateprofile.dart';
import 'package:movies/services.dart';
import 'package:movies/tabs/hometab/cubit/ListCategoryCubit.dart';
import 'package:movies/tabs/hometab/home_tab.dart';
import 'package:movies/tabs/movie_details/movie_details.dart';
import 'package:movies/tabs/profileTab/cubit/history_view_model.dart';
import 'package:movies/tabs/profileTab/cubit/profile_tab_view_model.dart';
import 'package:movies/tabs/profileTab/profile_tab.dart';
import 'package:movies/utils/apptheme.dart';
import 'package:movies/utils/bloc_observer.dart';
import 'package:path_provider/path_provider.dart';
import 'Auth/Login/loginscreen.dart';
import 'Auth/register/register_screen.dart';
import 'model/movie_details_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Bloc.observer = MyBlocObserver();
  var directory = await getApplicationDocumentsDirectory();
  Hive.registerAdapter(MovieDetailsAdapter());
  Hive.init(directory.path);
  await MyServices.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => HistoryViewModel()),
      BlocProvider(create: (_) => ProfileTabViewModel()),
      BlocProvider(create: (_) => ListCategoryViewModel()),
    ],
    child: MyApp(),
  ),

  );
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
              HomeScreen.routename: (context) => HomeScreen(),
              OnBoarding.routename: (context) => OnBoarding(),
              Updateprofile.routename: (context) => Updateprofile(),
              LoginScreen.routeName: (context) => LoginScreen(),
              RegisterScreen.routeName: (context) => RegisterScreen(),
              ForgetPassword.routename: (context) => ForgetPassword(),
              MoviesTab.routename: (context) => MoviesTab(),
              ResetPassword.routeName: (context) => ResetPassword(),
              ProfileTab.routename: (context) => ProfileTab(),
              MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
            },
            initialRoute: MyServices.getString("step") == "1"
                ? MyServices.getString("Token") == null
                    ? LoginScreen.routeName
                    : HomeScreen.routename
                : OnBoarding.routename,
          );
        },
      ),
    );
  }
}
