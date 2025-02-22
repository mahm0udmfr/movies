import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import '../../../model/movie_details_model.dart';
import 'history_state.dart';

class HistoryViewModel extends Cubit<HistoryState> {
  late Box<MovieDetails> historyBox;
  List<MovieDetails> historyMovies = [];

  HistoryViewModel() : super(HistoryLoadingState()) {
    _openBox();
  }

  Future<void> _openBox() async {
    try {
      historyBox = await Hive.openBox<MovieDetails>('historyBox');
      getMovies();
    } catch (e) {
      emit(HistoryErrorState(errorMessage: "Error opening Hive box: ${e.toString()}"));
    }
  }

  void saveMovies(List<MovieDetails> movies) async {
    try {
      List<MovieDetails> oldMovies = historyBox.values.toList();
      List<MovieDetails> updatedMovies = [...oldMovies, ...movies];

      for (var movie in movies) {
        await historyBox.put(movie.id, movie);
      }

      historyMovies = updatedMovies;
      emit(HistorySuccessState(historyMovies: historyMovies));
      print("Movies saved successfully!");
    } catch (e) {
      emit(HistoryErrorState(errorMessage: e.toString()));
    }
  }

  void getMovies() async {
    try {
      List<MovieDetails> movies = historyBox.values.toList();
      historyMovies = movies;

      if (movies.isEmpty) {
        emit(HistoryEmptyState());
      } else {
        emit(HistorySuccessState(historyMovies: historyMovies));
      }
    } catch (e) {
      emit(HistoryErrorState(errorMessage: e.toString()));
    }
  }

  @override
  Future<void> close() async {
    await historyBox.close();
    super.close();
  }
}
