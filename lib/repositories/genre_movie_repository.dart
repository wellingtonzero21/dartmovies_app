import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/genre_movie_model.dart';

class GenreMovieRepository {
  GenreMovieRepository();

  final HttpAdapter httpAdater = HttpAdapter();

  Future<GenreMovieModel> getGenreMovie() async {
    const url = 'https://api.themoviedb.org/3/genre/movie/list?language=pt-BR';

    final response = await httpAdater.get(url: url);

    return GenreMovieModel.fromJson(response);
  }
}
