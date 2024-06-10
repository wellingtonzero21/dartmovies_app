import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/genre_movie_model.dart';

class GenreMovieRepository {
  final HttpAdapter httpAdapter;

  GenreMovieRepository(this.httpAdapter);

  Future<GenreMovieModel> getGenreMovie() async {
    const url = 'https://api.themoviedb.org/3/genre/movie/list?language=pt-BR';

    final response = await httpAdapter.get(url: url);

    return GenreMovieModel.fromJson(response);
  }
}
