import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:safepedia_movie/component/empty_internet.dart';

import 'package:safepedia_movie/component/movie_box.dart';
import 'package:safepedia_movie/constant/const.dart';
import 'package:safepedia_movie/controller/list_movie_controller.dart';
import 'package:safepedia_movie/models/list_movie_model.dart';
import 'package:safepedia_movie/screen/detail_movie.dart';
import 'package:safepedia_movie/screen/pengenalan_diri_screen.dart';

class ListMovieScreen extends StatefulWidget {
  const ListMovieScreen({Key? key}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<ListMovieScreen> createState() => _ListMovieScreenState();
}

class _ListMovieScreenState extends State<ListMovieScreen> {
  ListMovieController listMovieController = Get.put(ListMovieController());
  int page = 1;
  List<Results> listMovie = [];
  bool grid = true;
  bool internet = true;
  DateTime currentBackPressTime = DateTime.now();
  @override
  void initState() {
    initMovie();
    checkInternetConnection();
    super.initState();
  }

  void initMovie() async {
    setState(() {
      page = 1;
    });
    listMovie.clear();

    List<Results> res = await listMovieController.list(page) ?? [];
    setState(() {
      listMovie = res;
    });
  }

  void getMorePage() async {
    setState(() {
      page++;
    });
    List<Results> res = await listMovieController.list(page) ?? [];
    setState(() {
      listMovie.addAll(res);
    });
  }

  void checkInternetConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;

    setState(() {
      internet = result;
    });
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Click again to exit');
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: primeBlue,
            splashColor: primeBlue.withOpacity(0.8),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PengenalanDiriScreen()));
            },
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.user,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
          // appBar: AppBar(
          //     toolbarHeight: size.width > 1000 ? 70 : null,
          //     automaticallyImplyLeading: false,
          //     backgroundColor: primeBlue,
          //     centerTitle: true,
          //     elevation: 0,
          //     title: Text(
          //       'Newest Movie',
          //       style: TextStyle(
          //           color: Colors.white,
          //           fontSize: size.width > 1000 ? 32 : 18.sp),
          //     )),
          backgroundColor: colorBackground,
          body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                initMovie();
                checkInternetConnection();
              },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      padding: EdgeInsets.symmetric(
                          vertical: size.width > 1000 ? 60 : 30.h,
                          horizontal: 15.w),
                      decoration: const BoxDecoration(
                        color: primeBlue,
                        borderRadius:
                            BorderRadius.only(bottomRight: Radius.circular(30)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Our Movie App',
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: colorBackground,
                                fontSize: size.width > 1000 ? 28 : 16.sp),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'New Way To See Your Beloved Movies',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: size.width > 1000 ? 26 : 20.sp,
                                color: Colors.yellow[700]),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                grid = true;
                              });
                            },
                            child: Container(
                              width: size.width > 1000 ? 80 : 40.w,
                              height: size.width > 1000 ? 80 : 40.w,
                              decoration: BoxDecoration(
                                  color: grid ? primeRed : Colors.grey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.tableCellsLarge,
                                  color: Colors.white,
                                  size: size.width > 1000 ? 40 : 25.sp,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                grid = false;
                              });
                            },
                            child: Container(
                              width: size.width > 1000 ? 80 : 40.w,
                              height: size.width > 1000 ? 80 : 40.w,
                              decoration: BoxDecoration(
                                  color: !grid ? primeRed : Colors.grey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.list,
                                  color: Colors.white,
                                  size: size.width > 1000 ? 40 : 25.sp,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    internet
                        ? Wrap(
                            children: [
                              ...listMovie.map((movie) => MovieBox(
                                    title: movie.title ?? '',
                                    grid: grid,
                                    overview: movie.overview ?? '',
                                    picture: movie.posterPath ?? '',
                                    rating: movie.voteAverage.toString(),
                                    onClick: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => DetailMovie(
                                                  id: movie.id ?? 0)));
                                    },
                                  )),
                            ],
                          )
                        : emptyInternet(size, () {
                            initMovie();
                            checkInternetConnection();
                          }),
                    Obx(() => listMovieController.loading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              color: primeBlue,
                              backgroundColor: primeBlue.withOpacity(0.1),
                            ),
                          )
                        : const SizedBox()),
                    SizedBox(
                      height: 20.h,
                    ),
                    internet
                        ? Container(
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
                                  getMorePage();
                                },
                                child: Text(
                                  'Load More',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: size.width > 1000 ? 34 : 18.sp),
                                )),
                          )
                        : SizedBox(),
                    SizedBox(
                      height: 15.h,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
