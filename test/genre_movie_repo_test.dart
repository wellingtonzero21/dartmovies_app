import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/genre_movie_model.dart';
import 'package:dart_movies_app/repositories/genre_movie_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// dart run build_runner watch --build-filter=test/some_test.dart
import 'genre_movie_repo_test.mocks.dart';

@GenerateMocks([HttpAdapter])
void main() {
  group('getGenreMovie', () {
    test('throws an exception if the http call completes with an error', () {
      final httpAdapter = MockHttpAdapter();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided HttpAdapter.
      when(httpAdapter.get(
              url:
                  'https://api.themoviedb.org/3/genre/movie/list?language=pt-BR'))
          .thenThrow(Exception('Failed to load movies'));

      final repository = GenreMovieRepository(httpAdapter);

      expect(repository.getGenreMovie(), throwsException);
    });

    test('returns a DiscoverMovieModel if the http call completes successfully',
        () async {
      final httpAdapter = MockHttpAdapter();

      when(httpAdapter.get(
              url:
                  'https://api.themoviedb.org/3/genre/movie/list?language=pt-BR'))
          .thenAnswer((_) async => {
                "genres": [
                  {"id": 28, "name": "Action"},
                  {"id": 12, "name": "Abenteuer"},
                  {"id": 16, "name": "Animation"},
                  {"id": 37, "name": "Western"}
                ]
              });

      final repository = GenreMovieRepository(httpAdapter);

      expect(await repository.getGenreMovie(), isA<GenreMovieModel>());
    });
  });
}
