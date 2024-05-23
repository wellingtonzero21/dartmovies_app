import 'package:dart_movies_app/models/discover_movie_model.dart';
import 'package:dart_movies_app/repositories/discover_movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  DiscoverMovieRepository movieRepository = DiscoverMovieRepository();

  MediaBloc() : super(MediaInitial()) {
    on<GetMediasEvent>((event, emit) async {
      try {
        if (event.page == 1) {
          emit(MediaLoadingState());

          DiscoverMovieModel discoverMovieModel =
              await movieRepository.getDiscoverMovie(event.page);

          emit(MediaSuccessState(
              discoverMovieModel: discoverMovieModel, isAdd: false));
        } else if (event.page > 1) {
          DiscoverMovieModel discoverMovieModel =
              await movieRepository.getDiscoverMovie(event.page);

          emit(MediaSuccessState(
              discoverMovieModel: discoverMovieModel, isAdd: true));
        }
      } catch (e) {
        emit(MediaErrorState());
      }
    });

    // on<GetDetaisMediaEvent>((event, emit) {});
  }
}
