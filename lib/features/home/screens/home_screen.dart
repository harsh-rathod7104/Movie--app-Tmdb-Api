import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/features/home/bloc/home_bloc.dart';
import 'package:movieapp/features/home/bloc/home_event.dart';
import 'package:movieapp/features/home/bloc/home_state.dart';
import 'package:movieapp/features/home/data/home_respository.dart';
import 'package:movieapp/features/home/models/movie_model.dart';
import 'package:movieapp/features/home/widgets/custom_title.dart';
import 'package:movieapp/features/home/widgets/movie_slider.dart';
import 'package:movieapp/utils/constant_value.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeBloc(movieRepository: HomeRepository())..add(FetchMovieEvent()),
      child: const HomeScreenUI(),
    );
  }
}

class HomeScreenUI extends StatefulWidget {
  const HomeScreenUI({super.key});

  @override
  State<HomeScreenUI> createState() => _HomeScreenUIState();
}

class _HomeScreenUIState extends State<HomeScreenUI> {
  List<MovieModel> trendingMovie = [];
  List<MovieModel> popularMovie = [];
  List<MovieModel> upcomingMovie = [];
  List<MovieModel> topRatedMovie = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is MovieSuccessState) {
            trendingMovie = state.trending;
            popularMovie = state.popular;
            upcomingMovie = state.upcoming;
            topRatedMovie = state.topRated;
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: trendingMovie.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: kToolbarHeight - 10.sp,
                        ),
                        SizedBox(
                          height: kToolbarHeight,
                          child: Center(
                            child: Image.asset(ImageConstants.appLogo),
                          ),
                        ),
                        CustomTitle(
                            title: StringConstant.trendingMovies,
                            moviesList: trendingMovie),
                        MovieSlider(movieData: trendingMovie),
                        CustomTitle(
                            title: StringConstant.popular,
                            moviesList: popularMovie),
                        MovieSlider(movieData: popularMovie),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
