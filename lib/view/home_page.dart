import 'package:dart_movies_app/api/models/discover_movie_model.dart';
import 'package:dart_movies_app/api/models/trending_movies.dart';
import 'package:dart_movies_app/api/models/trending_people_model.dart';
import 'package:dart_movies_app/api/provider/discover_movie_provider.dart';
import 'package:dart_movies_app/api/provider/trending_movie_provider.dart';
import 'package:dart_movies_app/components/recommended_list.dart';
import 'package:dart_movies_app/model/media_model.dart';
import 'package:dart_movies_app/view/detail_page.dart';
import 'package:dart_movies_app/view/search_page.dart';
import 'package:flutter/material.dart';

import '../api/http_adapter.dart';
import '../components/actor_card.dart';
import '../components/banner_card.dart';
import '../components/long_card.dart';
import '../components/small_card.dart';
import '../components/trending_movies_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Trending> trendingMovies = [];
  late List<Movie> allMovies = [];
  late List<People> allPeople = [];

  @override
  void initState() {
    fetchTrendingMovies();
    super.initState();
  }

  Future<void> fetchTrendingMovies() async {
    final trendingProvider = TrendingMoviesProvider(httpAdater: HttpAdapter());
    final trendingMoviesModel = await trendingProvider.getTrendingMovies();

    final allMoviesProvider = DiscoverMovieProvider(httpAdater: HttpAdapter());
    final allMoviesModel = await allMoviesProvider.getDiscoverMovie();
    setState(() {
      trendingMovies = trendingMoviesModel.results ?? [];
      allMovies = allMoviesModel.results ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
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
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, top: 20),
                    child: BannerCard(url: bannerMedia.urlLongBanner),
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
                        itemCount: listWatched.length,
                        itemBuilder: (context, index) {
                          MediaModel watchedMedia = listWatched[index];

                          return Padding(
                            padding: EdgeInsets.only(
                                left:
                                    watchedMedia == listWatched.first ? 15 : 0,
                                right: 20),
                            child: LongCard(
                              imageUrl: watchedMedia.urlLongBanner,
                              width: 280,
                              progress: 0.2,
                              isWatchedMedia: true,
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
                          People people = allPeople[index];

                          return Padding(
                            padding: EdgeInsets.only(
                              left: listActors.first == listActors[index]
                                  ? 15
                                  : 0,
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
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 35 / 50,
              ),
              itemCount: allMovies.length,
              itemBuilder: (context, index) {
                Movie movies = allMovies[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          media: movies,
                        ),
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
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 35 / 50,
              ),
              itemCount: allMovies.length,
              itemBuilder: (context, index) {
                Movie movies = allMovies[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                media: movies,
                              )),
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
          ],
        ),
      ),
    );
  }
}
