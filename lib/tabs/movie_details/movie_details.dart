import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/tabs/browse_screen/movies_list.dart';
import 'package:movies/tabs/movie_details/actors_details.dart';
import 'package:movies/tabs/movie_details/favorite_date_time.dart';
import 'package:movies/tabs/movie_details/movies_category.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';

class MovieDetails extends StatelessWidget {
  static const String routeName = "Movie_details";

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          spacing: screenSize.height * .02,
          children: [
            Container(
              alignment: Alignment.center,
              height: screenSize.height * .6,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageAssets.splash1),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenSize.width * .02,
                      vertical: screenSize.width * .02,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(ImageAssets.arrowBack),
                        Image.asset(ImageAssets.saveMovie)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenSize.height * .14,
                  ),
                  Image.asset(ImageAssets.moviePlay),
                  Spacer(),
                  Text(
                    "Movie Name",
                    style: AppStyles.bold24RobotoWhite,
                  ),
                  Text(
                    "movie year",
                    style: AppStyles.bold24White,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenSize.width * .02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: screenSize.height * .02,
                children: [
                  CustomElevatedButton(
                      backgroundColor: AppColor.red,
                      textStyle: AppStyles.bold20white,
                      text: "Watch",
                      center: true,
                      onPressed: () {}),
                  Row(
                    children: [
                      FavoriteDateTime(
                          number: "7.5", url: ImageAssets.yellowFavorite),
                      FavoriteDateTime(
                          number: "7.5", url: ImageAssets.movieTime),
                      FavoriteDateTime(
                          number: "7.5", url: ImageAssets.movieRate),
                    ],
                  ),
                  titleText("Screen Shots"),
                  movieScreenShots(ImageAssets.screenShot),
                  movieScreenShots(ImageAssets.screenShot),
                  movieScreenShots(ImageAssets.screenShot),
                  titleText("Similar"),
                  Container(
                    width: double.infinity,
                    height: screenSize.height * .46,
                    child: GridView.builder(
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return similarMovies();
                        }),
                  ),
                  titleText("Summary"),
                  Text(
                    "AboutMovies",
                    style: AppStyles.regular16RobotoWhite,
                  ),
                  titleText("Cast"),
                  Container(
                    height: screenSize.height * .5,
                    child: ListView.builder(
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return ActorsDetails();
                        }),
                  ),
                  titleText("Genres"),
                  Row(
                    children: [
                      MoviesCategory(
                          category: AppLocalizations.of(context)!.action),
                      MoviesCategory(
                          category: AppLocalizations.of(context)!.sci_fi),
                      MoviesCategory(
                          category: AppLocalizations.of(context)!.adventure),
                    ],
                  ),
                  Row(
                    children: [
                      MoviesCategory(
                          category: AppLocalizations.of(context)!.fantasy),
                      MoviesCategory(
                          category: AppLocalizations.of(context)!.horror),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget titleText(String title) {
    return Text(
      title,
      style: AppStyles.bold24White,
    );
  }

  Widget movieScreenShots(String screenShotUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(screenShotUrl),
    );
  }

  Widget similarMovies() {
    return Movieslist();
  }
}
