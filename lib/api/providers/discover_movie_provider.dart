import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/api/models/discover_movie_model.dart';

class DiscoverMovieProvider {
  final HttpAdapter httpAdater;

  DiscoverMovieProvider({required this.httpAdater});

  Future<DiscoverMovieModel> getDiscoverMovie(int pagina) async {
    final url =
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=$pagina&sort_by=popularity.desc';

    final response = await httpAdater.get(url: url);

    return DiscoverMovieModel.fromJson(response);
  }
}
