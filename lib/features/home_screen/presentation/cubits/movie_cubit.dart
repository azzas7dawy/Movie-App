import 'package:bloc/bloc.dart';
import 'package:maps_and_themeing/features/home_screen/data/models/movie_model.dart';
import 'package:maps_and_themeing/features/home_screen/data/repos/movie_repo.dart';
import 'package:meta/meta.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this._movieRepo) : super(MovieInitial());

  final MovieRepo _movieRepo;

  Future<void> fetchMovies() async {
    emit(MovieLoading());
    try {
      final movies = await _movieRepo.fetchMovies(
        accountId: '22423633',
        apiKey: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OGJhYzRlNzMyMTA0NDcxZjZjMzY4YmE5ODk1OGY5NiIsIm5iZiI6MTc2MTc1MDE1NS4yOTMsInN1YiI6IjY5MDIyYzhiNTU0ZWM2NzUxZjkzNWMxYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Y5-5tT0M7lQHeJbmEWmn4EQQ1WcIffq5wkxWGwH8USA',
        sessionId: '',
        language: '',
      );
     
      emit(MovieSuccess(movies as List<Result>));
    } catch (e) {
      emit(MovieError(e.toString()));
    }
  }
 
}
