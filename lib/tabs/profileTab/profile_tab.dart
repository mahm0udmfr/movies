import 'package:flutter/material.dart';
import 'package:movies/tabs/profileTab/tabs_profile_tab.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';

class ProfileTab extends StatefulWidget {
  static const String routeName = 'profileTab';

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<String> tapNameList = [
      'Watch List',
      'History'
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            height: height*0.41,
            color: AppColor.grey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width*0.05,right:width*0.05 ,top:height*0.05,bottom: height*0.024 ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Image.asset(ImageAssets.avatar1),
                            SizedBox(height: height*0.01,),
                            Text("name",style: AppStyles.regular20RobotoWhite,)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("0",style: AppStyles.bold24RobotoWhite,),
                            Text("Wish List",style: AppStyles.bold24RobotoWhite)
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text("0",style: AppStyles.bold24RobotoWhite,),
                            Text("History",style: AppStyles.bold24RobotoWhite,)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*0.03),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              backgroundColor: AppColor.orange,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.11,
                                  vertical: height * 0.015)),
                        onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Edit Profile',style: AppStyles.regular20RobotoBlack,),
                            ],
                          ),
                            ),
                      ),
                      SizedBox(width: width*0.02,),
                      Expanded(
                        flex: 2,
                        child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              backgroundColor: AppColor.red,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04,
                                  vertical: height * 0.015)),
                          onPressed: (){},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Exit',style: AppStyles.regular20RobotoWhite,),
                              SizedBox(width: width*0.01,),
                              Image.asset(ImageAssets.exitIcon)
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                DefaultTabController(
                    length: 2,
                    child: Expanded(
                      child: TabBar(

                        onTap: (index){
                          selectedIndex = index;
                          setState(() {

                          });
                        },
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: AppColor.transparent,
                          tabs: [
                            TabsProfileTab(tabName: 'Watch List', image: ImageAssets.drawerIcon),
                            TabsProfileTab(tabName: 'History', image: ImageAssets.folderIcon)
                          ]
                      ),
                    )
                )
              ],
            ),
          ),
          Column(
            children: [
              Center(heightFactor: 4,
                child:Image.asset(ImageAssets.popcornImage),)
            ],
          )
        ],
      ),
    );
  }
}