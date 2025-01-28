import 'package:flutter/material.dart';
import 'package:movies/profile/update_profile_bottom_sheet.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';
import 'package:movies/widget/custom_text_form_field.dart';

class Updateprofile extends StatelessWidget {
  static const String routename = "Updateprofile";
  const Updateprofile({super.key});

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
                  child: Image.asset(ImageAssets.avatar1),
                ),
              ),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            CustomTextFormField(
              hintText: "UserName",
              prefixIcon: Image.asset(ImageAssets.userIcon),
            ),
            SizedBox(
              height: screenSize.height * 0.02,
            ),
            CustomTextFormField(
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
                  text: "Delete Account",
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
