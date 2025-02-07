import 'package:flutter/material.dart';
import 'package:movies/profile/cubit/update_profile_view_model.dart';
import 'package:movies/profile/update_profile_bottom_sheet.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';
import 'package:movies/widget/custom_text_form_field.dart';

class Updateprofile extends StatefulWidget {
  static const String routename = "updateProfile";

  const Updateprofile({super.key});

  @override
  State<Updateprofile> createState() => _UpdateprofileState();
}

class _UpdateprofileState extends State<Updateprofile> {
  UpdateProfileViewModel viewModel = UpdateProfileViewModel();
  @override
  void initState() {
    viewModel.getUserDetails();
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
              hintText: "UserName",
              prefixIcon: Image.asset(ImageAssets.userIcon),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            CustomTextFormField(
              controller: viewModel.phoneNumber,
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
                  onPressed: () {},
                  backgroundColor: AppColor.red,
                  textStyle: AppStyles.regular20RobotoWhite,
                ),
                SizedBox(
                  height: screenSize.height * 0.02,
                ),
                CustomElevatedButton(
                  text: "Update Data",
                  center: true,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void showNewsBottomShhet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => UpdateProfileBottomSheet(),
    );
  }
}
