part of 'media_bloc.dart';

abstract class MediaState {}

final class MediaInitial extends MediaState {}

final class MediaLoadingState extends MediaState {}

final class MediaSuccessState extends MediaState {}

final class MediaErrorState extends MediaState {}

final class MediaEmptyState extends MediaState {}

final class MediaDetailLoadingState extends MediaState {}

final class MediaDetailSuccessState extends MediaState {}

final class MediaDetailErrorState extends MediaState {}

final class MediaDetailEmptyState extends MediaState {}
