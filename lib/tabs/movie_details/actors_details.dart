import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/model/movie_details_model.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';

class ActorsDetails extends StatelessWidget {
  Cast cast;
  ActorsDetails({super.key, required this.cast});

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
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: CachedNetworkImage(
              imageUrl: cast.urlSmallImage ?? "",
              fit: BoxFit.fill,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) =>
                  Icon(Icons.error, color: AppColor.white), // Show error icon
            ),
          ),
          SizedBox(
            width: screenSize.width * .03,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Name : ${cast.name}",
                  style: AppStyles.regular20RobotoWhite,
                ),
                Text(
                  "Character : ${cast.characterName}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                  style: AppStyles.regular20RobotoWhite,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
