import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/home_tab_model.dart';
import 'package:movies/tabs/hometab/movie_widget.dart';
import 'package:movies/tabs/movie_details/cubit/movie_details_view_model.dart';
import 'package:movies/tabs/movie_details/movie_details.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';

class HomeTabWidget extends StatefulWidget {
  final List<Movies> availableNowList;

  const HomeTabWidget({super.key, required this.availableNowList});

  @override
  HomeTabWidgetState createState() => HomeTabWidgetState();
}

class HomeTabWidgetState extends State<HomeTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl:
              widget.availableNowList[selectedIndex].mediumCoverImage ?? "",
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(value: downloadProgress.progress),
          errorWidget: (context, url, error) =>
              Icon(Icons.error, color: AppColor.white), // Show error icon
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                AppColor.black,
                AppColor.darkGrey,
                AppColor.transparent,
              ],
            ),
          ),
        ),
        Column(
          children: [
            Image.asset(ImageAssets.availableNow, height: 93),
            CarouselSlider.builder(
              options: CarouselOptions(
                enlargeCenterPage: true,
                viewportFraction: 0.68,
                height: 351,
                onPageChanged: (index, reason) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              itemCount: widget.availableNowList.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: MovieWidget(
                    onTap: () {
                      MovieDetailsViewModel.instance.getMovieById(
                          widget.availableNowList[itemIndex].id!.toString());
                      Navigator.of(context).pushNamed(
                        MovieDetailsScreen.routeName,
                      );
                    },
                    imageUrl:
                        widget.availableNowList[itemIndex].mediumCoverImage ??
                            "",
                    ratingText:
                        widget.availableNowList[itemIndex].rating.toString(),
                  ),
                );
              },
            ),
            Image.asset(ImageAssets.watchNow, height: 146),
          ],
        ),
      ],
    );
  }
}
