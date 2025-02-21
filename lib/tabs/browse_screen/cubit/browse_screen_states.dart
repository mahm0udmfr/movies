import 'package:movies/model/home_tab_model.dart';

abstract class BrowseScreenStates {}

class BrowseInitialState extends BrowseScreenStates {}

class BrowseLoadingState extends BrowseScreenStates {}

class BrowseErrorState extends BrowseScreenStates {
  String errorMsg;

  BrowseErrorState({required this.errorMsg});
}

class BrowseChangeCategory extends BrowseScreenStates {
  int selectedIndex = 0;

  BrowseChangeCategory({required this.selectedIndex});
}

class BrowseSuccessState extends BrowseScreenStates {
  List<Movies> moviesByCategory;

  BrowseSuccessState({required this.moviesByCategory});
}
