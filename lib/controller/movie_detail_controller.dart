import 'package:safepedia_movie/api/api.dart';
import 'package:safepedia_movie/models/detail_movie_model.dart';

class MovieDetailController {
  API api = API();

  Future<DetailMovieClass?> movieDetail(int? detailID) async {
    var temp = await api.getMovieDetail(detailID ?? 0);
    if (temp is DetailMovieClass) {
      return temp;
    } else {
      return null;
    }
  }
}
