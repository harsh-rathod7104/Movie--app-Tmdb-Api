import 'package:flutter/material.dart';
import 'package:movieapp/features/details/screens/movie_description.dart';
import 'package:movieapp/features/details/widgets/top_view.dart';
import 'package:movieapp/features/home/models/movie_model.dart';

class DetailsScreen extends StatelessWidget {
  final MovieModel movie;
  const DetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff181818),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopView(movie: movie),
            // MovieDescription(movie: movie),
          ],
        ),
      ),
    ));
  }
}
