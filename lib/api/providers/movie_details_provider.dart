import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/api/models/movie_details_model.dart';

class MovieDetailsProvider {
  final HttpAdapter httpAdater;

  MovieDetailsProvider({required this.httpAdater});

  Future<MovieDetailsModel> getMovieDetail(int id) async {
    final url = 'https://api.themoviedb.org/3/movie/$id?language=pt-BR';

    final response = await httpAdater.get(url: url);

    return MovieDetailsModel.fromJson(response);
  }
}
