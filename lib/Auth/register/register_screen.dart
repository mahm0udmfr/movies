import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/Auth/Login/loginscreen.dart';
import 'package:movies/Auth/register/cubit/register_interface.dart';
import 'package:movies/Auth/register/cubit/register_screen_state.dart';
import 'package:movies/cubit/language_cubit.dart';
import 'package:movies/cubit/language_state.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';
import 'package:movies/widget/custom_text_form_field.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../utils/dialog_utils.dart';
import 'cubit/register_screen_view_model.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "RegisterScreen";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    implements RegisterInterface {
  late RegisterScreenViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = RegisterScreenViewModel();
    viewModel.navigator = this;
  }

  List<Widget> avatars = [
    Image.asset(ImageAssets.avatar1),
    Image.asset(ImageAssets.avatar2),
    Image.asset(ImageAssets.avatar3),
    Image.asset(ImageAssets.avatar4),
    Image.asset(ImageAssets.avatar5),
    Image.asset(ImageAssets.avatar6),
    Image.asset(ImageAssets.avatar7),
    Image.asset(ImageAssets.avatar8),
    Image.asset(ImageAssets.avatar9),
  ];

  @override
  Widget build(BuildContext context) {
    // LanguageCubit languageCubit = LanguageCubit();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return BlocProvider(
      create: (context) => viewModel,
      child: BlocConsumer<RegisterScreenViewModel, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            navigateToScreen();
          } else if (state is RegisterFailure) {
            showMessage(state.message);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                AppLocalizations.of(context)!.register,
                style: AppStyles.regular16RobotoOrange,
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(width * .025),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    spacing: height * .013,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CarouselSlider(
                          items: avatars,
                          options: CarouselOptions(
                            height: height * .15,
                            aspectRatio: 16 / 9,
                            viewportFraction: 0.3,
                            initialPage: 0,
                            enableInfiniteScroll: true,
                            reverse: false,
                            // autoPlay: true,
                            // autoPlayInterval: Duration(seconds: 3),
                            // autoPlayAnimationDuration: Duration(milliseconds: 800),
                            // autoPlayCurve: Curves.fastOutSlowIn,
                            enlargeCenterPage: true,
                            enlargeFactor: 0.45,
                            onPageChanged: (index, carouselPageChangedReason) {
                              viewModel.selectAvatar(index + 1);
                            },
                            scrollDirection: Axis.horizontal,
                          )),
                      Text(
                        AppLocalizations.of(context)!.avatar,
                        style: AppStyles.regular16RobotoWhite,
                      ),
                      CustomTextFormField(
                        hintText: AppLocalizations.of(context)!.name,
                        hintStyle: AppStyles.regular16RobotoWhite,
                        prefixIcon:
                            Image(image: AssetImage(ImageAssets.nameIcon)),
                        controller: viewModel.userNameController,
                        validator: (text) {
                          if (viewModel.userNameController.text.isEmpty) {
                            return "Please Enter your name";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomTextFormField(
                        keyboardType: TextInputType.emailAddress,
                        hintText: AppLocalizations.of(context)!.email,
                        hintStyle: AppStyles.regular16RobotoWhite,
                        prefixIcon:
                            Image(image: AssetImage(ImageAssets.emailIcon)),
                        controller: viewModel.userEmailController,
                        validator: (text) {
                          if (viewModel.userEmailController.text.isEmpty) {
                            return "Please Enter Email Address";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomTextFormField(
                        maxLines: 1,
                        obscureText: true,
                        suffixIcon:
                            Image(image: AssetImage(ImageAssets.hidePassIcon)),
                        hintText: AppLocalizations.of(context)!.password,
                        hintStyle: AppStyles.regular16RobotoWhite,
                        prefixIcon:
                            Image(image: AssetImage(ImageAssets.passIcon)),
                        controller: viewModel.passwordController,
                        validator: (text) {
                          if (viewModel.passwordController.text.isEmpty) {
                            return "Please Enter Password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomTextFormField(
                        maxLines: 1,
                        obscureText: true,
                        suffixIcon:
                            Image(image: AssetImage(ImageAssets.hidePassIcon)),
                        hintText:
                            AppLocalizations.of(context)!.confirm_password,
                        hintStyle: AppStyles.regular16RobotoWhite,
                        prefixIcon:
                            Image(image: AssetImage(ImageAssets.passIcon)),
                        controller: viewModel.confirmPasswordController,
                        validator: (text) {
                          if (viewModel
                              .confirmPasswordController.text.isEmpty) {
                            return "Please Enter Confirm Password";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomTextFormField(
                        keyboardType: TextInputType.number,
                        hintText: AppLocalizations.of(context)!.phone_number,
                        hintStyle: AppStyles.regular16RobotoWhite,
                        prefixIcon: Image.asset(ImageAssets.phoneIcon),
                        controller: viewModel.phoneController,
                        // controller: viewModel.n,
                        validator: (text) {
                          if (viewModel.phoneController.text.isEmpty) {
                            return "Please Enter Phone Number";
                          } else {
                            return null;
                          }
                        },
                      ),
                      CustomElevatedButton(
                          textStyle: AppStyles.regular20RobotoBlack,
                          backgroundColor: AppColor.orange,
                          text: AppLocalizations.of(context)!.create_account,
                          center: true,
                          onPressed: () {
                            if (viewModel.formKey.currentState!.validate()) {
                              BlocProvider.of<RegisterScreenViewModel>(context)
                                  .register();
                            }
                          }),
                      Row(
                        spacing: 0,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.already_have_account,
                            style: AppStyles.regular14RobotoWhite,
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                AppLocalizations.of(context)!.login,
                                style: AppStyles.regular14Orange,
                              ))
                        ],
                      ),
                      // InkWell(
                      //   onTap: (){},
                      //   child: Text.rich(TextSpan(
                      //     children: [
                      //       TextSpan(text: "Already Have Account ?" ,style: AppStyles.regular14RobotoWhite, ),
                      //       TextSpan(text: "Login",style: AppStyles.regular14Orange,)
                      //     ]
                      //   )),
                      // ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            border:
                                Border.all(color: AppColor.orange, width: 2)),
                        child: BlocBuilder<LanguageCubit, LanguageState>(
                          builder: (context, state) {
                            var languageCubit = context.read<LanguageCubit>();
                            return ToggleSwitch(
                              animate: true,
                              customWidgets: [
                                Image(image: AssetImage(ImageAssets.egIcon)),
                                Image(image: AssetImage(ImageAssets.usaIcon)),
                              ],
                              minWidth: 55.0,
                              cornerRadius: 30.0,
                              activeBgColors: [
                                [AppColor.orange],
                                [AppColor.orange]
                              ],
                              // activeFgColor: Colors.white,
                              inactiveBgColor: AppColor.black,
                              // inactiveFgColor: Colors.white,
                              initialLabelIndex:
                                  languageCubit.currentLocale == "en" ? 1 : 0,
                              totalSwitches: 2,
                              radiusStyle: true,
                              onToggle: (index) {
                                var languageCubit =
                                    context.read<LanguageCubit>();
                                if (index == 0) {
                                  languageCubit.changeLanguage("ar");
                                } else {
                                  languageCubit.changeLanguage("en");
                                }
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  void hideLoading() {
    DialogUtils.hideLoading(context);
  }

  @override
  void navigateToScreen() {
    Navigator.of(context).pushNamed(LoginScreen.routeName);
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
