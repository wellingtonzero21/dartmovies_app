import 'package:dart_movies_app/models/media_model.dart';
import 'package:dart_movies_app/repositories/discover_movie_repository.dart';
import 'package:dart_movies_app/components/appbar_custom.dart';
import 'package:dart_movies_app/components/research_card.dart';
import 'package:dart_movies_app/components/small_card.dart';
import 'package:dart_movies_app/models/enums.dart';
import 'package:flutter/material.dart';
import '../models/media_model_v1.dart';

class SearchPage extends StatefulWidget {
  final TextEditingController controller = TextEditingController();
  final DiscoverMovieRepository discoverMovieProvider =
      DiscoverMovieRepository();

  SearchPage({super.key});

  @override
  SearchPageState createState() => SearchPageState();
}

MediaModelV1 movieToMediaModel(MediaModel movie) {
  return MediaModelV1(
    title: movie.title ?? '',
    description: movie.overview ?? '',
    urlSmallBanner: movie.posterPath ?? '',
    urlLongBanner: movie.backdropPath ?? '',
    isRecommended: true,
    genre: Genre.action, // Você precisa mapear os genreIds para o objeto Genre
    mediaType:
        MediaType.series, // Supondo que todos os filmes são do tipo 'movie'
    length: '', // Este campo não está disponível na classe Movie
    lancamento: movie.releaseDate ?? '',
    classif: '', // Este campo não está disponível na classe Movie
    diretor: '', // Este campo não está disponível na classe Movie
    produtoras: '', // Este campo não está disponível na classe Movie
    roteiro: '', // Este campo não está disponível na classe Movie
  );
}

class SearchPageState extends State<SearchPage> {
  late List<MediaModelV1> filteredMediaList = [];
  late List<MediaModel> movieList = [];
  late Future<void> _fetchMoviesFuture;
  int paginaCorrente = 1;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _fetchMoviesFuture = _fetchMovies();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchMovies();
    }
  }

  Future<void> _fetchMovies() async {
    final discoverMovieModel =
        await widget.discoverMovieProvider.getDiscoverMovie(paginaCorrente);
    setState(() {
      movieList = discoverMovieModel.results ?? [];
      //filteredMediaList = movieList.map(movieToMediaModel).toList();
      filteredMediaList.addAll(movieList.map(movieToMediaModel).toList());

      paginaCorrente++;
    });
    return;
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
                    setState(() {
                      filteredMediaList = movieList
                          .map(movieToMediaModel)
                          .where((media) => media.title
                              .toLowerCase()
                              .contains(value.toLowerCase()))
                          .toList();
                    });
                  },
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 25),
                    child: FutureBuilder(
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
                              MediaModelV1 trendingMedia =
                                  filteredMediaList[index];
                              return GestureDetector(
                                onTap: () {
                                  /* Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailPage(id: trendingMedia.id ?? 0),
                                    ),
                                  ); */
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: SmallCard(
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/w200/${trendingMedia.urlSmallBanner}',
                                  ),
                                ),
                              );
                            },
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
                          );
                        }
                      },
                    ),
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
