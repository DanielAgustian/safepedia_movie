import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:safepedia_movie/constant/const.dart';

class GenreBox extends StatelessWidget {
  final String title;

  const GenreBox({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 5.w, 5.w),
        padding: EdgeInsets.symmetric(vertical: 7.w, horizontal: 16.w),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 1, color: primeRed)),
        child: Text(
          title,
          style: TextStyle(
              fontSize: size.width > 1000 ? 22 : 12.sp, color: primeRed),
        ));
  }
}
