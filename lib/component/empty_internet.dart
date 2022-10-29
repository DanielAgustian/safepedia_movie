import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safepedia_movie/constant/const.dart';

Widget emptyInternet(Size size, Function onClick) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      FaIcon(
        FontAwesomeIcons.faceDizzy,
        size: size.width > 500 ? 120 : 80,
        color: primeRed,
      ),
      SizedBox(
        height: 15.h,
      ),
      Text(
        'Oops, Seems Like Your Internet is Down!',
        textAlign: TextAlign.center,
        style: TextStyle(
            color: primeRed,
            fontSize: size.width > 1000 ? 36 : 22.sp,
            fontWeight: FontWeight.w600),
      ),
      SizedBox(
        height: 20.h,
      ),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
              primary: primeBlue,
              onPrimary: colorBackground),
          onPressed: () {
            onClick();
          },
          child: Text(
            'Refresh',
            style: TextStyle(
                color: Colors.white, fontSize: size.width > 1000 ? 34 : 18.sp),
          )),
    ],
  );
}
