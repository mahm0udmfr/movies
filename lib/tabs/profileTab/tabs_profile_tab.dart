
import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/imageassets.dart';

class TabsProfileTab extends StatelessWidget {
  String image ;
  String text ;
  TabsProfileTab({required this.text,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(image),
          Text(text,style: AppStyles.regular20RobotoWhite,)
        ],
      ),
    );
  }
}
