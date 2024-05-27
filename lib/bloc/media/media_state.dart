part of 'media_bloc.dart';

abstract class MediaState {}

final class MediaInitial extends MediaState {}

final class MediaLoadingState extends MediaState {}

final class MediaSuccessState extends MediaState {
  final DiscoverMovieModel discoverMovieModel;
  final bool isAdd;

  MediaSuccessState({required this.discoverMovieModel, required this.isAdd});
}

final class MediaErrorState extends MediaState {}


final class FetchInfosLoading extends MediaState {}

final class FetchInfosSuccess extends MediaState {
  final List<MediaModel> trendingMovies;
  final List<MediaModel> watchContinueMovies;
  final List<MediaModel> recommendedMovies;
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
  final List<MediaModel> discoverMovieModel;

  SearchSuccessState({required this.discoverMovieModel});
}

class SearchErrorState extends MediaState {
  final String message;

  SearchErrorState(this.message);
}

class LoadMoreLoadingState extends MediaState {}
