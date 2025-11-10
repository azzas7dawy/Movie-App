import 'package:bloc/bloc.dart';
import 'package:maps_and_themeing/features/home_screen/data/models/movie_model.dart';
import 'package:maps_and_themeing/features/home_screen/data/models/movie_response.dart';
import 'package:maps_and_themeing/features/home_screen/data/repos/movie_repo.dart';
import 'package:meta/meta.dart';

part 'movie_state.dart';

class MovieCubit extends Cubit<MovieState> {
  MovieCubit(this.movieRepo) : super(MovieInitial());

  final MovieRepo movieRepo;

  Future<void> fetchMovies() async {
    emit(MovieLoading());
    try {
      final moviesResponse = await movieRepo.fetchMovies(
        accountId: '33',
        apiKey: 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI0OGJhYzRlNzMyMTA0NDcxZjZjMzY4YmE5ODk1OGY5NiIsIm5iZiI6MTc2MTc1MDE1NS4yOTMsInN1YiI6IjY5MDIyYzhiNTU0ZWM2NzUxZjkzNWMxYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Y5-5tT0M7lQHeJbmEWmn4EQQ1WcIffq5wkxWGwH8USA',
        // sessionId: '2e52d22c7385d6129728dc9715da9b81',
        language: '',
      );
     
      // emit(MovieSuccess(moviesResponse));      "request_token": "276e0d77bb18b24cf1973b7b9a70cd813a6fd9ec"

      emit(MovieSuccess(moviesResponse));
      print(moviesResponse);
    } catch (e) {
      emit(MovieError(e.toString()));
      rethrow; // Re-throw the error after emitting the error state
    }
  }
 
}
