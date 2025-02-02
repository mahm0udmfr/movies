import 'package:movies/model/home_tab_model.dart';

abstract class HomeTabState {}

class AvailableNowLoadingState extends HomeTabState {}

class AvailableNowErrorState extends HomeTabState {
  String errorMessage;
  AvailableNowErrorState({required this.errorMessage});
}

class AvailableNowSuccessState extends HomeTabState {
  List<Movie> availableNowList;

  AvailableNowSuccessState({required this.availableNowList});
}

class ScrollImageChange extends HomeTabState {
  int selectedIndex;

  ScrollImageChange({required this.selectedIndex});
}
