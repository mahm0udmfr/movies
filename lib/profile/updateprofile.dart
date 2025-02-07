import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/profile/cubit/update_profile_interface.dart';
import 'package:movies/profile/cubit/update_profile_state.dart';
import 'package:movies/profile/cubit/update_profile_view_model.dart';
import 'package:movies/profile/update_profile_bottom_sheet.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/dialog_utils.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';
import 'package:movies/widget/custom_text_form_field.dart';

class Updateprofile extends StatefulWidget {
  static const String routename = "updateProfile";

  const Updateprofile({super.key});

  @override
  State<Updateprofile> createState() => _UpdateprofileState();
}

class _UpdateprofileState extends State<Updateprofile>
    implements UpdateProfileInterface {
  UpdateProfileViewModel viewModel = UpdateProfileViewModel();
  @override
  void initState() {
    viewModel.getUserDetails();
    viewModel.navigator = this;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Pick Avatar"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenSize.width * 0.03,
              vertical: screenSize.height * 0.01),
          child: BlocProvider(
            create: (context) => viewModel,
            child: BlocConsumer<UpdateProfileViewModel, UpdateProfileState>(
                listener: (context, state) {
              if (state is UpdateProfileSuccessState) {
                showMessage("Profile Updated Successfully");
                navigateToScreen();
              } else if (state is UpdateProfileErrorState) {
                showMessage(state.message);
              }
            }, builder: (context, state) {
              return Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: InkWell(
                        onTap: () {
                          showNewsBottomShhet(context);
                        },
                        child: ClipRRect(
                          child: Image.asset(viewModel.currentAvatar),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    CustomTextFormField(
                      controller: viewModel.userName,
                      validator: (text) {
                        if (viewModel.userName.text.isEmpty) {
                          return "Please Enter a name";
                        } else {
                          return null;
                        }
                      },
                      hintText: "UserName",
                      prefixIcon: Image.asset(ImageAssets.userIcon),
                    ),
                    SizedBox(
                      height: screenSize.height * 0.02,
                    ),
                    CustomTextFormField(
                        controller: viewModel.phoneNumber,
                        validator: (text) {
                          if (viewModel.phoneNumber.text.isEmpty) {
                            return "Please Enter Phone Number";
                          } else {
                            return null;
                          }
                        },
                        hintText: "Phone",
                        prefixIcon: Image.asset(ImageAssets.phoneIcon)),
                    SizedBox(
                      height: screenSize.height * 0.03,
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Reset Password",
                          style: AppStyles.regular20RobotoWhite,
                        )),
                    Spacer(),
                    Column(
                      children: [
                        CustomElevatedButton(
                          text: "Delete Account",
                          center: true,
                          onPressed: () {
                            showMessageYesNo("Are You Sure!!");
                          },
                          backgroundColor: AppColor.red,
                          textStyle: AppStyles.regular20RobotoWhite,
                        ),
                        SizedBox(
                          height: screenSize.height * 0.02,
                        ),
                        CustomElevatedButton(
                          text: "Update Data",
                          center: true,
                          onPressed: () {
                            viewModel.updateProfile();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }),
          ),
        ));
  }

  void showNewsBottomShhet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => UpdateProfileBottomSheet(),
    );
  }

  @override
  void hideLoading() {
    DialogUtils.hideLoading(context);
  }

  @override
  void navigateToScreen() {
    Navigator.pop(context);
  }

  @override
  void showLoading(String message) {
    DialogUtils.showLoading(context: context, message: message);
  }

  @override
  void showMessage(String message) {
    DialogUtils.showMessage(context: context, message: message);
  }

  @override
  void showMessageYesNo(String message) {
    DialogUtils.showMessage(
        context: context,
        message: message,
        negAction: () {
          Navigator.pop(context);
        },
        negActionName: "No",
        posActionName: "Yes",
        posAction: () {
          viewModel.deleteProfile();
        });
  }

  @override
  void exitApp() {
    exit(0);
  }
}
