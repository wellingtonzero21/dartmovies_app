import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/genre_series_model.dart';

class GenreSeriesRepository {
  GenreSeriesRepository();

  final HttpAdapter httpAdater = HttpAdapter();

  Future<GenreSeriesModel> getGenreSeries() async {
    const url = 'https://api.themoviedb.org/3/genre/tv/list?language=pt-BR';

    final response = await httpAdater.get(url: url);

    return GenreSeriesModel.fromJson(response);
  }
}
