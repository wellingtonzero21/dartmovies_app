import 'package:dart_movies_app/repositories/discover_movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  DiscoverMovieRepository movieRepository = DiscoverMovieRepository();

  MediaBloc() : super(MediaInitial()) {
    on<GetMediaEvent>((event, emit) async {
      emit(MediaLoadingState());

      await movieRepository.getDiscoverMovie(1);

      emit(MediaSuccessState());
    });

    on<GetDetaisMediaEvent>((event, emit) {});
  }
}
