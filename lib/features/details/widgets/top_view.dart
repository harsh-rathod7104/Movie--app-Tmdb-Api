import 'package:cached_network_image/cached_network_image.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/features/home/models/movie_model.dart';
import 'package:movieapp/utils/api_base.dart';

class TopView extends StatelessWidget {
  final MovieModel movie;
  const TopView({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 340.h,
      child: Stack(
        children: [
          SizedBox(
            height: 260.h,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: ApiUrls.imageBaseUrl + movie.backDropPath,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return const Center(child: CircularProgressIndicator());
              },
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 15.h,
            left: 16.w,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Opacity(
                opacity: 0.8,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade900,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(7.sp),
                    child: const Icon(
                      Icons.arrow_back_sharp,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20.w,
            top: 175.h,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(16.r)),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: SizedBox(
                    height: 130.h,
                    width: 100.w,
                    child: CachedNetworkImage(
                      imageUrl: ApiUrls.imageBaseUrl + movie.posterPath,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => FadeShimmer(
                        width: 30.w,
                        height: 20.h,
                        highlightColor: const Color(0xff22272f),
                        baseColor: const Color(0xff20252d),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              top: 270.h,
              right: 10.w,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      movie.voteAverage == 0.0
                          ? "N/A"
                          : movie.voteAverage.toStringAsFixed(2),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
