import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';

import '../../utils/colors.dart';

class FavoriteDateTime extends StatelessWidget {
  String url;
  String number;

  FavoriteDateTime({required this.number, required this.url});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenSize.width * .02,
          vertical: screenSize.height * .001),
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * .04,
          vertical: screenSize.height * .01),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16), color: AppColor.grey),
      child: Row(
        spacing: screenSize.width * .04,
        children: [
          Image.asset(url),
          Text(
            number,
            style: AppStyles.bold24White,
          )
        ],
      ),
    );
    ;
  }
}
