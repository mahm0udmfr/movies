import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/tabs/browse_screen/cubit/browse_screen_states.dart';
import 'package:movies/tabs/browse_screen/cubit/browse_screen_view_model.dart';
import 'package:movies/tabs/browse_screen/movies_category_widget.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';

import '../hometab/movie_widget.dart';
import '../movie_details/cubit/movie_details_view_model.dart';
import '../movie_details/movie_details.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  BrowseScreenViewModel viewModel = BrowseScreenViewModel();

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenSize.height * .05,
          ),
          SizedBox(
            height: screenSize.height * .06,
            width: double.infinity,
            child: BlocBuilder<BrowseScreenViewModel, BrowseScreenStates>(
              bloc: viewModel,
              buildWhen: (previous, current) => current
                  is BrowseChangeCategory, // Only rebuild on category change
              builder: (context, state) {
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        viewModel.changeCategoryIndex(index);
                      },
                      child: MoviesCategoryWidget(
                        categoryName: viewModel.movieCategories[index],
                        isSelected: (state is BrowseChangeCategory) &&
                            state.selectedIndex == index,
                        backgroundColor: AppColor.orange,
                        textSelectedStyle: AppStyles.bold20Black,
                        textUnSelectedStyle: AppStyles.bold20Orange,
                      ),
                    );
                  },
                  itemCount: viewModel.movieCategories.length,
                );
              },
            ),
          ),
          SizedBox(
            height: screenSize.height * .02,
          ),
          BlocBuilder<BrowseScreenViewModel, BrowseScreenStates>(
            buildWhen: (previous, current) => current is BrowseSuccessState,
            bloc: viewModel,
            builder: (context, state) {
              if (state is BrowseInitialState || state is BrowseLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.grey,
                  ),
                );
              } else if (state is BrowseErrorState) {
                return Center(
                  child: Text(
                    state.errorMsg,
                    style: AppStyles.bold20Black,
                  ),
                );
              } else if (state is BrowseSuccessState) {
                return Expanded(
                  child: GridView.builder(
                    itemCount: viewModel.moviesList.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: 2 / 3,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return MovieWidget(
                        onTap: () {
                          MovieDetailsViewModel.instance.getMovieById(
                              viewModel.moviesList[index].id!.toString());
                          Navigator.of(context)
                              .pushNamed(MovieDetailsScreen.routeName);
                        },
                        imageUrl:
                            viewModel.moviesList[index].largeCoverImage ?? "",
                        ratingText:
                            viewModel.moviesList[index].rating.toString(),
                      );
                    },
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColor.grey,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
