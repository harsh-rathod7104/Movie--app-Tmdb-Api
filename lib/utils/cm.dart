import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

List<TextSpan> buildTextSpans(String title) {
  List<String> words = title.split(' ');

  List<TextSpan> textSpans = [];

  for (int i = 0; i < words.length; i++) {
    String word = words[i];

    TextSpan textSpan = TextSpan(
      text: word.substring(0, 1),
      style: TextStyle(
        color: Colors.yellow,
        fontSize: 18.sp,
        fontWeight: FontWeight.bold,
      ),
    );

    textSpans.add(textSpan);

    if (i < words.length - 1) {
      textSpans.add(TextSpan(
          text: "${word.substring(1)} ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          )));
    } else {
      textSpans.add(TextSpan(
          text: word.substring(1),
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.sp,
          )));
    }
  }

  return textSpans;
}
