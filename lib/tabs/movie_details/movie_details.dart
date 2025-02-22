import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/tabs/browse_screen/movies_list.dart';
import 'package:movies/tabs/movie_details/actors_details.dart';
import 'package:movies/tabs/movie_details/cubit/movie_details_state.dart';
import 'package:movies/tabs/movie_details/cubit/movie_details_view_model.dart';
import 'package:movies/tabs/movie_details/favorite_date_time.dart';
import 'package:movies/tabs/movie_details/movies_category.dart';
import 'package:movies/tabs/profileTab/cubit/history_view_model.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../model/movie_details_model.dart';

class MovieDetailsScreen extends StatefulWidget {
  static const String routeName = "Movie_details";

  const MovieDetailsScreen({super.key});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

late Size screenSize;

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieDetailsViewModel viewModel = MovieDetailsViewModel.instance;

  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            child: BlocBuilder<MovieDetailsViewModel, MovieState>(
          bloc: viewModel,
          buildWhen: (previous, current) =>
              current is AvailableNowSuccessState &&
              previous is! SuggestionsSuccessState,
          builder: (context, state) {
            if (state is AvailableNowLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.white,
                ),
              );
            } else if (state is AvailableNowErrorState) {
              return Center(
                child: Column(
                  children: [
                    Text(
                      state.errorMessage,
                      style: AppStyles.bold20Orange,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Try Again")),
                  ],
                ),
              );
            } else if (state is AvailableNowSuccessState) {
              return Column(
                spacing: screenSize.height * .02,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: screenSize.height * .6,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                state.movieDetails.largeCoverImage ?? ""),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: screenSize.height * .6,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              AppColor.darkGrey,
                              AppColor.transparent,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: screenSize.height * .6,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: screenSize.width * .02,
                                vertical: screenSize.width * .02,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                    icon: Image.asset(ImageAssets.arrowBack),
                                  ),
                                  Image.asset(ImageAssets.saveMovie),
                                ],
                              ),
                            ),
                            SizedBox(height: screenSize.height * .14),
                            InkWell(
                                onTap: () {
                                  launchInAppWithBrowserOptions(
                                      Uri.parse(state.movieDetails.url ?? ""));
                                },
                                child: Image.asset(ImageAssets.moviePlay)),
                            Spacer(),
                            Text(
                              state.movieDetails.titleLong ?? "",
                              style: AppStyles.bold24RobotoWhite,
                            ),
                            Text(
                              state.movieDetails.year.toString(),
                              style: AppStyles.bold24White,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenSize.width * .02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: screenSize.height * .02,
                      children: [
                        CustomElevatedButton(
                            backgroundColor: AppColor.red,
                            textStyle: AppStyles.bold20white,
                            text: "Watch",
                            center: true,
                            onPressed: () {
                              launchInAppWithBrowserOptions(
                                  Uri.parse(state.movieDetails.url ?? ""));
                              List<MovieDetails> moviesList = [state.movieDetails];
                              context.read<HistoryViewModel>().saveMovies(moviesList);

                            }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FavoriteDateTime(
                                number: state.movieDetails.likeCount ?? 0,
                                url: ImageAssets.yellowFavorite),
                            FavoriteDateTime(
                                number: state.movieDetails.runtime ?? 0,
                                url: ImageAssets.movieTime),
                            FavoriteDateTime(
                                number: state.movieDetails.rating ?? 0,
                                url: ImageAssets.movieRate),
                          ],
                        ),
                        titleText("Screen Shots"),
                        movieScreenShots(
                            state.movieDetails.largeScreenshotImage1 ?? ""),
                        movieScreenShots(
                            state.movieDetails.largeScreenshotImage2 ?? ""),
                        movieScreenShots(
                            state.movieDetails.largeScreenshotImage3 ?? ""),
                        titleText("Similar"),
                        BlocBuilder(
                            bloc: viewModel,
                            builder: (context, state2) {
                              if (state2 is SuggestionsLoadingState) {
                                return Center(
                                    child: CircularProgressIndicator(
                                  color: AppColor.white,
                                ));
                              } else if (state2 is SuggestionsErrorState) {
                                return Center(
                                  child: Text(state2.errorMessage),
                                );
                              } else if (state2 is SuggestionsSuccessState) {
                                return SizedBox(
                                  width: double.infinity,
                                  height: screenSize.height * .46,
                                  child: GridView.builder(
                                      itemCount:
                                          viewModel.suggestionMovies.length,
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2),
                                      itemBuilder: (context, index) {
                                        return InkWell(
                                          onTap: () {
                                            MovieDetailsViewModel.instance
                                                .getMovieById(viewModel
                                                    .suggestionMovies[index].id
                                                    .toString());

                                            Navigator.of(context).pushNamed(
                                                MovieDetailsScreen.routeName);
                                          },
                                          child: similarMovies(viewModel
                                                  .suggestionMovies[index]
                                                  .smallCoverImage ??
                                              ""),
                                        );
                                      }),
                                );
                              } else {
                                return Container();
                              }
                            }),
                        titleText("Summary"),
                        Text(
                          state.movieDetails.descriptionFull ??
                              "No Description",
                          style: AppStyles.regular16RobotoWhite,
                        ),
                        titleText("Cast"),
                        SizedBox(
                          height: screenSize.height * .4,
                          child: ListView.builder(
                              itemCount: state.movieDetails.cast?.length ?? 0,
                              itemBuilder: (context, index) {
                                return ActorsDetails(
                                  cast: state.movieDetails.cast![index],
                                );
                              }),
                        ),
                        titleText("Genres"),
                        SizedBox(
                          height: screenSize.height * .3,
                          child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      childAspectRatio: screenSize.width / 120,
                                      crossAxisSpacing: 5,
                                      mainAxisSpacing: 5,
                                      crossAxisCount: 2),
                              itemCount: state.movieDetails.genres?.length ?? 0,
                              itemBuilder: (context, index) {
                                return MoviesCategory(
                                  genereName: state.movieDetails.genres![index],
                                );
                              }),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }
            return Container();
          },
        )),
      ),
    );
  }

  Widget titleText(String title) {
    return Text(
      title,
      style: AppStyles.bold24White,
    );
  }

  Future<void> launchInAppWithBrowserOptions(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppBrowserView,
      browserConfiguration: const BrowserConfiguration(showTitle: true),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Widget movieScreenShots(String screenShotUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: CachedNetworkImage(
        imageUrl: screenShotUrl,
        fit: BoxFit.fill,
        height: screenSize.height * .2,
        width: screenSize.width,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) =>
            Icon(Icons.error, color: AppColor.white),
      ),
    );
  }

  Widget similarMovies(String? imagePath) {
    return Movieslist(
      imagePath: imagePath,
    );
  }
}
