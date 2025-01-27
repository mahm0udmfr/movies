import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';

import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomElevatedButton extends StatelessWidget {
  String text;
  Widget? secondwidgetUnderText;
  Color? backgroundColor;
  Widget? prefixIconButton;
  Widget? suffixIconButton;
  bool center = true;
  void Function()? onPressed;
  TextStyle? textStyle;
  CustomElevatedButton(
      {super.key,
      required this.text,
      this.backgroundColor,
      this.prefixIconButton,
      required this.center,
      required this.onPressed,
      this.textStyle,
      this.suffixIconButton,
      this.secondwidgetUnderText});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                ),
            backgroundColor: backgroundColor ?? AppColor.orange,
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.04,
                vertical: screenSize.height * 0.019)),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment:
              center ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            prefixIconButton ?? SizedBox(),
            SizedBox(
              width: screenSize.width * 0.02,
            ),
            Text(text, style: textStyle ?? AppStyles.regular20RobotoBlack),
            center ? SizedBox() : Spacer(),
            suffixIconButton ?? SizedBox(),
          ],
        ));
  }
}
