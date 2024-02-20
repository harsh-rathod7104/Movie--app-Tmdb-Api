import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/features/home/models/movie_model.dart';
import 'package:movieapp/utils/api_base.dart';

class MovieSlider extends StatelessWidget {
  List<MovieModel> movieData;
  MovieSlider({super.key, required this.movieData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: movieData.isNotEmpty
          ? CarouselSlider.builder(
              itemCount: movieData.length,
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                viewportFraction: 0.55,
                enlargeCenterPage: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                pageSnapping: true,
                autoPlayAnimationDuration: const Duration(seconds: 1),
              ),
              itemBuilder: (context, itemIndex, pageIndex) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: SizedBox(
                    height: 300,
                    width: 200,
                    child: CachedNetworkImage(
                      imageUrl:
                          '${ApiUrls.imageBaseUrl}${movieData[itemIndex].posterPath}',
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => FadeShimmer(
                        width: 12.w,
                        height: 40.h,
                        highlightColor: const Color(0xff22272f),
                        baseColor: Colors.grey.shade900,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                );
              },
            )
          : const SizedBox.shrink(),
    );
  }
}
