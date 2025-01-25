import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';

import 'package:movies/onboarding/onboardinglist.dart';
// import 'package:movies/services.dart';
import 'package:movies/widget/custom_elevated_button.dart';

class OnBoarding extends StatefulWidget {
  static const String routename = "onboarding";
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => OnBoardingState();
}

class OnBoardingState extends State<OnBoarding> {
  final PageController pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: onBoardingList.length,
              itemBuilder: (context, i) => Stack(
                children: [
                  Image.asset(
                    onBoardingList[i].backGroundImage!,
                    width: screenSize.width,
                    height: screenSize.height,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: i == 0
                          ?BoxDecoration(color: AppColor.transparent) : BoxDecoration(
                              color: AppColor.black,
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(35),
                                  topLeft: Radius.circular(35)))
                          ,
                      child: Column(
                        children: [
                          Text(
                            onBoardingList[i].title!,
                            style:i==0?AppStyles.medium36White: AppStyles.bold24White,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: screenSize.height * 0.01,
                          ),
                          onBoardingList[i].bodyText != null
                              ? Text(
                                  onBoardingList[i].bodyText!,
                                  style: AppStyles.regular20White,
                                  textAlign: TextAlign.center,
                                )
                              : SizedBox(),
                          SizedBox(
                            height: screenSize.height * 0.01,
                          ),
                          CustomElevatedButton(
                            text: onBoardingList[i].button1Text ?? "",
                            center: true,
                            textStyle: AppStyles.semiBold20Black,
                            backgroundColor: AppColor.orange,
                            onPressed: () {
                              nextPage();
                            },
                          ),
                          SizedBox(
                            height: screenSize.height * 0.01,
                          ),
                          onBoardingList[i].button2Text != null
                              ? CustomElevatedButton(
                                  text: onBoardingList[i].button2Text ?? "",
                                  center: true,
                                  onPressed: () {
                                    reversePage();
                                  },
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void nextPage() {
    setState(() {
      if (currentPage < onBoardingList.length - 1) {
        currentPage++;
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOut,
        );
      } else {
        //this will make the step in myservices as 1 and 
        //this will skip the onboarding screen the next time the user opens the applecation
        
        // MyServices.setString('step', '1');
        // Navigator.of(context).pushReplacementNamed(LoginScreen.routename);
      }
    });
  }

  void reversePage() {
    setState(() {
      if (currentPage > 0) {
        currentPage--;
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 900),
          curve: Curves.easeInOut,
        );
      }
    });
  }
}
