import 'package:flutter_test/flutter_test.dart';
import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/discover_movie_model.dart';
import 'package:dart_movies_app/repositories/discover_movie_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'discover_movie_repo_test.mocks.dart';

@GenerateMocks([HttpAdapter])
void main() {
  group('getDiscoverMovie', () {
    test('returns a DiscoverMovieModel if the http call completes successfully',
        () async {
      final httpAdapter = MockHttpAdapter();

      when(httpAdapter.get(
              url:
                  'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=pt-BR&page=1&sort_by=popularity.desc'))
          .thenAnswer((_) async => {
                'page': 1,
                'results': [
                  {
                    'popularity': 512.119,
                    'vote_count': 460,
                    'video': false,
                    'poster_path': '/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg',
                    'id': 475557,
                    'adult': false,
                    'backdrop_path': '/n6bUvigpRFqSwmPp1m2YADdbRBc.jpg',
                    'original_language': 'en',
                    'original_title': 'Joker',
                    'genre_ids': [80, 18, 53],
                    'title': 'Joker',
                    'vote_average': 8.8,
                    'overview':
                        'During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.',
                    'release_date': '2019-10-04'
                  },
                ],
                'total_pages': 500,
                'total_results': 10000
              });

      final repository = DiscoverMovieRepository(httpAdapter);

      expect(
          await repository.getDiscoverMovie(1, 0), isA<DiscoverMovieModel>());
    });

    test('throws an exception if the http call completes with an error', () {
      final httpAdapter = MockHttpAdapter();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided HttpAdapter.
      when(httpAdapter.get(
              url:
                  'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=pt-BR&page=1&sort_by=popularity.desc'))
          .thenThrow(Exception('Failed to load movies'));

      final repository = DiscoverMovieRepository(httpAdapter);

      expect(repository.getDiscoverMovie(1, 0), throwsException);
    });
  });
}
