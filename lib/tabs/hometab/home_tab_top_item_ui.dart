import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/tabs/hometab/cubit/home_tab_state.dart';
import 'package:movies/tabs/hometab/cubit/home_tab_view_model.dart';
import 'package:movies/tabs/hometab/home_tab_widget.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';

class MoviesTabTopItem extends StatefulWidget {
  static const String routename = 'MoviesTab';
  const MoviesTabTopItem({super.key});

  @override
  State<MoviesTabTopItem> createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTabTopItem> {
  HomeTabViewModel viewModel = HomeTabViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    // Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: BlocBuilder<HomeTabViewModel, HomeTabState>(
        bloc: viewModel,
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
                  ElevatedButton(
                      onPressed: () {
                        viewModel.getMovies();
                      },
                      child: Text("Try Again")),
                ],
              ),
            );
          } else if (state is AvailableNowSuccessState) {
            return Stack(children: [
              Opacity(
                opacity: 0.5,
                child: CachedNetworkImage(
                  imageUrl: state.availableNowList[0].mediumCoverImage,
                  fit: BoxFit.fill,
                  height: double.infinity,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      CircularProgressIndicator(
                          value: downloadProgress.progress),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Column(
                children: [
                  Image.asset(ImageAssets.availableNow),
                  HomeTabWidget(availableNowList: state.availableNowList),
                  Image.asset(ImageAssets.watchNow),
                ],
              ),
            ]);
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
