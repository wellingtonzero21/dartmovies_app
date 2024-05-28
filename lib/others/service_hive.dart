import 'dart:convert';
import 'package:dart_movies_app/models/media_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class ServiceHive {
  late Box box;

  Future<void> init() async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    box = await Hive.openBox('myBox');
  }

  Future<void> favoriteMovie(MovieModel movieModel) async {
    if (Hive.isBoxOpen('myBox')) {
      await init();
    }

    List<MovieModel> listMoviesFavorites = await getMoviesFavorited();

    if (!listMoviesFavorites.any((movie) => movie.id == movieModel.id)) {
      listMoviesFavorites.add(movieModel);

      String jsonListMovies = jsonEncode(
          listMoviesFavorites.map((movie) => movie.toJson()).toList());

      await box.put('favoriteMovies', jsonListMovies);
    }
  }

  Future<void> removeFavoriteMovie(int movieId) async {
    if (Hive.isBoxOpen('myBox')) {
      await init();
    }
    List<MovieModel> listMoviesFavorites = await getMoviesFavorited();

    listMoviesFavorites.removeWhere(
      (movie) => movie.id == movieId,
    );

    String jsonListMovies =
        jsonEncode(listMoviesFavorites.map((movie) => movie.toJson()).toList());

    await box.put('favoriteMovies', jsonListMovies);
  }

  Future<List<MovieModel>> getMoviesFavorited() async {
    if (Hive.isBoxOpen('myBox')) {
      await init();
    }

    String? favoriteMoviesJson = box.get('favoriteMovies');

    if (favoriteMoviesJson != null && favoriteMoviesJson.isNotEmpty) {
      List<dynamic> jsonList = jsonDecode(favoriteMoviesJson);

      return jsonList.map((json) => MovieModel.fromJson(json)).toList();
    }

    return [];
  }

  Future<bool> isMovieFavorited(int movieId) async {
    if (Hive.isBoxOpen('myBox')) {
      await init();
    }

    List<MovieModel> listMoviesFavorites = await getMoviesFavorited();
    return listMoviesFavorites.any((movie) => movie.id == movieId);
  }
}
