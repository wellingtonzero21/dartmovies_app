import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/discover_movie_model.dart';

class DiscoverMovieRepository {
  DiscoverMovieRepository();

  final HttpAdapter httpAdater = HttpAdapter();

  Future<DiscoverMovieModel> getDiscoverMovie(int pagina, int genre) async {
    String genreFilter = '';

    if (genre != 0) {
      genreFilter = '&with_genres=$genre';
    }
    final url =
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=pt-BR&page=$pagina&sort_by=popularity.desc$genreFilter';

    final response = await httpAdater.get(url: url);

    return DiscoverMovieModel.fromJson(response);
  }
}
