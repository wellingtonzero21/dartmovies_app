import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/discover_series_model.dart';

class SeriesRepository {
  final HttpAdapter httpAdater;

  SeriesRepository({required this.httpAdater});

  Future<DiscoverSeriesModel> getSeries(int page, int genre) async {
    String genreFilter = '';

    if (genre != 0) {
      genreFilter = '&with_genres=$genre';
    }

    String url =
        'https://api.themoviedb.org/3/discover/tv?language=pt-br&page=$page$genreFilter';

    final response = await httpAdater.get(url: url);

    return DiscoverSeriesModel.fromJson(response);
  }
}
