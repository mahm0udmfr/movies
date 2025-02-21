import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/Auth/Login/cubit/login_interface.dart';
import 'package:movies/Auth/Login/cubit/login_screen_state.dart';
import 'package:movies/Auth/Login/cubit/login_screen_view_model.dart';
import 'package:movies/Auth/forget_password/forget_password.dart';
import 'package:movies/Auth/register/register_screen.dart';
import 'package:movies/cubit/language_cubit.dart';
import 'package:movies/home_screen.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/dialog_utils.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';
import 'package:movies/widget/custom_text_form_field.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "loginscreen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> implements LoginInterface {
  late LoginScreenViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = LoginScreenViewModel();
    viewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocProvider(
        create: (context) => viewModel,
        child: BlocConsumer<LoginScreenViewModel, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              navigateToScreen();
            } else if (state is LoginFailure) {
              showMessage(state.message);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.1),
                      ClipRRect(
                        child: Image.asset(ImageAssets.logo),
                      ),
                      SizedBox(height: height * 0.08),
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter Email Address";
                          }
                          final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(text);
                          if (!emailValid) {
                            return "Please Enter a Valid Email Address";
                          }
                          return null;
                        },
                        controller: viewModel.userEmailController,
                        hintText: AppLocalizations.of(context)!.email,
                        prefixIcon: Image.asset(ImageAssets.iconEmail),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomTextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please enter Password";
                          }
                          if (text.length < 6) {
                            return "Please enter at least 6 characters";
                          }
                          return null;
                        },
                        controller: viewModel.passwordController,
                        maxLines: 1,
                        obscureText: true,
                        hintText: AppLocalizations.of(context)!.password,
                        prefixIcon: Image.asset(ImageAssets.iconPassword),
                      ),
                      SizedBox(height: height * 0.02),
                      Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(ForgetPassword.routename);
                          },
                          child: Text(
                            AppLocalizations.of(context)!.forget_password,
                            style: AppStyles.regular14Orange,
                          ),
                        ),
                      ),
                      CustomElevatedButton(
                        text: AppLocalizations.of(context)!.login,
                        center: true,
                        onPressed: () => viewModel.login(),
                        textStyle: AppStyles.regular20RobotoBlack,
                        backgroundColor: AppColor.orange,
                      ),
                      SizedBox(height: height * 0.02),
                      InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(RegisterScreen.routeName);
                        },
                        child: Text.rich(
                          textAlign: TextAlign.center,
                          TextSpan(
                            children: [
                              TextSpan(
                                text: AppLocalizations.of(context)!
                                    .dont_have_account,
                                style: AppStyles.regular16RobotoWhite,
                              ),
                              TextSpan(
                                text: AppLocalizations.of(context)!.create_one,
                                style: AppStyles.regular20Orange,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: width * .085),
                        child: Row(
                          children: [
                            const Expanded(
                                child: Divider(
                              thickness: 2,
                              endIndent: 20,
                              color: AppColor.orange,
                            )),
                            Text(
                              AppLocalizations.of(context)!.or,
                              style: AppStyles.regular14Orange,
                            ),
                            const Expanded(
                                child: Divider(
                                    thickness: 2,
                                    indent: 20,
                                    color: AppColor.orange)),
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02),
                      CustomElevatedButton(
                          prefixIconButton: Image.asset(ImageAssets.iconGoogle),
                          text: AppLocalizations.of(context)!.login_with_google,
                          center: true,
                          onPressed: () {}),
                      SizedBox(height: height * 0.02),
                      ToggleSwitch(
                        customWidgets: [
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(ImageAssets.usaIcon),
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Image.asset(ImageAssets.egIcon),
                          ),
                        ],
                        minWidth: 70.0,
                        borderColor: [AppColor.orange],
                        cornerRadius: 20.0,
                        activeBgColors: [
                          [AppColor.orange],
                          [AppColor.orange]
                        ],
                        activeFgColor: Colors.white,
                        inactiveBgColor: AppColor.black,
                        inactiveFgColor: Colors.white,
                        initialLabelIndex:
                            context.read<LanguageCubit>().currentLocale == 'en'
                                ? 0
                                : 1,
                        totalSwitches: 2,
                        radiusStyle: true,
                        onToggle: (index) {
                          if (index == 0) {
                            context.read<LanguageCubit>().changeLanguage("en");
                          } else {
                            context.read<LanguageCubit>().changeLanguage("ar");
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void hideLoading() {
    DialogUtils.hideLoading(context);
  }

  @override
  void navigateToScreen() {
    Navigator.of(context).pushReplacementNamed(HomeScreen.routename);
  }

  @override
  void showLoading(String message) {
    DialogUtils.showLoading(context: context, message: message);
  }

  @override
  void showMessage(String message) {
    DialogUtils.showMessage(context: context, message: message);
  }
}
