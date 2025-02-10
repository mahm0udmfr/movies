import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';

class ActorsDetails extends StatelessWidget {
  const ActorsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * .03,
          vertical: screenSize.height * .016),
      margin: EdgeInsets.only(bottom: screenSize.height * 0.014),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.grey,
      ),
      child: Row(
        children: [
          Image.asset(ImageAssets.castImage),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name : Hayley Atwell",
                style: AppStyles.regular20RobotoWhite,
              ),
              Text(
                "Character : Captain Carter",
                style: AppStyles.regular20RobotoWhite,
              ),
            ],
          )
        ],
      ),
    );
  }
}
