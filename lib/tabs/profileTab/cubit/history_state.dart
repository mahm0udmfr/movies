import '../../../model/movie_details_model.dart';

abstract class HistoryState {}

class HistoryLoadingState extends HistoryState {}

class HistorySuccessState extends HistoryState {
  final List<MovieDetails> historyMovies;
  HistorySuccessState({required this.historyMovies});
}

class HistoryErrorState extends HistoryState {
  final String errorMessage;
  HistoryErrorState({required this.errorMessage});
}

class HistoryEmptyState extends HistoryState {}
