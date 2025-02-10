import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';

class MoviesCategory extends StatelessWidget {
  String category;

  MoviesCategory({required this.category});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.055,
          vertical: screenSize.height * .02),
      margin: EdgeInsets.symmetric(
        horizontal: screenSize.width * 0.03,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColor.grey),
      child: Text(
        category,
        style: AppStyles.regular16RobotoWhite,
      ),
    );
  }
}
