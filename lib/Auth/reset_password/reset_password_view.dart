import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/Auth/reset_password/reset_password_cubit/reset_password_interface.dart';
import 'package:movies/Auth/reset_password/reset_password_cubit/reset_password_states.dart';
import 'package:movies/Auth/reset_password/reset_password_cubit/reset_password_view_model.dart';

import '../../utils/app_styles.dart';
import '../../utils/colors.dart';
import '../../utils/dialog_utils.dart';
import '../../utils/imageassets.dart';
import '../../widget/custom_elevated_button.dart';
import '../../widget/custom_text_form_field.dart';

class ResetPassword extends StatefulWidget {
  static const String routeName = "Reset_password";

  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword>
    implements ResetPasswordInterface {
  late ResetPasswordViewModel resetPasswordViewModel;

  @override
  void initState() {
    super.initState();
    resetPasswordViewModel = ResetPasswordViewModel();
    resetPasswordViewModel.navigator = this;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => resetPasswordViewModel,
        child: BlocConsumer<ResetPasswordViewModel, ResetPasswordState>(
          listener: (context, state) {
            if (state is ResetSuccess) {
              showMessage(
                  AppLocalizations.of(context)!.password_updated_successfully);
            } else if (state is ResetFailure) {
              showMessage(state.message);
            }
          },
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(AppLocalizations.of(context)!.reset_password),
              ),
              body: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width * .04),
                child: Form(
                  key: resetPasswordViewModel.formKey,
                  child: Column(
                    children: [
                      Image.asset(ImageAssets.forgetImage),
                      SizedBox(
                        height: screenSize.height * 0.025,
                      ),
                      CustomTextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "Please Enter an old Password";
                          }
                          return null;
                        },
                        controller:
                            resetPasswordViewModel.oldPasswordController,
                            obscureText: true,
                            maxLines: 1,
                        style: AppStyles.regular16RobotoWhite,
                        hintText: AppLocalizations.of(context)!.password,
                        prefixIcon: Image.asset(ImageAssets.passIcon),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.025,
                      ),
                      CustomTextFormField(
                        validator: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return "Please enter a New Password";
                          }
                          if (text.length < 6) {
                            return "Please enter at least 6 characters";
                          }
                          if (text ==
                              resetPasswordViewModel
                                  .oldPasswordController.text) {
                            return "They mustn't be identical";
                          }
                          return null;
                        },
                        controller:
                            resetPasswordViewModel.newPasswordController,
                              obscureText: true,
                              maxLines: 1,
                        style: AppStyles.regular16RobotoWhite,
                        hintText: AppLocalizations.of(context)!.new_password,
                        prefixIcon: Image.asset(ImageAssets.passIcon),
                      ),
                      SizedBox(
                        height: screenSize.height * 0.025,
                      ),
                      CustomElevatedButton(
                          textStyle: AppStyles.regular20RobotoBlack,
                          backgroundColor: AppColor.orange,
                          text: AppLocalizations.of(context)!.reset_password,
                          center: true,
                          onPressed: () {
                            resetPasswordViewModel.resetPassword();
                          })
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }

  @override
  void hideLoading() {
    DialogUtils.hideLoading(context);
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
