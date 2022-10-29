import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:safepedia_movie/constant/const.dart';

class MovieBox extends StatelessWidget {
  final String title;
  final bool grid;
  final String picture;
  final String rating;
  final String overview;
  final Function onClick;
  const MovieBox(
      {super.key,
      required this.title,
      required this.grid,
      required this.picture,
      required this.rating,
      required this.overview,
      required this.onClick});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        onClick();
      },
      child: !grid
          ? Container(
              margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
              width: size.width - 20.w,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    SizedBox(
                      width: 90.w,
                      child: CachedNetworkImage(
                        imageUrl: imageString + picture,
                        imageBuilder: (context, image) {
                          return AspectRatio(
                              aspectRatio: 2 / 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    bottomLeft: Radius.circular(12)),
                                child: Image(
                                  image: image,
                                  fit: BoxFit.fill,
                                ),
                              ));
                        },
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: primeBlue,
                            backgroundColor: primeBlue.withOpacity(0.1),
                          ),
                        ),
                        errorWidget: (context, url, error) => const AspectRatio(
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
                    SizedBox(
                      width: 10.w,
                    ),
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: size.width > 1000 ? 28 : 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          children: [
                            FaIcon(
                              FontAwesomeIcons.solidStar,
                              color: Colors.yellow,
                              size: size.width > 1000 ? 28 : 16.sp,
                            ),
                            SizedBox(
                              width: 6.w,
                            ),
                            Flexible(
                                child: Text(
                              '$rating',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.width > 1000 ? 28 : 16.sp,
                                  color: Colors.yellow[700]),
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Text(
                          overview,
                          maxLines: 3,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: size.width > 1000 ? 24 : 12.sp,
                              color: Colors.black45),
                        )
                      ],
                    )),
                    SizedBox(
                      width: 10.w,
                    ),
                  ],
                ),
              ),
            )
          : Container(
              margin: EdgeInsets.symmetric(vertical: 8.h, horizontal: 7.w),
              width: size.height > 1000
                  ? 0.25 * size.width - 30.w
                  : size.width > 768
                      ? 0.32 * size.width - 24.w
                      : 0.5 * size.width - 18.w,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: imageString + picture,
                      imageBuilder: (context, image) {
                        return Center(
                          child: AspectRatio(
                              aspectRatio: 2 / 3,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                child: Image(
                                  image: image,
                                  fit: BoxFit.fill,
                                ),
                              )),
                        );
                      },
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator(
                          color: primeBlue,
                          backgroundColor: primeBlue.withOpacity(0.1),
                        ),
                      ),
                      errorWidget: (context, url, error) => const AspectRatio(
                          aspectRatio: 2 / 3,
                          child: AspectRatio(
                              aspectRatio: 2 / 3,
                              child: Image(
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_640.png'),
                                fit: BoxFit.fill,
                              ))),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.w, vertical: 10.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: size.width > 1000 ? 24 : 14.sp,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              FaIcon(
                                FontAwesomeIcons.solidStar,
                                color: Colors.yellow,
                                size: size.width > 1000 ? 28 : 16.sp,
                              ),
                              SizedBox(
                                width: 6.w,
                              ),
                              Flexible(
                                  child: Text(
                                '$rating',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: size.width > 1000 ? 26 : 14.sp,
                                    color: primaryYellow),
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
