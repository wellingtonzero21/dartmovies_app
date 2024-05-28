import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/discover_movie_model.dart';

class DiscoverMovieRepository {
  DiscoverMovieRepository();

  final HttpAdapter httpAdater = HttpAdapter();

  Future<DiscoverMovieModel> getDiscoverMovie(int pagina) async {
    final url =
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=pt-BR&page=$pagina&sort_by=popularity.desc';

    final response = await httpAdater.get(url: url);

    return DiscoverMovieModel.fromJson(response);
  }
}
