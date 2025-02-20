import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:movies/tabs/hometab/movie_widget.dart';
import 'package:movies/tabs/movie_details/cubit/movie_details_view_model.dart';
import 'package:movies/tabs/movie_details/movie_details.dart';
import 'package:movies/tabs/searchTab/cubit/search_tab_states.dart';
import 'package:movies/tabs/searchTab/cubit/search_tab_view_model.dart';
import 'package:movies/utils/colors.dart';
import 'package:movies/utils/imageassets.dart';
import 'package:movies/widget/custom_text_form_field.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  SearchTabState createState() => SearchTabState();
}

class SearchTabState extends State<SearchTab> {
  SearchTabViewModel viewModel = SearchTabViewModel.instance;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * .05,
          ),
          CustomTextFormField(
              onChanged: (p0) => viewModel.getSearchMovies(),
              controller: viewModel.searchController,
              prefixIcon: Image.asset(ImageAssets.searchIcon),
              hintText: AppLocalizations.of(context)!.search),
          Expanded(
              child: BlocBuilder(
            bloc: viewModel,
            builder: (context, state) {
              if (state is SearchLoadingState) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColor.white,
                ));
              } else if (state is SearchErrorState) {
                return Center(child: Text(state.errorMessage));
              } else if (state is SearchSuccessState) {
                return GridView.builder(
                    itemCount: state.moviesSearch.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2 / 3,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return MovieWidget(
                        onTap: () {
                          MovieDetailsViewModel.instance.getMovieById(
                                  state.moviesSearch[index].id!.toString());
                          Navigator.of(context).pushNamed(MovieDetailsScreen.routeName);
                        },
                        imageUrl:
                            state.moviesSearch[index].mediumCoverImage ?? "",
                        ratingText: state.moviesSearch[index].rating.toString(),
                      );
                    });
              }
              return SizedBox();
            },
          )),
        ],
      ),
    );
  }
}
