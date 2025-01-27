import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';
import 'package:movies/widget/custom_text_form_field.dart';

class ForgetPassword extends StatelessWidget {
  static const String routename = 'forgetpassword';

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height ;
    var width = MediaQuery.of(context).size.width ;
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(ImageAssets.forgetImage),
            SizedBox(height: height* 0.025,),
            CustomTextFormField(
              style: AppStyles.regular16RobotoWhite,
              hintText: "Email",
              prefixIcon: Image.asset(ImageAssets.emailIcon) ,
            ),
            SizedBox(height: height*0.025,),
            CustomElevatedButton(
              textStyle: AppStyles.regular20RobotoBlack,
              backgroundColor: AppColor.orange,
                text: "Verify Email",
                center: true,
                onPressed: (){}
            )
          ],
        ),
      ),
    );
  }
}
