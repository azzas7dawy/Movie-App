part of 'movie_cubit.dart';

@immutable
sealed class MovieState {}

final class MovieInitial extends MovieState {}

final class MovieLoading extends MovieState {}

final class MovieSuccess extends MovieState {
  final List<Result> movies;

  MovieSuccess(this.movies);
}

final class MovieError extends MovieState {
  final String message;

  MovieError(this.message);
}
