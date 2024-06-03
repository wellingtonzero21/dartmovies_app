part of 'media_bloc.dart';

abstract class MediaEvent {}

final class GetMoviesEvent extends MediaEvent {
  final int page;
  final int genre;

  GetMoviesEvent({required this.page, this.genre = 0});
}

final class GetSeriesEvent extends MediaEvent {
  final int page;
  final int genre;

  GetSeriesEvent({required this.page, this.genre = 0});
}

final class GetDetaisMediaEvent extends MediaEvent {
  final int id;
  final bool isSerie;

  GetDetaisMediaEvent({required this.id, this.isSerie = false});
}

class FetchMovies extends MediaEvent {
  final int page;

  FetchMovies(this.page);
}

class LoadMoreMovies extends MediaEvent {
  final int page;

  LoadMoreMovies(this.page);
}

class SearchMovieEvent extends MediaEvent {
  final String value;

  SearchMovieEvent(this.value);
}

final class FetchInfosHomePage extends MediaEvent {}

final class GetFavoritedMovies extends MediaEvent {}

final class GetGenreMoviesEvent extends MediaEvent {}

final class GetGenreSeriesEvent extends MediaEvent {}
