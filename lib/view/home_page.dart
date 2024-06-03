import 'package:dart_movies_app/bloc/media/media_bloc.dart';
import 'package:dart_movies_app/models/genre_movie_model.dart';
import 'package:dart_movies_app/models/genre_series_model.dart';
import 'package:dart_movies_app/models/media_model.dart';
import 'package:dart_movies_app/models/movie_details_model.dart';
import 'package:dart_movies_app/models/series_model.dart';
import 'package:dart_movies_app/models/trending_people_model.dart';
import 'package:dart_movies_app/components/recommended_list.dart';
import 'package:dart_movies_app/view/detail_page.dart';
import 'package:dart_movies_app/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../components/actor_card.dart';
import '../components/banner_card.dart';
import '../components/long_card.dart';
import '../components/small_card.dart';
import '../components/trending_movies_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late MediaBloc mediaBloc;

  List<MovieDetailsModel> moviedetailsList = [];
  List<MovieModel> watchContinueMovies = [];
  List<MovieModel> trendingMovies = [];
  List<MovieModel> recommendedMovies = [];
  List<People> allPeople = [];
  List<MovieModel> allMovies = [];
  List<SeriesModel> allSeries = [];
  List<MovieModel> favoritedMovies = [];
  List<GenreMovieModelList> genreMovies = [];
  List<GenreSeriesModelList> genreSeries = [];

  final ScrollController _scrollControllerMovies = ScrollController();
  final ScrollController _scrollControllerSeries = ScrollController();

  int pageMovie = 1;
  int pageSerie = 1;
  int genreMovieChoice = 0;

  String urlBannerHome = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);

    mediaBloc = BlocProvider.of<MediaBloc>(context);
    _scrollControllerMovies.addListener(_scrollListenerMovies);
    _scrollControllerSeries.addListener(_scrollListenerSeries);

    mediaBloc.add(FetchInfosHomePage());
  }

  void _handleTabSelection() {
    if (_tabController.index == 1) {
      pageMovie = 1;
      genreMovieChoice = 0;
      mediaBloc.add(GetMoviesEvent(page: pageMovie));
      mediaBloc.add(GetGenreMoviesEvent());
    }

    if (_tabController.index == 2) {
      pageSerie = 1;
      mediaBloc.add(GetSeriesEvent(page: pageSerie));
      mediaBloc.add(GetGenreSeriesEvent());
    }

    if (_tabController.index == 3) {
      mediaBloc.add(GetFavoritedMovies());
    }
  }

  void _scrollListenerMovies() {
    if (_scrollControllerMovies.position.pixels ==
        _scrollControllerMovies.position.maxScrollExtent) {
      pageMovie++;
      mediaBloc.add(GetMoviesEvent(page: pageMovie));
    }
  }

  void _scrollListenerSeries() {
    if (_scrollControllerSeries.position.pixels ==
        _scrollControllerSeries.position.maxScrollExtent) {
      pageSerie++;
      mediaBloc.add(GetSeriesEvent(page: pageSerie));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Row(
          children: [
            Text(
              'DartM',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Black',
                fontSize: 30,
              ),
            ),
            Icon(Icons.play_circle, size: 25, color: Colors.white),
            Text(
              'vies',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Poppins-Black',
                fontSize: 30,
              ),
            ),
          ],
        ),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchPage()),
                    );
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 35,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 6, right: 15, bottom: 6),
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/26902816?v=4',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
        bottom: TabBar(
          labelPadding: EdgeInsets.zero,
          controller: _tabController,
          indicator: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(10),
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorPadding: const EdgeInsets.only(
            top: 38,
            left: 20,
            right: 20,
            bottom: 6,
          ),
          dividerColor: Theme.of(context).colorScheme.background,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.4),
          labelStyle: const TextStyle(
            fontFamily: 'Poppins-Bold',
            fontSize: 17,
          ),
          // isScrollable: true,
          tabs: const [
            Tab(text: 'Início'),
            Tab(text: 'Filmes'),
            Tab(text: 'Séries'),
            Tab(text: 'Favoritos'),
          ],
        ),
      ),
      body: BlocListener<MediaBloc, MediaState>(
        listener: (context, state) {
          if (state is FetchInfosSuccess) {
            setState(() {
              trendingMovies = state.trendingMovies;
              watchContinueMovies = state.watchContinueMovies;
              recommendedMovies = state.recommendedMovies;
              allPeople = state.people;
              urlBannerHome = state.urlBannerHome;
            });
          }
        },
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildHomeTab(context),
            _buildMoviesTab(context),
            _buildSeriesTab(context),
            _buildFavoritedTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHomeTab(BuildContext context) {
    return BlocBuilder<MediaBloc, MediaState>(
      builder: (context, state) {
        if (state is FetchInfosLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
        }
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: urlBannerHome.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: BannerCard(url: urlBannerHome),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Text(
                  'Continuar assistindo',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 160,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: watchContinueMovies.length,
                    itemBuilder: (context, index) {
                      MovieModel watchedMedia = watchContinueMovies[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 15 : 0,
                          right: 20,
                        ),
                        child: LongCard(
                          imageUrl:
                              'https://image.tmdb.org/t/p/w200${watchedMedia.backdropPath}',
                          width: 280,
                          progress: 0.2,
                          isWatchedMedia: true,
                          title: watchedMedia.title ?? '',
                        ),
                      );
                    },
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Text(
                  'Em alta',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TrendingMoviesList(
                  trendingMovies: trendingMovies,
                  recommendeds: recommendedMovies,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Text(
                  'Recomendados',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: RecommendedList(recommendedsMovies: recommendedMovies),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                child: Text(
                  'Atores populares',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: allPeople.length,
                    itemBuilder: (context, index) {
                      People people = allPeople[index];
                      return Padding(
                        padding: EdgeInsets.only(
                          left: index == 0 ? 15 : 0,
                          right: 15,
                        ),
                        child: ActorCard(
                          imageUrl:
                              'https://media.themoviedb.org/t/p/w220_and_h330_face${people.profilePath}',
                          nome: people.name ?? '',
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMoviesTab(BuildContext context) {
    return BlocConsumer<MediaBloc, MediaState>(
      listener: (context, state) {
        if (state is MoviesSuccessState) {
          if (state.isAdd) {
            allMovies.addAll(state.discoverMovieModel.results ?? []);
          } else {
            allMovies = state.discoverMovieModel.results ?? [];
          }
        }
        if (state is GenreMovieSuccessState) {
          genreMovies = state.genreMovieModel;
        }
      },
      builder: (context, state) {
        if (state is MoviesLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
        }

        if (allMovies.isEmpty) {
          return const Center(
            child: Text(
              'Nenhum filme encontrado.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }

        return Column(
          children: [
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: genreMovies.length,
                itemBuilder: (context, index) {
                  GenreMovieModelList geMovie = genreMovies[index];
                  return Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.only(left: 7, right: 7)),
                            backgroundColor: genreMovieChoice == geMovie.id
                                ? MaterialStateProperty.all<Color>(
                                    const Color(0xFF000000))
                                : MaterialStateProperty.all<Color>(
                                    const Color(0xFF00FF65)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.0),
                                    side: BorderSide(
                                        color: Colors.green[700]!)))),
                        onPressed: () {
                          genreMovieChoice = geMovie.id ?? 0;
                          mediaBloc.add(
                              GetMoviesEvent(page: 1, genre: geMovie.id ?? 0));
                        },
                        child: genreMovieChoice == geMovie.id
                            ? Text(
                                geMovie.name ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              )
                            : Text(
                                geMovie.name ?? '',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                controller: _scrollControllerMovies,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 35 / 50,
                ),
                itemCount: allMovies.length,
                itemBuilder: (context, index) {
                  MovieModel movie = allMovies[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            movieModel: movie,
                            recommendeds: recommendedMovies,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: SmallCard(
                        imageUrl:
                            'https://media.themoviedb.org/t/p/w220_and_h330_face${movie.posterPath}',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildSeriesTab(BuildContext context) {
    return BlocConsumer<MediaBloc, MediaState>(
      listener: (context, state) {
        if (state is SeriesSuccessState) {
          if (state.isAdd) {
            allSeries.addAll(state.series);
          } else {
            allSeries = state.series;
          }
        }
        if (state is GenreSeriesSuccessState) {
          genreSeries = state.genreSeriesModel;
        }
      },
      builder: (context, state) {
        if (state is SeriesLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
        }

        if (allSeries.isEmpty) {
          return const Center(
            child: Text(
              'Nenhuma serie encontrada.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }

        return Column(
          children: [
            Container(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: genreSeries.length,
                itemBuilder: (context, index) {
                  GenreSeriesModelList geSeries = genreSeries[index];
                  return Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all<EdgeInsets>(
                                const EdgeInsets.only(left: 7, right: 7)),
                            backgroundColor: genreMovieChoice == geSeries.id
                                ? MaterialStateProperty.all<Color>(
                                    const Color(0xFF000000))
                                : MaterialStateProperty.all<Color>(
                                    const Color(0xFF00FF65)),
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(13.0),
                                    side: BorderSide(
                                        color: Colors.green[700]!)))),
                        onPressed: () {
                          genreMovieChoice = geSeries.id ?? 0;
                          mediaBloc.add(
                              GetSeriesEvent(page: 1, genre: geSeries.id ?? 0));
                        },
                        child: genreMovieChoice == geSeries.id
                            ? Text(
                                geSeries.name ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              )
                            : Text(
                                geSeries.name ?? '',
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                controller: _scrollControllerSeries,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 35 / 50,
                ),
                itemCount: allSeries.length,
                itemBuilder: (context, index) {
                  SeriesModel serie = allSeries[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => DetailPage(
                      //       id: serie.id ?? 0,
                      //       isSerie: true,
                      //     ),
                      //   ),
                      // );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: SmallCard(
                        imageUrl:
                            "https://media.themoviedb.org/t/p/w220_and_h330_face${serie.posterPath}",
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildFavoritedTab(BuildContext context) {
    return BlocConsumer<MediaBloc, MediaState>(
      listener: (context, state) {
        if (state is MoviesFavoritedSuccess) {
          favoritedMovies = state.movies;
        }
      },
      builder: (context, state) {
        if (state is MoviesFavoritedLoading) {
          return Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.secondary,
            ),
          );
        }
        if (favoritedMovies.isEmpty) {
          return const Center(
            child: Text(
              'Nenhum filme favorito encontrado.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }

        return GridView.builder(
          controller: _scrollControllerMovies,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 35 / 50,
          ),
          itemCount: favoritedMovies.length,
          itemBuilder: (context, index) {
            MovieModel movie = favoritedMovies[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      movieModel: movie,
                      recommendeds: recommendedMovies,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: SmallCard(
                  imageUrl:
                      'https://media.themoviedb.org/t/p/w220_and_h330_face${movie.posterPath}',
                ),
              ),
            );
          },
        );
      },
    );
  }
}
