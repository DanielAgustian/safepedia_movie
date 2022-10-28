import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:safepedia_movie/constant/const.dart';
import 'package:safepedia_movie/models/detail_movie_model.dart';
import 'package:safepedia_movie/models/list_movie_model.dart';

class API {
  Future<ListMovieClass?> getListMovie(int page) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio.get(
          'https://api.themoviedb.org/3/movie/now_playing',
          queryParameters: {
            'api_key': API_KEY,
            'language': 'en-US',
            'page': page
          });
      ListMovieClass cal = ListMovieClass.fromJson(response.data);

      print(response.data);

      return cal;
    } on DioError catch (e) {
      if (kDebugMode) {
        print('Error:$e');
      }
  
      // ignore: newline-before-return
      return null;
    }
  }

  Future<DetailMovieClass?> getMovieDetail(int movieId) async {
    Dio dio = Dio();
    dio.options.headers['content-Type'] = 'application/json';
    try {
      var response = await dio
          .get('https://api.themoviedb.org/3/movie/$movieId', queryParameters: {
        'api_key': API_KEY,
        'language': 'en-US',
      });
      DetailMovieClass cal = DetailMovieClass.fromJson(response.data);

      // print(response.data);

      return cal;
    } on DioError catch (e) {
      if (kDebugMode) {
        print('Error:$e');
      }

      // ignore: newline-before-return
      return null;
    }
  }
}
