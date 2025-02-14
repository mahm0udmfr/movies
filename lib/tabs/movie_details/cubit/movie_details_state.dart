
import 'package:movies/model/movie_details_model.dart';


abstract class MovieDetailsState {}

class AvailableNowLoadingState extends MovieDetailsState {}

class AvailableNowErrorState extends MovieDetailsState {
  String errorMessage;
  AvailableNowErrorState({required this.errorMessage});
}

class AvailableNowSuccessState extends MovieDetailsState {
  MovieDetails movieDetails;
  AvailableNowSuccessState({required this.movieDetails});
}

