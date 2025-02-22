import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/model/movie_suggestions.dart';
import 'package:movies/tabs/movie_details/cubit/movie_details_state.dart';
import 'package:movies/utils/api_manager.dart';

class MovieDetailsViewModel extends Cubit<MovieState> {
  List<MoviesSuggestionSmall> suggestionMovies = [];

  MovieDetailsViewModel._() : super(AvailableNowLoadingState());

  static final MovieDetailsViewModel _instance = MovieDetailsViewModel._();

  static MovieDetailsViewModel get instance => _instance;

  void getMovieById(String movieId) async {
    emit(AvailableNowLoadingState());
    try {
      var response = await ApiManager.getMovieDetail(movieId: movieId);
      if (response?.status == 'error') {
        emit(AvailableNowErrorState(
            errorMessage: response?.statusMessage ?? "Error getting data"));
        return;
      }

      if (response?.status == 'ok' && response?.data?.movieDetails != null) {
        emit(AvailableNowSuccessState(
            movieDetails: response!.data!.movieDetails!));
        getSuggestionById(movieId);
      } else {
        emit(AvailableNowErrorState(errorMessage: "Invalid response data"));
      }
    } catch (e) {
      emit(AvailableNowErrorState(errorMessage: e.toString()));
    }
  }

  void getSuggestionById(String movieId) async {
    emit(SuggestionsLoadingState());
    try {
      var response = await ApiManager.suggestions(movieId: movieId);
      if (response?.status == 'ok') {
        suggestionMovies = response!.data!.movies ?? [];
        emit(SuggestionsSuccessState(suggestionResponse: response));
      } else {
        emit(SuggestionsErrorState(
            errorMessage:
                response?.statusMessage ?? "Error fetching suggestions"));
      }
    } catch (e) {
      emit(SuggestionsErrorState(errorMessage: e.toString()));
    }
  }

  void addMovieToFavorite(String movieId, String name, num rating,
      String imageURL, String year) async {
    // emit(MovieIsFavoriteState(isFavorite: false));
    try {
      var response = await ApiManager.addMovieToFavorites(
          movieId, name, rating, imageURL, year);
      if (response?.message == 'Added to favourite successfully') {
        // checkIfFavorite(movieId);
        getMovieById(movieId);
      } else {
        emit(MovieIsFavoriteErrorState(
            errorMessage: response?.message ?? "Error adding to favorites"));
      }
    } catch (e) {
      emit(MovieIsFavoriteErrorState(errorMessage: e.toString()));
    }
  }


void removeMovieFromFavorite(String movieId) async {
    // emit(MovieIsFavoriteState(isFavorite: false));
    try {
      var response = await ApiManager.removeMovieFromFavorites(
          movieId);
      if (response?.message == 'Removed from favourite successfully') {
        // checkIfFavorite(movieId);
        getMovieById(movieId);
      } else {
        emit(MovieIsFavoriteErrorState(
            errorMessage: response?.message ?? "Error adding to favorites"));
      }
    } catch (e) {
      emit(MovieIsFavoriteErrorState(errorMessage: e.toString()));
    }
  }



  Future<bool> checkIfFavorite(String movieId) async {
    emit(MovieIsFavoriteState(isFavorite: false)); // Emit loading state
    try {
      var response = await ApiManager.checkIfMovieIsFavorite(movieId);
      if (response?.message == "Favourite status fetched successfully") {
        bool isFavorite = response!.data ?? false;
        emit(MovieIsFavoriteState(isFavorite: isFavorite));
        return isFavorite;
      } else {
        emit(MovieIsFavoriteErrorState(
            errorMessage: response?.message ??
                "Error checking favorite status")); // Emit error state

        return false;
      }
    } catch (e) {
      emit(MovieIsFavoriteErrorState(
          errorMessage: e.toString())); // Emit error state
      return false;
    }
  }
}
