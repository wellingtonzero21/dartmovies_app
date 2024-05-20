import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/api/models/series_model.dart';

class SeriesProvider {
  final HttpAdapter httpAdater;

  SeriesProvider({required this.httpAdater});

  Future<SeriesProviderModel> getTrendingMovies() async {
    const url =
        'https://api.themoviedb.org/3/discover/tv?include_adult=false&include_null_first_air_dates=false&language=pt-BR&page=1&sort_by=vote_count.desc';

    final response =
        await httpAdater.get(url: url, queryParams: {'language': 'pt-BR'});

    return SeriesProviderModel.fromJson(response);
  }
}
