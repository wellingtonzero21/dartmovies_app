import 'package:dart_movies_app/models/discover_movie_model.dart';
import 'package:dart_movies_app/models/movie_details_model.dart';
import 'package:dart_movies_app/models/serie_details_model.dart';
import 'package:dart_movies_app/repositories/discover_movie_repository.dart';
import 'package:dart_movies_app/repositories/movie_details_repository.dart';
import 'package:dart_movies_app/repositories/series_details.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  DiscoverMovieRepository movieRepository = DiscoverMovieRepository();
  MovieDetailsRepository movieDetailsRepository = MovieDetailsRepository();
  SerieDetailsRepository serieDetailsRepository = SerieDetailsRepository();

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

    //TODO: Criar evento para trazer series já pereparado para paginação

    //TODO: Criar evento para trazer banner inicio, filmes continue assistindo, em alta, recomendados e atores.

    on<GetDetaisMediaEvent>((event, emit) async {
      try {
        emit(DetailLoadingState());

        if (event.isSerie == true) {
          SerieDetailsModel serieDetailsModel =
              await serieDetailsRepository.getSerieDetail(event.id);

          emit(DetailSucessState(serieDetailsModel: serieDetailsModel));
        } else {
          MovieDetailsModel movieDetailsModel =
              await movieDetailsRepository.getMovieDetail(event.id);

          emit(DetailSucessState(movieDetailsModel: movieDetailsModel));
        }
      } catch (e) {
        emit(DetailErrorState());
      }
    }); //TODO: evento para trazer detalhes da midia

    //TODO: Criar evento para favoritar

    //TODO: Criar evento para trazer os filmes favoritados
  }
}
