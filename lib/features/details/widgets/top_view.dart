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
      height: 310.h,
      child: Stack(
        children: [
          SizedBox(
            height: 260.h,
            width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: ApiUrls.imageBaseUrl + movie.backDropPath,
              progressIndicatorBuilder: (context, url, downloadProgress) {
                return Center(child: CircularProgressIndicator());
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
            top: 180.h,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
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
        ],
      ),
    );
  }
}
