import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/discover_movie_model.dart';
import 'package:dart_movies_app/models/genre_movie_model.dart';
import 'package:dart_movies_app/models/movie_details_model.dart';
import 'package:dart_movies_app/models/serie_details_model.dart';
import 'package:dart_movies_app/models/discover_series_model.dart';
import 'package:dart_movies_app/models/series_model.dart';
import 'package:dart_movies_app/others/service_hive.dart';
import 'package:dart_movies_app/repositories/discover_movie_repository.dart';
import 'package:dart_movies_app/repositories/genre_movie_repository.dart';
import 'package:dart_movies_app/repositories/movie_details_repository.dart';
import 'package:dart_movies_app/repositories/series_details.dart';
import 'package:dart_movies_app/models/media_model.dart';
import 'package:dart_movies_app/models/trending_movies_model.dart';
import 'package:dart_movies_app/models/trending_people_model.dart';
import 'package:dart_movies_app/repositories/recommended_movie_repository.dart';
import 'package:dart_movies_app/repositories/series_repository.dart';
import 'package:dart_movies_app/repositories/trending_movie_repository.dart';
import 'package:dart_movies_app/repositories/trending_people_repository.dart';
import 'package:dart_movies_app/repositories/search_movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  DiscoverMovieRepository movieRepository = DiscoverMovieRepository();
  MovieDetailsRepository movieDetailsRepository = MovieDetailsRepository();
  SerieDetailsRepository serieDetailsRepository = SerieDetailsRepository();
  TrendingMoviesRepository trendingRepository =
      TrendingMoviesRepository(httpAdater: HttpAdapter());
  DiscoverMovieRepository watchContinueRepository = DiscoverMovieRepository();
  RecommendedMovieRepository recommendedMovieRepository =
      RecommendedMovieRepository();
  TrendingPeopleRepository trendingPeopleRepository =
      TrendingPeopleRepository(httpAdater: HttpAdapter());
  SearchMovieRepository searchRepository = SearchMovieRepository();
  GenreMovieRepository genremovieRepository = GenreMovieRepository();
  SeriesRepository seriesRepository =
      SeriesRepository(httpAdater: HttpAdapter());

  ServiceHive serviceHive = ServiceHive();

  late List<MovieModel> movieList = [];
  late List<GenreMovieModelList> genremovieList = [];

  MediaBloc() : super(MediaInitial()) {
    on<GetMoviesEvent>((event, emit) async {
      try {
        if (event.page == 1) {
          emit(MoviesLoadingState());

          DiscoverMovieModel discoverMovieModel =
              await movieRepository.getDiscoverMovie(event.page, event.genre);

          emit(MoviesSuccessState(
              discoverMovieModel: discoverMovieModel, isAdd: false));
        } else if (event.page > 1) {
          DiscoverMovieModel discoverMovieModel =
              await movieRepository.getDiscoverMovie(event.page, event.genre);

          emit(MoviesSuccessState(
              discoverMovieModel: discoverMovieModel, isAdd: true));
        }
      } catch (e) {
        emit(MoviesErrorState());
      }
    });

    on<GetSeriesEvent>((event, emit) async {
      try {
        if (event.page == 1) {
          emit(SeriesLoadingState());

          DiscoverSeriesModel seriesModel =
              await seriesRepository.getSeries(event.page);

          emit(SeriesSuccessState(
              series: seriesModel.results ?? [], isAdd: false));
        } else if (event.page > 1) {
          DiscoverSeriesModel seriesModel =
              await seriesRepository.getSeries(event.page);

          emit(SeriesSuccessState(
              series: seriesModel.results ?? [], isAdd: true));
        }
      } catch (e) {
        emit(SeriesErrorState());
      }
    });

    on<FetchInfosHomePage>(
      (event, emit) async {
        try {
          emit(FetchInfosLoading());

          TrendingMoviesModel trendingMoviesModel =
              await trendingRepository.getTrendingMovies();
          String urlBannerHome =
              'https://image.tmdb.org/t/p/w300${trendingMoviesModel.results?.first.backdropPath}';

          DiscoverMovieModel watchContinueModel =
              await watchContinueRepository.getDiscoverMovie(1, 0);

          DiscoverMovieModel recommendedsMoviesModel =
              await recommendedMovieRepository.getRecommendedMovie();

          TrendingPeopleModel trendingPeopleModel =
              await trendingPeopleRepository.getTrendingPeople();

          emit(FetchInfosSuccess(
            trendingMovies: trendingMoviesModel.results ?? [],
            watchContinueMovies: watchContinueModel.results ?? [],
            recommendedMovies: recommendedsMoviesModel.results ?? [],
            people: trendingPeopleModel.results ?? [],
            urlBannerHome: urlBannerHome,
          ));
        } catch (e) {
          emit(FetchInfosError());
        }
      },
    );

    on<FetchMovies>(_onFetchMovies);
    on<LoadMoreMovies>(_onLoadMoreMovies);
    on<SearchMovieEvent>(_onSearchMovies);
    on<GetGenreMoviesEvent>(_onGetGenreMoviesEvent);

    on<GetDetaisMediaEvent>(
      (event, emit) async {
        try {
          emit(DetailLoadingState());

          if (event.isSerie == true) {
            SerieDetailsModel serieDetailsModel =
                await serieDetailsRepository.getSerieDetail(event.id);

            emit(DetailSucessState(serieDetailsModel: serieDetailsModel));
          } else {
            MovieDetailsModel movieDetailsModel =
                await movieDetailsRepository.getMovieDetail(event.id);

            emit(DetailSucessState(movieDetailsModel: movieDetailsModel));
          }
        } catch (e) {
          emit(DetailErrorState());
        }
      },
    );

    on<GetFavoritedMovies>((event, emit) async {
      try {
        emit(MoviesFavoritedLoading());

        emit(MoviesFavoritedSuccess(
            movies: await serviceHive.getMoviesFavorited()));
      } catch (e) {
        emit(MoviesFavoritedError());
      }
    });
  }

  void _onFetchMovies(FetchMovies event, Emitter<MediaState> emit) async {
    emit(SearchLoadingState());
    try {
      final discoverMovieModel =
          await movieRepository.getDiscoverMovie(event.page, 0);
      movieList.addAll(discoverMovieModel.results ?? []);
      emit(SearchSuccessState(discoverMovieModel: List.from(movieList)));
    } catch (error) {
      emit(SearchErrorState(error.toString()));
    }
  }

  void _onLoadMoreMovies(LoadMoreMovies event, Emitter<MediaState> emit) async {
    emit(LoadMoreLoadingState());
    try {
      final discoverMovieModel =
          await movieRepository.getDiscoverMovie(event.page, 0);
      movieList.addAll(discoverMovieModel.results ?? []);
      emit(SearchSuccessState(discoverMovieModel: List.from(movieList)));
    } catch (error) {
      emit(SearchErrorState(error.toString()));
    }
  }

  void _onSearchMovies(SearchMovieEvent event, Emitter<MediaState> emit) async {
    emit(LoadMoreLoadingState());
    try {
      final searchMovieModel =
          await searchRepository.getSearchMovie(event.value, 1);
      movieList.addAll(searchMovieModel.results ?? []);
      emit(SearchSuccessState(discoverMovieModel: List.from(movieList)));
    } catch (error) {
      emit(SearchErrorState(error.toString()));
    }
  }

  Future favoriteMovie({required MovieModel movieModel}) async {
    if (await serviceHive.isMovieFavorited(movieModel.id!)) {
      await serviceHive.removeFavoriteMovie(movieModel.id!);
    } else {
      await serviceHive.favoriteMovie(movieModel);
    }
  }

  void _onGetGenreMoviesEvent(
      GetGenreMoviesEvent event, Emitter<MediaState> emit) async {
    emit(GenLoadingState());
    try {
      final genreMovieModel = await genremovieRepository.getGenreMovie();

      genremovieList.addAll(genreMovieModel.genres ?? []);
      emit(GenreMovieSuccessState(genreMovieModel: List.from(genremovieList)));
    } catch (error) {
      emit(GenreMovieErrorState(error.toString()));
    }
  }
}
