part of 'media_bloc.dart';

abstract class MediaState {}

final class MediaInitial extends MediaState {}

final class MoviesLoadingState extends MediaState {}

final class MoviesSuccessState extends MediaState {
  final DiscoverMovieModel discoverMovieModel;
  final bool isAdd;

  MoviesSuccessState({required this.discoverMovieModel, required this.isAdd});
}

final class MoviesErrorState extends MediaState {}

final class SeriesLoadingState extends MediaState {}

final class SeriesSuccessState extends MediaState {
  final List<SeriesModel> series;
  final bool isAdd;

  SeriesSuccessState({required this.series, required this.isAdd});
}

final class SeriesErrorState extends MediaState {}

final class DetailLoadingState extends MediaState {}

final class DetailSucessState extends MediaState {
  final MovieDetailsModel? movieDetailsModel;
  final SerieDetailsModel? serieDetailsModel;

  DetailSucessState({this.movieDetailsModel, this.serieDetailsModel});
}

final class DetailErrorState extends MediaState {}

final class FetchInfosLoading extends MediaState {}

final class FetchInfosSuccess extends MediaState {
  final List<MovieModel> trendingMovies;
  final List<MovieModel> watchContinueMovies;
  final List<MovieModel> recommendedMovies;
  final List<People> people;

  final String urlBannerHome;

  FetchInfosSuccess({
    required this.trendingMovies,
    required this.urlBannerHome,
    required this.watchContinueMovies,
    required this.recommendedMovies,
    required this.people,
  });
}

final class FetchInfosError extends MediaState {}

final class SearchLoadingState extends MediaState {}

class SearchSuccessState extends MediaState {
  final List<MovieModel> discoverMovieModel;

  SearchSuccessState({required this.discoverMovieModel});
}

class SearchErrorState extends MediaState {
  final String message;

  SearchErrorState(this.message);
}

class LoadMoreLoadingState extends MediaState {}

final class MoviesFavoritedLoading extends MediaState {}

final class MoviesFavoritedSuccess extends MediaState {
  final List<MovieModel> movies;

  MoviesFavoritedSuccess({required this.movies});
}

final class MoviesFavoritedError extends MediaState {}
