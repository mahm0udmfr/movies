
import 'package:movies/model/movie_details_model.dart';
import 'package:movies/model/movie_suggestions.dart';

abstract class MovieState {}

class AvailableNowLoadingState extends MovieState {}

class AvailableNowErrorState extends MovieState {
  String errorMessage;
  AvailableNowErrorState({required this.errorMessage});
}

class AvailableNowSuccessState extends MovieState {
  MovieDetails movieDetails;
  AvailableNowSuccessState({required this.movieDetails});
}

class SuggestionsLoadingState extends MovieState {}

class SuggestionsErrorState extends MovieState {
  String errorMessage;

  SuggestionsErrorState({required this.errorMessage});
}

class SuggestionsSuccessState extends MovieState {
  SuggestionResponse suggestionResponse;

  SuggestionsSuccessState({required this.suggestionResponse});
}
