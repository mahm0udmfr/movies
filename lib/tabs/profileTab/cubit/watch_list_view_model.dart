import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/model/get_all_favorites_model.dart';
import 'package:movies/tabs/profileTab/cubit/watch_list_state.dart';
import 'package:movies/utils/api_manager.dart';

class WatchListViewModel extends Cubit<WatchListState> {
  static final WatchListViewModel _instance = WatchListViewModel._internal();
  List<DataGetAllFavorites>? allFavoritesList = [];

  factory WatchListViewModel() => _instance;

  WatchListViewModel._internal() : super(WatchListLoadingState());

  void getAllFavoriteMovies({required String token}) async {
    emit(WatchListLoadingState());
    try {
      var response = await ApiManager.getAllFavoriteMovies(token: token);

      if (response!.data!.isEmpty) {
        emit(WatchListEmptyState());
      } else {
        allFavoritesList = [];
        allFavoritesList = response.data;
        print("${allFavoritesList!.length}");
        emit(WatchListSuccessState(response: response));
      }
    } catch (e) {
      emit(WatchListErrorState(errorMessage: e.toString()));
    }
  }
}
