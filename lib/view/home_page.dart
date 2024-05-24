import 'package:dart_movies_app/bloc/media/media_bloc.dart';
import 'package:dart_movies_app/models/media_model.dart';
import 'package:dart_movies_app/models/movie_details_model.dart';
import 'package:dart_movies_app/models/trending_people_model.dart';
import 'package:dart_movies_app/repositories/discover_movie_repository.dart';
import 'package:dart_movies_app/repositories/movie_details_repository.dart';
import 'package:dart_movies_app/repositories/trending_movie_repository.dart';
import 'package:dart_movies_app/components/recommended_list.dart';
import 'package:dart_movies_app/models/media_model_v1.dart';
import 'package:dart_movies_app/view/detail_page.dart';
import 'package:dart_movies_app/view/search_page.dart';
import 'package:flutter/material.dart';
import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components/actor_card.dart';
import '../components/banner_card.dart';
import '../components/long_card.dart';
import '../components/small_card.dart';
import '../components/trending_movies_list.dart';

class HomePage extends StatefulWidget {
  final MovieDetailsRepository movieDetailsProvider =
      MovieDetailsRepository(httpAdater: HttpAdapter());
  final DiscoverMovieRepository watchContinueProvider =
      DiscoverMovieRepository();
  final TrendingMoviesRepository trendingProvider =
      TrendingMoviesRepository(httpAdater: HttpAdapter());
  final DiscoverMovieRepository allMoviesProvider = DiscoverMovieRepository();

  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late MediaBloc mediaBloc;

  late List<MovieDetailsModel> moviedetailsList = [];
  late List<MediaModel> movieListWC = [];
  late List<MediaModel> trendingMovies = [];
  late List<People> allPeople = [];
  late List<MediaModel> allMovies = [];
  String imageInicioTop = '';
  final ScrollController _scrollControllerMovies = ScrollController();
  int pageMovie = 1;

  @override
  void initState() {
    super.initState();
    _fetchDetails();
    _fetchTrendingMovies();

    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_handleTabSelection);

    mediaBloc = BlocProvider.of<MediaBloc>(context);
    _scrollControllerMovies.addListener(_scrollListener);
  }

  void _handleTabSelection() {
    if (_tabController.index == 1) {
      pageMovie = 1;
      mediaBloc.add(GetMediasEvent(page: pageMovie));
    }
  }

  void _scrollListener() {
    if (_scrollControllerMovies.position.pixels ==
        _scrollControllerMovies.position.maxScrollExtent) {
      pageMovie++;
      mediaBloc.add(GetMediasEvent(page: pageMovie));
    }
  }

  Future<void> _fetchTrendingMovies() async {
    final trendingProvider =
        TrendingMoviesRepository(httpAdater: HttpAdapter());
    final trendingMoviesModel =
        await trendingProvider.getTrendingMovies(); //TrendingMovies

    // final allMoviesProvider = DiscoverMovieRepository();

    // final allMoviesModel =
    // await allMoviesProvider.getDiscoverMovie(1); //TodosFilmes
    setState(() {
      trendingMovies = trendingMoviesModel.results ?? [];
      // allMovies = allMoviesModel.results ?? [];
    });
  }

  Future<void> _fetchDetails() async {
    int id = 120;
    final movieDetailsModel =
        await widget.movieDetailsProvider.getMovieDetail(id);
    setState(() {
      imageInicioTop = movieDetailsModel.backdropPath;
    });
    return;
  }

  Future<List<MediaModel>> fetchWatchContinue() async {
    try {
      int page = 1;
      final watchContinueModel =
          await widget.watchContinueProvider.getDiscoverMovie(page);
      return watchContinueModel.results ?? [];
    } catch (e) {
      // Handle error case
      return [];
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
                  )),
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
          tabs: const [
            Tab(text: 'Início'),
            Tab(text: 'Filmes'),
            Tab(text: 'Séries'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: imageInicioTop.isNotEmpty
                      ? BannerCard(
                          url: 'https://image.tmdb.org/t/p/w300$imageInicioTop')
                      : const CircularProgressIndicator(),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 20),
                  child: Text(
                    'Continuar assistindo',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                FutureBuilder<List<MediaModel>>(
                  future: fetchWatchContinue(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return const Text('Erro ao carregar dados');
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Text('Nenhum filme para continuar');
                    } else {
                      final movieListWC = snapshot.data!;
                      return Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: SizedBox(
                          height: 160,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4, //movieListWC.length,
                            itemBuilder: (context, index) {
                              MediaModel watchedMedia = movieListWC[index];
                              return Padding(
                                padding: EdgeInsets.only(
                                    left: watchedMedia == movieListWC.first
                                        ? 15
                                        : 0,
                                    right: 20),
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
                      );
                    }
                  },
                ),
                //TODO: Criar lista de filmes ou series favorita se for vazia não exibir
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
                  child: RecommendedList(movie: allMovies),
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
                    height: 120,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: listActors.length,
                      itemBuilder: (context, index) {
                        //People people = allPeople[index];

                        return Padding(
                          padding: EdgeInsets.only(
                            left:
                                listActors.first == listActors[index] ? 15 : 0,
                            right: 15,
                          ),
                          child: ActorCard(
                            imageUrl: listActors[index]['url'],
                            nome: listActors[index]['name'],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocConsumer<MediaBloc, MediaState>(
            listener: (context, state) {
              if (state is MediaSuccessState) {
                if (state.isAdd) {
                  allMovies.addAll(state.discoverMovieModel.results ?? []);
                } else {
                  allMovies = state.discoverMovieModel.results ?? [];
                }
              }
            },
            builder: (context, state) {
              if (state is MediaLoadingState) {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                );
              }

              return Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollControllerMovies,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 35 / 50,
                      ),
                      itemCount: allMovies.length,
                      itemBuilder: (context, index) {
                        MediaModel movies = allMovies[index];

                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(id: movies.id ?? 0),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(6),
                            child: SmallCard(
                              imageUrl:
                                  "https://media.themoviedb.org/t/p/w220_and_h330_face${movies.posterPath}",
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 35 / 50,
            ),
            itemCount: allMovies.length,
            itemBuilder: (context, index) {
              MediaModel movie = allMovies[index];

              return GestureDetector(
                onTap: () {
                  /* Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                media: movies,
                              )),
                    ); */
                },
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: SmallCard(
                    imageUrl:
                        "https://media.themoviedb.org/t/p/w220_and_h330_face${movie.posterPath}",
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
