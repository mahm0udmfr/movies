import 'package:flutter/material.dart';
import 'package:movies/tabs/profileTab/tabs_profile_tab.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';

class ProfileTab extends StatelessWidget {
  static const String routeName = 'profileTab';


  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        height: height*0.34,
        color: AppColor.grey,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width*0.05,right:width*0.05 ,top:height*0.05 ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Image.asset(ImageAssets.avatar1),
                        Text("data",style: AppStyles.regular20RobotoWhite,)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("data",style: AppStyles.bold24RobotoWhite,),
                        Text("data",style: AppStyles.bold24RobotoWhite)
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text("data",style: AppStyles.bold24RobotoWhite,),
                        Text("data",style: AppStyles.bold24RobotoWhite,)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Container(),
                Container()
            ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    // Image.asset(ImageAssets.phoneIcon),
                    Text("data"),
                  ],
                ),
                Column(
                  children: [
                    Image.asset(ImageAssets.emailIcon),
                    Text("data",style: AppStyles.regular20RobotoWhite,),
                  ],
                ),
              ],
            ),
            DefaultTabController(

                length: 2,
                child: TabBar(
                  dividerColor: AppColor.transparent,
                    tabs: [
                      TabsProfileTab(text: "text", image: ImageAssets.drawerIcon ),
                      TabsProfileTab(text: "text", image: ImageAssets.folderIcon )


                    ]
                )
            )
          ],
        ),
      ),
    );
  }
}
