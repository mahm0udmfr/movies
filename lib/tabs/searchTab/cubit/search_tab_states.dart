
import 'package:movies/model/search_tab_model.dart';

abstract class SearchStates {}

class SearchLoadingState extends SearchStates {}

class SearchErrorState extends SearchStates {
  String errorMessage;
  SearchErrorState({required this.errorMessage});
}

class SearchSuccessState extends SearchStates {
  List<MoviesSearch> moviesSearch = [];
  SearchSuccessState({required this.moviesSearch});
}
