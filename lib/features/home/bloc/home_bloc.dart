import 'package:movieapp/features/home/bloc/home_event.dart';
import 'package:movieapp/features/home/bloc/home_state.dart';
import 'package:movieapp/features/home/data/home_respository.dart';
import 'package:movieapp/features/home/models/movie_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepository movieRepository;
  HomeBloc({required this.movieRepository}) : super(HomeIntitalState()) {
    on<HomeEvent>((event, emit) async {
      if (event is FetchMovieEvent) {
        emit(HomeLoadingState());
        try {
          final List<List<MovieModel>> moviesByCategory =
              await movieRepository.fetchAllMovies();
          emit(MovieSuccessState(
            trending: moviesByCategory[0],
            popular: moviesByCategory[1],
            upcoming: moviesByCategory[2],
            topRated: moviesByCategory[3],
          ));
        } catch (e) {
          emit(MovieErrorState(error: e.toString()));
        }
      }
    });
  }
}
