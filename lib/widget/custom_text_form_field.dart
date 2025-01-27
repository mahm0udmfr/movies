import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  Color? borderColor;
  String? hintText;
  Widget? prefixIcon;
  Widget? suffixIcon;
  TextStyle? hintStyle;
  TextStyle? style;
  bool obscureText;
  int? maxLines;
  Color? filledColor;
  bool? isFilled;
  String? Function(String?)? validator;
  TextEditingController? controller;
  TextInputType? keyboardType;
  CustomTextFormField(
      {super.key,
      this.borderColor,
      required this.hintText,
      this.hintStyle,
      this.prefixIcon,
      this.suffixIcon,
      this.style,
      this.obscureText = false,
      this.maxLines,
      this.validator,
      this.controller,
      this.keyboardType,
      this.filledColor,
      this.isFilled});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLines: maxLines,
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: "*",
      cursorColor: AppColor.black,
      style: style ??
        AppStyles.regular16RobotoWhite,
      decoration: InputDecoration(
        filled: isFilled ?? true,
        fillColor: filledColor ?? AppColor.darkGrey,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: borderColor ?? AppColor.black, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: borderColor ?? AppColor.black, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColor.black, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColor.black, width: 2),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle ??
              AppStyles.regular16RobotoWhite),
    );
  }
}
