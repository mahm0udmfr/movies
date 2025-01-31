import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';
import 'package:movies/widget/custom_text_form_field.dart';

class ForgetPassword extends StatelessWidget {
  static const String routename = 'forgetpassword';

  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.forget_password),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(ImageAssets.forgetImage),
            SizedBox(
              height: height * 0.025,
            ),
            CustomTextFormField(
              style: AppStyles.regular16RobotoWhite,
              hintText: AppLocalizations.of(context)!.email,
              prefixIcon: Image.asset(ImageAssets.emailIcon),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            CustomElevatedButton(
                textStyle: AppStyles.regular20RobotoBlack,
                backgroundColor: AppColor.orange,
                text: AppLocalizations.of(context)!.verify_email,
                center: true,
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
