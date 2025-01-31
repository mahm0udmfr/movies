import 'package:flutter/material.dart';

import '../utils/colors.dart';

class MoviesCategoryWidget extends StatelessWidget {
  String categoryName;
  bool isSelected;
  Color backgroundColor;
  TextStyle textSelectedStyle;
  TextStyle textUnSelectedStyle;

  MoviesCategoryWidget({
    required this.categoryName,
    required this.isSelected,
    required this.backgroundColor,
    required this.textSelectedStyle,
    required this.textUnSelectedStyle,
  });

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: screenSize.width * .023),
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * .035,
          vertical: screenSize.height * .01),
      decoration: BoxDecoration(
          color: isSelected ? backgroundColor : AppColor.transparent,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColor.orange, width: 3)),
      child: Text(
        categoryName,
        style: isSelected ? textSelectedStyle : textUnSelectedStyle,
      ),
    );
  }
}
