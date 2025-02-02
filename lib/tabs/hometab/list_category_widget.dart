import 'package:flutter/material.dart';
import 'package:movies/model/home_tab_model.dart';
import 'package:movies/tabs/hometab/movie_widget.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';

class ListCategoryWidget extends StatefulWidget {
  final List<Movie> availableNowList;

  const ListCategoryWidget({super.key, required this.availableNowList});

  @override
  ListCategoryWidgetState createState() => ListCategoryWidgetState();
}

class ListCategoryWidgetState extends State<ListCategoryWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Action',
              style: AppStyles.regular20RobotoWhite,
            ),
            InkWell(
              onTap: () {
                // Implement "See More" functionality here
              },
              child: Row(
                children: [
                  Text(
                    'See More',
                    style: AppStyles.regular16RobotoOrange,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: AppColor.orange,
                    size: 15,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: screenSize.height * 0.25,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(width: screenSize.width * 0.05),
            itemCount: widget.availableNowList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return MovieWidget(
                imageUrl: widget.availableNowList[index].mediumCoverImage,
                ratingText: widget.availableNowList[index].rating.toString(),
              );
            },
          ),
        ),
      ],
    );
  }
}
