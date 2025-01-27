import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';

//ignore: must_be_immutable
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
      cursorColor: AppColor.white,
      style: style ??
        AppStyles.regular20RobotoWhite,
      decoration: InputDecoration(


fillColor: AppColor.grey,
filled: true,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: borderColor ?? AppColor.grey, width: 2),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(color: borderColor ?? AppColor.grey, width: 2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColor.grey, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: AppColor.grey, width: 2),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          hintStyle: hintStyle ??
              AppStyles.regular16RobotoWhite),
    );
  }
}
//

//MY textField
// class CustomTextFiled extends StatelessWidget {
//   Color? bordercolor;
//   String hintText;
//   String? labelText;
//   TextStyle? labelStyle;
//   TextStyle? hintStyle;
//   TextStyle? style;
//   Widget? prefixIcon;
//   Widget? suffixIcon;
//   bool? obscureText;
//   int? maxLines;
//   TextInputType? keyboardType;
//   String? Function(String?)? validator;
//   TextEditingController? controller;
//
//   CustomTextFiled(
//       {this.bordercolor,
//         this.keyboardType=TextInputType.text,
//         this.controller,
//         this.validator,
//         required this.hintText,
//         this.labelText,
//         this.hintStyle,
//         this.prefixIcon,
//         this.suffixIcon,
//         this.labelStyle,
//         this.style,
//         this.obscureText,
//         this.maxLines});
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//
//       keyboardType: keyboardType,
//       controller: controller,
//       validator: validator,
//       maxLines: maxLines ?? 1,
//       obscureText: obscureText ?? false,
//       style: style ?? AppStyles.bold20Orange,
//       cursorColor: AppColor.black,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: AppColor.TextFieldgrey,
//           suffixIcon: suffixIcon,
//           prefixIcon: prefixIcon,
//           hintText: hintText,
//           hintStyle: hintStyle ?? AppStyles.regular16RobotoWhite,
//           labelText: labelText,
//           labelStyle: labelStyle,
//           enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide:
//               BorderSide(color: bordercolor ?? AppColor.transparent, width: 2)),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide:
//               BorderSide(color: bordercolor ?? AppColor.grey, width: 2)),
//           errorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide: BorderSide(color: AppColor.orange, width: 2)),
//           focusedErrorBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(16),
//               borderSide: BorderSide(color: AppColor.orange, width: 2))),
//     );
//   }
// }
