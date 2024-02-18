import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/features/home/bloc/home_bloc.dart';
import 'package:movieapp/features/home/bloc/home_event.dart';
import 'package:movieapp/features/home/bloc/home_state.dart';
import 'package:movieapp/features/home/data/home_respository.dart';
import 'package:movieapp/features/home/models/movie_model.dart';
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
                        const SizedBox(
                          height: kToolbarHeight - 10,
                        ),
                        SizedBox(
                          height: kToolbarHeight,
                          child: Center(
                              child: Image.asset(ImageConstants.appLogo)),
                        ),
                        const Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Trending Movie",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_outlined,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: trendingMovie.isNotEmpty
                              ? CarouselSlider.builder(
                                  itemCount: trendingMovie.length,
                                  itemBuilder:
                                      (context, itemIndex, pageViewIndex) {
                                    return SizedBox(
                                      height: 300,
                                      width: 200,
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/original/${trendingMovie[itemIndex].posterPath}',
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                  options: CarouselOptions(
                                    height: 300,
                                    autoPlay: true,
                                    viewportFraction: 0.55,
                                    enlargeCenterPage: true,
                                    pageSnapping: true,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    autoPlayAnimationDuration:
                                        const Duration(seconds: 1),
                                  ),
                                )
                              : const SizedBox.shrink(),
                        )
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}
