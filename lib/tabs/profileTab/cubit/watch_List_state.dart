import 'package:movies/model/get_all_favorites_model.dart';

class WatchListState {}

class WatchListLoadingState extends WatchListState {}

class WatchListInitState extends WatchListState {}

class WatchListEmptyState extends WatchListState {}

class WatchListErrorState extends WatchListState {
  String errorMessage;

  WatchListErrorState({required this.errorMessage});
}

class WatchListSuccessState extends WatchListState {
  GetAllFavorites response;

  WatchListSuccessState({required this.response});
}
