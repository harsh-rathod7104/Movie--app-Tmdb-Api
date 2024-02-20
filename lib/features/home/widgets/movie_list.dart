import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/features/home/models/movie_model.dart';
import 'package:movieapp/utils/api_base.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.movieList});
  final List<MovieModel> movieList;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: SizedBox(
                height: 80.h,
                width: 120.w,
                child: CachedNetworkImage(
                  imageUrl:
                      '${ApiUrls.imageBaseUrl}${movieList[index].posterPath}',
                  progressIndicatorBuilder: (context, url, downloadProgress) {
                    return FadeShimmer(
                      width: 12.w,
                      height: 40.h,
                      highlightColor: const Color(0xff22272f),
                      baseColor: const Color(0xff20252d),
                    );
                  },
                  errorWidget: (context, url, error) {
                    return const Icon(Icons.error);
                  },
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
