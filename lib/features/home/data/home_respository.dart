import 'dart:convert';

import 'package:movieapp/features/home/models/movie_model.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/utils/api_base.dart';

class HomeRepository {
  //Fetch single category Movie
  Future<List<MovieModel>> fetchMovies(String category) async {
    final response = await http.get(Uri.parse(category));

    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception("Failed to Load movies");
    }
  }

  //fetch all category movies
  Future<List<List<MovieModel>>> fetchAllMovies() async {
    final List<Future<List<MovieModel>>> futures = [];
    final List<String> apiEndPoints = [
      ApiUrls.terndingMovies,
      ApiUrls.popularMovies,
      ApiUrls.upcomingMovies,
      ApiUrls.topRatedMovies,
    ];

    for (String category in apiEndPoints) {
      final response = fetchMovies(category);
      futures.add(response);
    }

    try {
      final List<List<MovieModel>> results = await Future.wait(futures);
      return results;
    } catch (e) {
      throw Exception(e);
    }
  }
}
