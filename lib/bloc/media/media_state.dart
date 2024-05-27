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

final class DetailLoadingState extends MediaState {}

final class DetailSucessState extends MediaState {
  final MovieDetailsModel? movieDetailsModel;
  final SerieDetailsModel? serieDetailsModel;

  DetailSucessState({this.movieDetailsModel, this.serieDetailsModel});
}

final class DetailErrorState extends MediaState {}
