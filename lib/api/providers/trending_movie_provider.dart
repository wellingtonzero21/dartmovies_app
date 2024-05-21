import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/api/models/trending_movies_model.dart';

class TrendingMoviesProvider {
  final HttpAdapter httpAdater;

  TrendingMoviesProvider({required this.httpAdater});

  Future<TrendingMoviesModel> getTrendingMovies() async {
    const url = 'https://api.themoviedb.org/3/trending/all/day?language=pt-BR';

    final response = await httpAdater.get(url: url);

    return TrendingMoviesModel.fromJson(response);
  }
}

