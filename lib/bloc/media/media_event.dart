part of 'media_bloc.dart';

abstract class MediaEvent {}

final class GetMediasEvent extends MediaEvent {
  final int page;

  GetMediasEvent({required this.page});
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
// final class GetDetaisMediaEvent extends MediaEvent {}

final class FetchInfosHomePage extends MediaEvent {}
