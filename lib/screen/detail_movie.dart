import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:safepedia_movie/component/empty_internet.dart';
import 'package:safepedia_movie/component/misc_comp.dart';
import 'package:safepedia_movie/constant/const.dart';
import 'package:safepedia_movie/controller/movie_detail_controller.dart';
import 'package:safepedia_movie/models/detail_movie_model.dart';

class DetailMovie extends StatefulWidget {
  const DetailMovie({Key? key, required this.id}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final int id;

  @override
  State<DetailMovie> createState() => _DetailMovieState();
}

class _DetailMovieState extends State<DetailMovie> {
  final MovieDetailController _movieDetailController =
      Get.put(MovieDetailController());
  bool internet = true;
  DetailMovieClass? movie;
  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    DetailMovieClass? temp =
        await _movieDetailController.movieDetail(widget.id);
    setState(() {
      movie = temp;
    });
    checkInternetConnection();
  }

  void checkInternetConnection() async {
    bool result = await InternetConnectionChecker().hasConnection;

    setState(() {
      internet = result;
    });
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
          'Detail Movie',
          style: TextStyle(
              color: Colors.yellow[700],
              fontSize: size.width > 760 ? 30 : 17.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          initData();
        },
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: !internet
                  ? emptyInternet(size, () {
                      initData();
                    })
                  : Obx(
                      () => _movieDetailController.loading.value ||
                              movie == null
                          ? SizedBox(
                              width: size.width,
                              height: size.height * 0.85,
                              child: Center(
                                child: CircularProgressIndicator(
                                    color: primeRed,
                                    backgroundColor:
                                        primeRed.withOpacity(0.12)),
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                ),
                                Center(
                                  child: SizedBox(
                                    width: 135.w,
                                    child: CachedNetworkImage(
                                      imageUrl: imageString +
                                          (movie?.posterPath ?? ""),
                                      imageBuilder: (context, image) {
                                        return AspectRatio(
                                            aspectRatio: 2 / 3,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image(
                                                image: image,
                                                fit: BoxFit.fill,
                                              ),
                                            ));
                                      },
                                      placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator(
                                          color: primeBlue,
                                          backgroundColor:
                                              primeBlue.withOpacity(0.1),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const AspectRatio(
                                              aspectRatio: 2 / 3,
                                              child: AspectRatio(
                                                  aspectRatio: 2 / 3,
                                                  child: Image(
                                                    image: NetworkImage(
                                                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),
                                                    fit: BoxFit.fill,
                                                  ))),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 25.h,
                                ),
                                Text(
                                  movie?.title ?? '',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: primeBlue,
                                      fontSize: size.width > 1000 ? 38 : 22.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  movie!.tagline ?? "",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: size.width > 1000 ? 24 : 14.sp),
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  'Rating',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.width > 1000 ? 24 : 16.sp),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.solidStar,
                                      color: Colors.yellow,
                                      size: size.width > 1000 ? 30 : 18.sp,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Flexible(
                                        child: Text(
                                      movie!.voteAverage.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize:
                                              size.width > 1000 ? 30 : 18.sp,
                                          color: Colors.yellow[700]),
                                    ))
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  'Genres',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.width > 1000 ? 24 : 16.sp),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Wrap(
                                  children: [
                                    ...?movie?.genres!.map((ele) =>
                                        GenreBox(title: ele.name ?? ''))
                                  ],
                                ),
                                SizedBox(
                                  height: 15.h,
                                ),
                                Text(
                                  'Runtime',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: size.width > 1000 ? 24 : 16.sp),
                                ),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Text(
                                  '${movie!.runtime} menit',
                                  style: TextStyle(
                                      color: primeBlue,
                                      fontSize: size.width > 1000 ? 24 : 16.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 30.h,
                                ),
                                miscInfo(size)
                              ],
                            ),
                    )),
        ),
      ),
    );
  }

  Widget miscInfo(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              'Movie Info',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: size.width > 1000 ? 28 : 18.sp,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
                child: Container(
              color: primeBlue,
              height: 20.h,
              width: double.infinity,
            ))
          ],
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          'Description',
          style: TextStyle(
              color: Colors.black,
              fontSize: size.width > 1000 ? 24 : 16.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          '${movie!.overview}',
          style: TextStyle(
              color: Colors.black54,
              fontSize: size.width > 1000 ? 22 : 14.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          'Release Date',
          style: TextStyle(
              color: Colors.black,
              fontSize: size.width > 1000 ? 24 : 16.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          '${movie!.releaseDate}',
          style: TextStyle(
              color: Colors.black54,
              fontSize: size.width > 1000 ? 22 : 14.sp,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 25.h,
        )
      ],
    );
  }
}
