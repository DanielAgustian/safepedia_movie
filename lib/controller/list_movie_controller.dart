import 'package:get/get.dart';
import 'package:safepedia_movie/api/api.dart';
import 'package:safepedia_movie/models/detail_movie_model.dart';
import 'package:safepedia_movie/models/list_movie_model.dart';

class ListMovieController extends GetxController {
  API api = API();

  Future<List<Results>?> list(int page) async {
    var temp = await api.getListMovie(page);
    if (temp is ListMovieClass) {
      return temp.results;
    } else {
      return [];
    }
  }
}
