import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/model/home_tab_model.dart';
import 'package:movies/tabs/browse_screen/cubit/browse_screen_states.dart';
import 'package:movies/utils/api_manager.dart';

class BrowseScreenViewModel extends Cubit<BrowseScreenStates> {
  BrowseScreenViewModel() : super(BrowseInitialState()) {
    changeCategoryIndex(0);
  }

  List<Movies> moviesList = [];
  List<String> movieCategories = [
    "Action",
    "Drama",
    "Crime",
    "Documentary",
    "Thriller",
    "Comedy",
    "Family"
  ];

  Future getMoviesByCategoryName(String categoryName) async {
    try {
      emit(BrowseLoadingState());
      var response = await ApiManager.getMoviesByCategoryName(categoryName);
      if (response!.status == 'error') {
        emit(BrowseErrorState(
            errorMsg: response.statusMessage ?? "error getting data"));
        return;
      }

      if (response.status == 'ok') {
        moviesList = response.data!.movies!;
        emit(BrowseSuccessState(moviesByCategory: response.data!.movies!));
      }
    } catch (e) {
      emit(BrowseErrorState(errorMsg: e.toString()));
    }
  }

  Future changeCategoryIndex(int index) async {
    emit(BrowseChangeCategory(selectedIndex: index)); // Emitting first
    await getMoviesByCategoryName(movieCategories[index]); // Await the API call
  }
}
