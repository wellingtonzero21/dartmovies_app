import 'package:dart_movies_app/models/discover_movie_model.dart';
import 'package:dart_movies_app/models/media_model.dart';
import 'package:dart_movies_app/repositories/discover_movie_repository.dart';
import 'package:dart_movies_app/repositories/search_movie_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'media_event.dart';
part 'media_state.dart';

class MediaBloc extends Bloc<MediaEvent, MediaState> {
  final DiscoverMovieRepository movieRepository = DiscoverMovieRepository();
  final SearchMovieRepository searchRepository = SearchMovieRepository();
  late List<MediaModel> movieList = [];

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
    on<FetchMovies>(_onFetchMovies);
    on<LoadMoreMovies>(_onLoadMoreMovies);
    on<SearchMovieEvent>(_onSearchMovies);
    //TODO: Criar evento para trazer series já pereparado para paginação

    //TODO: Criar evento para trazer banner inicio, filmes continue assistindo, em alta, recomendados e atores.

    // on<GetDetaisMediaEvent>((event, emit) {}); //TODO: evento para trazer detalhes da midia

    //TODO: Criar evento para favoritar

    //TODO: Criar evento para trazer os filmes favoritados
  }

  void _onFetchMovies(FetchMovies event, Emitter<MediaState> emit) async {
    emit(SearchLoadingState());
    try {
      final discoverMovieModel =
          await movieRepository.getDiscoverMovie(event.page);

      movieList.addAll(discoverMovieModel.results ?? []);
      emit(SearchSuccessState(discoverMovieModel: List.from(movieList)));
    } catch (error) {
      emit(SearchErrorState(error.toString()));
    }
  }

  void _onLoadMoreMovies(LoadMoreMovies event, Emitter<MediaState> emit) async {
    emit(LoadMoreLoadingState());
    try {
      final discoverMovieModel =
          await movieRepository.getDiscoverMovie(event.page);
      movieList.addAll(discoverMovieModel.results ?? []);
      emit(SearchSuccessState(discoverMovieModel: List.from(movieList)));
    } catch (error) {
      emit(SearchErrorState(error.toString()));
    }
  }

  void _onSearchMovies(SearchMovieEvent event, Emitter<MediaState> emit) async {
    emit(LoadMoreLoadingState());
    try {
      final searchMovieModel =
          await searchRepository.getSearchMovie(event.value, 1);
      movieList.addAll(searchMovieModel.results ?? []);
      emit(SearchSuccessState(discoverMovieModel: List.from(movieList)));
    } catch (error) {
      emit(SearchErrorState(error.toString()));
    }
  }
}
