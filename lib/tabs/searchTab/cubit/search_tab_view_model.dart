import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/tabs/searchTab/cubit/search_tab_states.dart';
import 'package:movies/utils/api_manager.dart';

class SearchTabViewModel extends Cubit<SearchStates> {
  SearchTabViewModel._() : super(SearchLoadingState()) {
    getSearchMovies();
  }

  static final SearchTabViewModel _instance = SearchTabViewModel._();

  static SearchTabViewModel get instance => _instance;
  var searchController = TextEditingController();
  void getSearchMovies() async {
    try {
      emit(SearchLoadingState());
      var response = await ApiManager.searchMovie(searchController.text);
      if (response!.status == 'error') {
        emit(SearchErrorState(
            errorMessage: response.statusMessage ?? "error getting data"));
        return;
      }

      if (response.status == 'ok') {
        emit(SearchSuccessState(moviesSearch: response.data!.movies!));
      }
    } catch (e) {
      emit(SearchErrorState(errorMessage: e.toString()));
    }
  }
}
