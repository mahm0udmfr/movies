import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/tabs/hometab/cubit/home_tab_state.dart';
import 'package:movies/utils/api_manager.dart';

class HomeTabViewModel extends Cubit<HomeTabState> {
  HomeTabViewModel() : super(AvailableNowLoadingState());
  int newSelectedIndex = 0;
  void getMovies() async {
    try {
      emit(AvailableNowLoadingState());
      var response = await ApiManager.getMovies();
      if (response!.status == 'error') {
        emit(AvailableNowErrorState(errorMessage: response.statusMessage ?? "error getting data"));
        return;
      }

      if (response.status == 'ok') {
        emit(AvailableNowSuccessState(availableNowList: response.data!.movies!));
        return;
      }
    } catch (e) {
      emit(AvailableNowErrorState(errorMessage: e.toString()));
    }
  }

void getMoviesByCategoryName(String categoryName) async {
    try {
      emit(AvailableNowLoadingState());
      var response = await ApiManager.getMoviesByCategoryName(categoryName);
      if (response!.status == 'error') {
        emit(AvailableNowErrorState(errorMessage: response.statusMessage??"error getting data"));
        return;
      }

      if (response.status == 'ok') {
        emit(AvailableNowSuccessState(availableNowList: response.data!.movies!));
        return;
      }
      
    } catch (e) {
      emit(AvailableNowErrorState(errorMessage: e.toString()));
    }
  }



  void changeImageIndex(int index) {

    emit(ScrollImageChange(selectedIndex: newSelectedIndex));
  }
}
