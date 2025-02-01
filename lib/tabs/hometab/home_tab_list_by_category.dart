import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/tabs/hometab/cubit/home_tab_state.dart';
import 'package:movies/tabs/hometab/cubit/home_tab_view_model.dart';
import 'package:movies/tabs/hometab/list_category_widget.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/utils/colors.dart';

class HomeTabListByCategory extends StatefulWidget {
  const HomeTabListByCategory({super.key});

  @override
  State<HomeTabListByCategory> createState() => HomeTabListByCategoryState();
}

class HomeTabListByCategoryState extends State<HomeTabListByCategory> {
  late final HomeTabViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = HomeTabViewModel();
    viewModel.getMoviesByCategoryName('Action');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabViewModel, HomeTabState>(
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.errorMessage,
                  style: AppStyles.bold20Orange,
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    viewModel.getMoviesByCategoryName('Action');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.orange,
                  ),
                  child: Text("Try Again",
                      style: TextStyle(color: AppColor.white)),
                ),
              ],
            ),
          );
        } else if (state is AvailableNowSuccessState) {
          return ListCategoryWidget(availableNowList: state.availableNowList);
        } else {
          return SizedBox();
        }
      },
    );
  }
}
