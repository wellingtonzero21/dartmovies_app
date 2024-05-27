part of 'media_bloc.dart';

abstract class MediaEvent {}

final class GetMediasEvent extends MediaEvent {
  final int page;

  GetMediasEvent({required this.page});
}

final class GetDetaisMediaEvent extends MediaEvent {
  final int id;
  final bool isSerie;

  GetDetaisMediaEvent({required this.id, this.isSerie = false});
}
