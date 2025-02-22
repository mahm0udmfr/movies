import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movies/model/movie_suggestions.dart';
import 'package:movies/tabs/movie_details/cubit/movie_details_state.dart';
import 'package:movies/utils/api_manager.dart';

import '../../../model/movie_details_model.dart';

class MovieDetailsViewModel extends Cubit<MovieState> {
  List<MoviesSuggestionSmall> suggestionMovies = [];
  MovieDetailsViewModel._() : super(AvailableNowLoadingState());

  static final MovieDetailsViewModel _instance = MovieDetailsViewModel._();

  static MovieDetailsViewModel get instance => _instance;

  void getMovieById(String movieId) async {
    try {
      emit(AvailableNowLoadingState());
      var response = await ApiManager.getMovieDetail(movieId: movieId);
      if (response!.status == 'error') {
        emit(AvailableNowErrorState(
            errorMessage: response.statusMessage ?? "error getting data"));
        return;
      }

      if (response.status == 'ok') {

        getSuggestionById(movieId);
        emit(AvailableNowSuccessState(
            movieDetails: response.data!.movieDetails!));

      }
    } catch (e) {
      emit(AvailableNowErrorState(errorMessage: e.toString()));
    }
  }

  void getSuggestionById(String movieId) async {

    try {
      emit(SuggestionsLoadingState());
      var response = await ApiManager.suggestions(movieId: movieId);
      if (response!.status != 'ok') {
        emit(SuggestionsErrorState(errorMessage: response.statusMessage!));
      }

      if (response.status == 'ok') {
        suggestionMovies = response.data!.movies ?? [];
        emit(SuggestionsSuccessState(suggestionResponse: response));
      }
    } catch (e) {
      emit(SuggestionsErrorState(errorMessage: e.toString()));
    }
  }



}
