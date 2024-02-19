import 'package:movieapp/utils/apikey.dart';

class ApiUrls {
  static String terndingMovies =
      "https://api.themoviedb.org/3/trending/movie/week?api_key=de348885c16ab411be1bef44ff7950f4";

  static String popularMovies =
      "https://api.themoviedb.org/3/movie/popular?api_key=de348885c16ab411be1bef44ff7950f4";

  static String upcomingMovies =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=de348885c16ab411be1bef44ff7950f4";

  static String topRatedMovies =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=de348885c16ab411be1bef44ff7950f4";

  static String imageBaseUrl = "https://image.tmdb.org/t/p/original/";
}
