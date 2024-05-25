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

////
final class SearchLoadingState extends MediaState {}

class SearchSuccessState extends MediaState {
  final List<MediaModel> discoverMovieModel;

  SearchSuccessState({required this.discoverMovieModel});
}

class SearchErrorState extends MediaState {
  final String message;

  SearchErrorState(this.message);
}

////
class LoadMoreLoadingState extends MediaState {}
