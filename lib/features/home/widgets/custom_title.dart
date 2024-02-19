import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/features/home/models/movie_model.dart';
import 'package:movieapp/utils/cm.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final List<MovieModel> moviesList;
  const CustomTitle({super.key, required this.title, required this.moviesList});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, left: 10.w, bottom: 10.5.h),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: buildTextSpans(title)),
          ),
          SizedBox(
            width: 2.w,
          ),
          SizedBox(
            height: 4.h,
            width: 4.w,
            child: Icon(
              Icons.arrow_forward_ios_outlined,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
