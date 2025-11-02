import 'package:dio/dio.dart';
import 'package:maps_and_themeing/features/home_screen/data/models/movie_model.dart';

import 'package:retrofit/retrofit.dart';

part 'movie_service.g.dart';
@RestApi(baseUrl: 'https://api.themoviedb.org/3/account/')
abstract class MovieServices {
  factory MovieServices(Dio dio) = _MovieServices;

  @GET('{account_id}/favorite/movies')
  Future<Result> getMovies(
    @Path('account_id') String accountId,
    @Query('api_key') String apiKey,
    @Query('session_id') String sessionId,
    @Query('language') String language,
  );
}
