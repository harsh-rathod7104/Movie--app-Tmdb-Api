import 'package:movieapp/features/home/models/movie_model.dart';

abstract class HomeState {}

class HomeIntitalState extends HomeState {}

class HomeLoadingState extends HomeState {}

class MovieSuccessState extends HomeState {
  final List<MovieModel> trending;
  final List<MovieModel> popular;
  final List<MovieModel> upcoming;
  final List<MovieModel> topRated;

  MovieSuccessState({
    required this.trending,
    required this.popular,
    required this.upcoming,
    required this.topRated,
  });
}

class MovieErrorState extends HomeState {
  final String error;
  MovieErrorState({required this.error});
}
