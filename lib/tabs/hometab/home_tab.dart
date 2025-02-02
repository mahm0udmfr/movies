import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/tabs/hometab/cubit/home_tab_state.dart';
import 'package:movies/tabs/hometab/cubit/home_tab_view_model.dart';
import 'package:movies/tabs/hometab/home_tab_list_by_category.dart';
import 'package:movies/tabs/hometab/home_tab_widget.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';

class MoviesTab extends StatefulWidget {
  static const String routename = 'MoviesTab';
  const MoviesTab({super.key});

  @override
  State<MoviesTab> createState() => _MoviesTabState();
}

class _MoviesTabState extends State<MoviesTab> {
  HomeTabViewModel viewModel = HomeTabViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.getMovies();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                      height: screenSize.height * 0.7,
                      child: HomeTabWidget(
                          availableNowList: state.availableNowList)),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: HomeTabListByCategory(),
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
