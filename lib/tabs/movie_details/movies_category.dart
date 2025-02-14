import 'package:flutter/material.dart';


import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';

class MoviesCategory extends StatelessWidget {
  String  genereName;

  MoviesCategory({super.key, required this.genereName});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.02,
          vertical: screenSize.height * .02),

      decoration: BoxDecoration(
      
          borderRadius: BorderRadius.circular(16), color: AppColor.grey),
      child: Text(
        genereName,  
        style: AppStyles.regular16RobotoWhite,
      ),
    );
  }
}
