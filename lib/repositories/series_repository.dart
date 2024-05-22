import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/series_model.dart';

class SeriesRepository {
  final HttpAdapter httpAdater;

  SeriesRepository({required this.httpAdater});

  Future<SeriesProviderModel> getSeriesMovies() async {
    const url =
        'https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=pt-BR&page=1&sort_by=vote_count.desc';

    final response =
        await httpAdater.get(url: url, queryParams: {'language': 'pt-BR'});

    return SeriesProviderModel.fromJson(response);
  }
}
