import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/tabs/movie_details/cubit/movie_details_state.dart';
import 'package:movies/utils/api_manager.dart';

class MovieDetailsViewModel extends Cubit<MovieState> {
  // List<DataSuggestion?> suggestions =[];
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
        emit(AvailableNowSuccessState(
            movieDetails: response.data!.movieDetails!));
        return;
      }
    } catch (e) {
      emit(AvailableNowErrorState(errorMessage: e.toString()));
    }
  }

  void getSuggestionById(String movieId) async {
    try {
      emit(SuggestionsLoadingState());
      var response = await ApiManager.suggestions(movieId: movieId);
      if (response!.status == 'error') {
        emit(SuggestionsErrorState(
            errorMessage: response.statusMessage ?? "error getting data"));
        return;
      }

      if (response.status == 'ok') {
        // suggestions =response.data!.movies;
        emit(SuggestionsSuccessState(movieSuggestions: response));
        return;
      }
    } catch (e) {
      emit(AvailableNowErrorState(errorMessage: e.toString()));
    }
  }
}
