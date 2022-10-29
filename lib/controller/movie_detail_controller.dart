import 'package:get/get.dart';
import 'package:safepedia_movie/api/api.dart';
import 'package:safepedia_movie/models/detail_movie_model.dart';

class MovieDetailController {
  API api = API();
  RxBool loading = true.obs;

  Future<DetailMovieClass?> movieDetail(int? detailID) async {
    loading(true);
    var temp = await api.getMovieDetail(detailID ?? 0);
    loading(false);
    if (temp is DetailMovieClass) {
      return temp;
    } else {
      return null;
    }
  }
}
