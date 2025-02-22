import 'package:flutter/material.dart';

import '../../utils/app_styles.dart';
import '../../utils/colors.dart';
import '../../utils/imageassets.dart';

class Movieslist extends StatelessWidget {
  String? imagePath;
  String? rating;

  String? name;

  Movieslist({super.key, this.imagePath, this.name,required this.rating});
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: screenSize.width * .018,
          vertical: screenSize.height * .006),
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
            image: NetworkImage(imagePath ?? ImageAssets.adelShakal),
            fit: BoxFit.fill),
      ),
      child: Container(
        decoration: BoxDecoration(
            color: AppColor.blackWithObacity,
            borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * .019,
            vertical: screenSize.height * .004),
        margin: EdgeInsets.symmetric(
            horizontal: screenSize.width * .028,
            vertical: screenSize.height * .009),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "$rating",
              style: AppStyles.regular16RobotoWhite,
            ),
            Icon(
              Icons.star,
              color: AppColor.orange,
            )
          ],
        ),
      ),
    );
  }
}
