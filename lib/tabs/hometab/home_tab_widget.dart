import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/home_tab_model.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';

class HomeTabWidget extends StatelessWidget {
  List<Movie> availableNowList;

  HomeTabWidget({super.key, required this.availableNowList});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return CarouselSlider.builder(
        options: CarouselOptions(
            enlargeCenterPage: true, viewportFraction: 0.75, height: 351),
        itemCount: availableNowList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: availableNowList[itemIndex].mediumCoverImage,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.01,
                      vertical: screenSize.height * 0.006),
                  margin: EdgeInsets.symmetric(
                      horizontal: screenSize.width * 0.01,
                      vertical: screenSize.height * 0.006),
                  decoration: BoxDecoration(
                    color: AppColor.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        availableNowList[itemIndex].rating.toString(),
                        style: AppStyles.regular16RobotoWhite,
                      ),
                      SizedBox(
                        width: screenSize.width * 0.01,
                      ),
                      Image.asset(ImageAssets.star)
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
