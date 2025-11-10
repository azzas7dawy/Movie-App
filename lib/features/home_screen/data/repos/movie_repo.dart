
import 'package:maps_and_themeing/features/home_screen/data/datasources/remotly/movie_service.dart';
import 'package:maps_and_themeing/features/home_screen/data/models/movie_model.dart';
import 'package:maps_and_themeing/features/home_screen/data/models/movie_response.dart';

 class MovieRepo {
  final MovieServices apiService;
  MovieRepo(this.apiService);
  Future<List<Result>> fetchMovies({required String accountId, required String apiKey, required String language}) async {

    final response = await apiService.getMovies(
      'account_id',
      'api_key',
      // 'session_id',
      'language',
    );
    final movies = response;
 
    return  [movies];
  }
}