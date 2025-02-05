
import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';

class TabsProfileTab extends StatelessWidget {
  String tabName ;
  String image ;
  TabsProfileTab({required this.tabName,required this.image});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: height*0.035),
        child: Column(
          children: [
            Image.asset(image),
            SizedBox(height: height*0.01,),
            Text(tabName,style: AppStyles.regular20RobotoWhite,)
          ],
        ),
      ),
    );
  }
}
