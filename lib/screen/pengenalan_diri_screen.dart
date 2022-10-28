import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safepedia_movie/constant/const.dart';
import 'package:safepedia_movie/screen/list_movie.dart';
import 'package:url_launcher/url_launcher.dart';

class PengenalanDiriScreen extends StatefulWidget {
  const PengenalanDiriScreen({
    Key? key,
  }) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<PengenalanDiriScreen> createState() => _PengenalanDiriScreenState();
}

class _PengenalanDiriScreenState extends State<PengenalanDiriScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primeBlue,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.chevronLeft,
                size: size.width > 1000 ? 28 : 16.sp,
              ),
            ),
          ),
          centerTitle: true,
          title: Text(
            'Pengenalan Diri',
            style: TextStyle(color: Colors.yellow[700]),
          ),
        ),
        backgroundColor: colorBackground,
        body: SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                CircleAvatar(
                  backgroundColor: primeRed,
                  backgroundImage: const AssetImage('asset/image/profile.png'),
                  radius: size.width > 600 ? 300 : 0.265 * size.width,
                ),
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Daniel Agustian Yoali',
                  style: TextStyle(
                      color: primeBlue,
                      fontWeight: FontWeight.w700,
                      fontSize: size.width > 1000 ? 36 : 20.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Card(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Tanggal lahir',
                              style: TextStyle(
                                  fontSize: size.width > 1000 ? 20 : 12.sp,
                                  color: Colors.black45),
                            )),
                            Expanded(
                                child: Text(
                              'Jakarta, 21 Agustus 1998',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width > 1000 ? 20 : 12.sp,
                                  color: Colors.black),
                            ))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          width: size.width,
                          height: 1,
                          color: Colors.black12,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Tech Stack',
                              style: TextStyle(
                                  fontSize: size.width > 1000 ? 20 : 12.sp,
                                  color: Colors.black45),
                            )),
                            Expanded(
                                child: Text(
                              'Laravel \nFlutter\nHTML/CSS\nJavascript',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width > 1000 ? 20 : 12.sp,
                                  color: Colors.black),
                            ))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          width: size.width,
                          height: 1,
                          color: Colors.black12,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Pekerjaan Sekarang',
                              style: TextStyle(
                                  fontSize: size.width > 1000 ? 20 : 12.sp,
                                  color: Colors.black45),
                            )),
                            Expanded(
                                child: Text(
                              'Frontend Programmer di Yokesen Teknologi Indonesia \nFeb 2021 - Sekarang',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width > 1000 ? 20 : 12.sp,
                                  color: Colors.black),
                            ))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          width: size.width,
                          height: 1,
                          color: Colors.black12,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Text(
                              'Pendidikan',
                              style: TextStyle(
                                  fontSize: size.width > 1000 ? 20 : 12.sp,
                                  color: Colors.black45),
                            )),
                            Expanded(
                                child: Text(
                              'Universitas Bunda Mulia\nTeknik Informatika \n2016-2020',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: size.width > 1000 ? 20 : 12.sp,
                                  color: Colors.black),
                            ))
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          width: size.width,
                          height: 1,
                          color: Colors.black12,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Tentang Saya',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: primeBlue,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text(
                          'Nama saya adalah Daniel Agustian Yoali dan saat ini saya berumur 22 tahun. Saat ini, saya masih bekerja di Yokesen Teknologi Indonesia sebagai Frontend Programmer. \n\nSaya telah membuat banyak proyek, di antaranay adalah Warisan (Mobile dan Website), Club Sobat Badak, BKPI, Gudangin dan masih banyak lagi. \n\nSaya memiliki kemampuan di bidang Frontend, Backend dan Mobile Development. \n\nSaya menyukai meriset dan mencari informasi tentang teknologi-teknologi terbaru.',
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: size.width > 1000 ? 20 : 12.sp),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  width: size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 15.w),
                          primary: primeBlue,
                          onPrimary: colorBackground),
                      onPressed: () {
                        launchUrl(Uri.parse(
                            'https://www.linkedin.com/in/daniel-agustian-5755481b9/'));
                      },
                      child: Text(
                        'Profil Linkedin Saya',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width > 1000 ? 34 : 18.sp),
                      )),
                ),
                SizedBox(height: 10.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  width: size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          padding: EdgeInsets.symmetric(
                              vertical: 12.h, horizontal: 15.w),
                          primary: Colors.black87,
                          onPrimary: colorBackground),
                      onPressed: () {
                        launchUrl(Uri.parse(
                            'https://github.com/DanielAgustian?tab=repositories'));
                      },
                      child: Text(
                        'Profil Github Saya',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width > 1000 ? 34 : 18.sp),
                      )),
                ),
                SizedBox(
                  height: 15.h,
                )
              ],
            ),
          ),
        ));
  }
}
