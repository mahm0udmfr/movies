import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import '../../../model/movie_details_model.dart';
import 'history_state.dart';

class HistoryViewModel extends Cubit<HistoryState> {
  late Box<MovieDetails> _historyBox;
  List<MovieDetails> historyMovies = [];

  HistoryViewModel() : super(HistoryLoadingState()) {
    _openBox();
  }

  Future<void> _openBox() async {
    try {
      _historyBox = await Hive.openBox<MovieDetails>('historyBox');
      getHistoryMovies();
    } catch (e) {
      emit(HistoryErrorState(
          errorMessage: "Error opening Hive box: ${e.toString()}"));
    }
  }

  void getHistoryMovies() {
    emit(HistoryLoadingState());

    try {
      List<MovieDetails> movies = _historyBox.values.toList();

      if (movies.isEmpty) {
        emit(HistoryEmptyState());
      } else {
        historyMovies = movies;
        emit(HistorySuccessState(historyMovies: movies));
      }
    } catch (e) {
      emit(HistoryErrorState(errorMessage: e.toString()));
    }
  }

  void saveMovie(MovieDetails movieDetails) async {
    try {
      await _historyBox.put(movieDetails.id, movieDetails);
      historyMovies.add(movieDetails);
      emit(HistorySuccessState(historyMovies: historyMovies));
      print("Movie saved successfully!");
    } catch (e) {
      emit(HistoryErrorState(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() async {
    await _historyBox.close();
    super.close();
  }
}