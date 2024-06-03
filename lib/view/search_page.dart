import 'package:dart_movies_app/bloc/media/media_bloc.dart';
import 'package:dart_movies_app/models/media_model.dart';
import 'package:dart_movies_app/repositories/discover_movie_repository.dart';
import 'package:dart_movies_app/components/appbar_custom.dart';
import 'package:dart_movies_app/components/research_card.dart';
import 'package:dart_movies_app/components/small_card.dart';
import 'package:dart_movies_app/view/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  final DiscoverMovieRepository discoverMovieProvider =
      DiscoverMovieRepository();

  SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  late MediaBloc _mediaBloc;
  int paginaCorrente = 1;
  final ScrollController _scrollController = ScrollController();

  List<MovieModel> filmes = [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _mediaBloc = BlocProvider.of<MediaBloc>(context);
    _mediaBloc.add(FetchMovies(paginaCorrente));
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      paginaCorrente++;
      _mediaBloc.add(LoadMoreMovies(paginaCorrente));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(pageTitle: ''),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                ResearchCard(
                  controller: widget.controller,
                  onChanged: (String value) {
                    if (value == '') {
                      paginaCorrente = 1;
                      _mediaBloc.add(LoadMoreMovies(paginaCorrente));
                    }

                    _mediaBloc.add(SearchMovieEvent(value));
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 25),
                    child: BlocConsumer<MediaBloc, MediaState>(
                      bloc: _mediaBloc,
                      listener: (context, state) {
                        if (state is SearchSuccessState) {
                          filmes = state.discoverMovieModel;
                        }
                      },
                      builder: (context, state) {
                        if (state is SearchLoadingState &&
                            paginaCorrente == 1) {
                          return const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white));
                        }

                        if (state is SearchSuccessState) {}
                        if (state is SearchErrorState) {
                          return Center(child: Text('Erro: ${state.message}'));
                        }
                        return NotificationListener<ScrollNotification>(
                          onNotification: (ScrollNotification scrollInfo) {
                            if (scrollInfo.metrics.pixels ==
                                scrollInfo.metrics.maxScrollExtent) {
                              if (state is! LoadMoreLoadingState) {
                                paginaCorrente++;
                                _mediaBloc.add(LoadMoreMovies(paginaCorrente));
                              }
                              return true;
                            }
                            return false;
                          },
                          child: GridView.builder(
                            controller: _scrollController,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 35 / 50,
                            ),
                            itemCount: filmes.length,
                            itemBuilder: (context, index) {
                              MovieModel trendingMedia = filmes[index];

                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                        movieModel: trendingMedia,
                                        recommendeds: filmes,
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SmallCard(
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/w200/${trendingMedia.posterPath}',
                                  ),
                                ),
                              );
                            },
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                          ),
                        );
                      },
                    ),

                    /* FutureBuilder(
                      future: _fetchMoviesFuture,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.white,
                          ));
                        } else if (snapshot.hasError) {
                          return Text('Erro: ${snapshot.error}');
                        } else {
                          return GridView.builder(
                            controller: _scrollController,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 35 / 50,
                            ),
                            itemCount: filteredMediaList.length,
                            itemBuilder: (context, index) {
                              MediaModel trendingMedia =
                                  filteredMediaList[index];
                              return GestureDetector(
                                onTap: () {
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SmallCard(
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/w200/${trendingMedia.posterPath}',
                                  ),
                                ),
                              );
                            },
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                          );
                        }
                      },
                    ), */
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
