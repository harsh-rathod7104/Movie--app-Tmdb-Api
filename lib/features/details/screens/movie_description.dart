import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movieapp/features/home/models/movie_model.dart';

class MovieDescription extends StatelessWidget {
  final MovieModel movie;
  const MovieDescription({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  movie.title,
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: const Color(0xFFFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                width: 5.sp,
              ),
              Row(
                children: [
                  const SizedBox(
                    child: Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Text(
                    movie.releaseDate.split('-')[0],
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            movie.overview,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
