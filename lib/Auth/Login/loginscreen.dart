import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/Auth/forget_password/forget_password.dart';
import 'package:movies/Auth/register/register_screen.dart';
import 'package:movies/cubit/language_cubit.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';
import 'package:movies/widget/custom_text_form_field.dart';
import 'package:toggle_switch/toggle_switch.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "loginscreen";

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.1,
              ),
              ClipRRect(
                  child: Image.asset(
                ImageAssets.logo,
              )),
              SizedBox(
                height: height * 0.08,
              ),

              ///todo:firebase auth
              CustomTextFormField(
                hintText: AppLocalizations.of(context)!.email,
                prefixIcon: Image.asset(
                  ImageAssets.iconEmail,
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              CustomTextFormField(
                maxLines: 1,
                obscureText: true,
                hintText: AppLocalizations.of(context)!.password, //"Password",
                prefixIcon: Image.asset(
                  ImageAssets.iconPassword,
                ),
              ),

              SizedBox(
                height: height * 0.02,
              ),

              ///todo: handel logic
              Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(ForgetPassword.routename);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.forget_password,
                        //"Forget Password",
                        style: AppStyles.regular14Orange,
                      ))),
              CustomElevatedButton(
                text: AppLocalizations.of(context)!.login,
                center: true,
                onPressed: () {},
                textStyle: AppStyles.regular20RobotoBlack,
                backgroundColor: AppColor.orange,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(RegisterScreen.routeName);
                },
                child: Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(children: [
                      TextSpan(
                          text: AppLocalizations.of(context)!.dont_have_account,
                          style: AppStyles.regular16RobotoWhite),
                      TextSpan(
                          text: AppLocalizations.of(context)!.create_one,
                          style: AppStyles.bold20Orange),
                    ])),
              ),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      endIndent: 20,
                      indent: 10,
                      color: AppColor.orange,
                    ),
                  ),
                  Text(
                    AppLocalizations.of(context)!.or,
                    style: AppStyles.bold20Orange,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 2,
                      color: AppColor.orange,
                      endIndent: 20,
                      indent: 10,
                    ),
                  ),
                ],
              ),
              CustomElevatedButton(
                prefixIconButton: Image.asset(ImageAssets.iconGoogle),
                text: AppLocalizations.of(context)!.login_with_google,
                center: true,
                onPressed: () {},
                textStyle: AppStyles.regular20RobotoBlack,
                backgroundColor: AppColor.orange,
              ),
              SizedBox(
                height: height * 0.02,
              ),

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
                    context.read<LanguageCubit>().currentLocale == 'en' ? 0 : 1,
                totalSwitches: 2,
                radiusStyle: true,
                onToggle: (index) {
                  if (index == 0) {
                    context.read<LanguageCubit>().changeLanguage("en");
                  } else if (index == 1) {
                    context.read<LanguageCubit>().changeLanguage("ar");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}