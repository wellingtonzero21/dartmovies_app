import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/discover_movie_model.dart';

class SearchMovieRepository {
  final HttpAdapter httpAdater;

  SearchMovieRepository({required this.httpAdater});

  Future<DiscoverMovieModel> getSearchMovie(String text, int page) async {
    final url =
        'https://api.themoviedb.org/3/search/movie?query=$text&include_adult=false&language=pt-BR&page=$page';

    final response = await httpAdater.get(url: url);

    return DiscoverMovieModel.fromJson(response);
  }
}
