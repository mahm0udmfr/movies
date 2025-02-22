import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tabs/browse_screen/browse_screen.dart';
import '../../tabs/hometab/home_tab.dart';
import '../../tabs/profileTab/profile_tab.dart';
import '../../tabs/searchTab/search_tab.dart';
import 'home_screen_states.dart';

class HomeScreenViewModel extends Cubit<HomeScreenStates> {
  HomeScreenViewModel() : super(HomeScreenInitialState());

  int selectedIndex = 0;
  int categoryIndex = 0;
  List<String> categories = ['Action', 'Comedy', 'Drama', 'Horror', 'Sci-Fi'];
  List<Widget> tabs = [MoviesTab(), SearchTab(), BrowseScreen(), ProfileTab()];

  String get currentCategory => categories[categoryIndex];

  void changeCategory() {
    categoryIndex = (categoryIndex + 1) % categories.length;
    emit(HomeScreenChangeCategoryState());
  }

  void bottomNavOnTab(int index) {
    selectedIndex = index;
    if (index == 0) {
      changeCategory();
    }
    emit(HomeScreenChangeIndexState());
  }
}
