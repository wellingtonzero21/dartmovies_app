import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/discover_movie_model.dart';

class RecommendedMovieRepository {
  final HttpAdapter httpAdater = HttpAdapter();

  Future<DiscoverMovieModel> getRecommendedMovie() async {
    const url = 'https://api.themoviedb.org/3/movie/top_rated?language=pt-br';

    final response = await httpAdater.get(url: url);

    return DiscoverMovieModel.fromJson(response);
  }
}
