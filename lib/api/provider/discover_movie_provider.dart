import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/api/models/discover_movie_model.dart';

class DiscoverMovieProvider {
  final HttpAdapter httpAdater;

  DiscoverMovieProvider({required this.httpAdater});

  Future<DiscoverMovieModel> getDiscoverMovie() async {
    const url =
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=pt-BR&page=1&sort_by=popularity.desc';

    final response = await httpAdater.get(url: url);

    return DiscoverMovieModel.fromJson(response);
  }
}
