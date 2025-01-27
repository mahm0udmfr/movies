import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';
import 'package:movies/widget/custom_text_form_field.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";
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

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_sharp),
        title: Text(
          "Register",
          style: AppStyles.regular16RobotoOrange,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(width * .025),
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
                    onPageChanged: (index, carouselPageChangedReason) {},
                    scrollDirection: Axis.horizontal,
                  )),
              Text(
                "Avatar",
                style: AppStyles.regular16RobotoWhite,
              ),
              CustomTextFormField(
                hintText: "Name",
                hintStyle: AppStyles.regular16RobotoWhite,
                prefixIcon: Image(image: AssetImage(ImageAssets.nameIcon)),
              ),
              CustomTextFormField(
                keyboardType: TextInputType.emailAddress,
                hintText: "Email",
                hintStyle: AppStyles.regular16RobotoWhite,
                prefixIcon: Image(image: AssetImage(ImageAssets.emailIcon)),
              ),
              CustomTextFormField(
                maxLines: 1,
                obscureText: true,
                suffixIcon: Image(image: AssetImage(ImageAssets.hidePassIcon)),
                hintText: "Password",
                hintStyle: AppStyles.regular16RobotoWhite,
                prefixIcon: Image(image: AssetImage(ImageAssets.passIcon)),
              ),
              CustomTextFormField(
                maxLines: 1,
                obscureText: true,
                suffixIcon: Image(image: AssetImage(ImageAssets.hidePassIcon)),
                hintText: "Confirm Password",
                hintStyle: AppStyles.regular16RobotoWhite,
                prefixIcon: Image(image: AssetImage(ImageAssets.passIcon)),
              ),
              CustomTextFormField(
                keyboardType: TextInputType.number,
                hintText: "Phone Number",
                hintStyle: AppStyles.regular16RobotoWhite,
                prefixIcon: Image(image: AssetImage(ImageAssets.phoneIcon)),
              ),
              CustomElevatedButton(
                  textStyle: AppStyles.regular20RobotoBlack,
                  backgroundColor: AppColor.orange,
                  text: "Create Account",
                  center: true,
                  onPressed: () {}),
              Row(
                spacing: 0,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already Have Account ? ",
                    style: AppStyles.regular14RobotoWhite,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "Login",
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
                    border: Border.all(color: AppColor.orange, width: 2)),
                child: ToggleSwitch(
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
                  initialLabelIndex: 1,
                  totalSwitches: 2,
                  radiusStyle: true,
                  onToggle: (index) {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
