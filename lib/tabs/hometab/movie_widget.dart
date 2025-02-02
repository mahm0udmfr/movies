import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';

class MovieWidget extends StatelessWidget {
  String imageUrl;
  String ratingText;
  MovieWidget({super.key, required this.imageUrl, required this.ratingText});

  @override
  Widget build(BuildContext context) {
        Size screenSize = MediaQuery.of(context).size;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Center(
                child: Icon(
              Icons.error,
              color: AppColor.red,
            )),
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
                ratingText,
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
    );
  }
}
