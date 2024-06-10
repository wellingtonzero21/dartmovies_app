// ignore_for_file: use_build_context_synchronously

import 'package:dart_movies_app/components/recommended_list.dart';
import 'package:dart_movies_app/others/service_hive.dart';
import 'package:dart_movies_app/repositories/movie_details_repository.dart';
import 'package:dart_movies_app/models/serie_details_model.dart';
import 'package:dart_movies_app/models/movie_details_model.dart';
import 'package:dart_movies_app/bloc/media/media_bloc.dart';
import 'package:dart_movies_app/models/media_model.dart';
import 'package:dart_movies_app/view/movie_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  final MovieDetailsRepository movieDetailsProvider = MovieDetailsRepository();
  final MediaBloc mediaBloc = MediaBloc();

  final List<MovieModel> recommendeds;

  final bool isSerie;

  final MovieModel movieModel;

  DetailPage({
    super.key,
    this.isSerie = false,
    required this.movieModel,
    required this.recommendeds,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late List<MovieModel> allMovies = [];
  late MediaBloc mediaBloc;

  ServiceHive serviceHive = ServiceHive();

  MovieDetailsModel? movieDetailsModel;
  SerieDetailsModel? serieDetailsModel;

  @override
  void initState() {
    mediaBloc = BlocProvider.of<MediaBloc>(context);
    mediaBloc.add(GetDetaisMediaEvent(
        id: widget.movieModel.id!, isSerie: widget.isSerie));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<MediaBloc, MediaState>(
        builder: (context, state) {
          if (state is DetailLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.secondary,
              ),
            );
          }

          if (state is DetailSucessState) {
            if (state.movieDetailsModel != null) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w300/${state.movieDetailsModel?.backdropPath}',
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        Center(
                          child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/play-icon.svg',
                              width: 70,
                              height: 70,
                            ),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MoviePage(
                                    imageUrl:
                                        'https://image.tmdb.org/t/p/w300/${state.movieDetailsModel?.backdropPath}',
                                  ),
                                ),
                              )
                            },
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 60,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xFF05F258),
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 15, right: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.movieDetailsModel?.title ??
                                          'Não disponível',
                                      style: const TextStyle(
                                          fontSize: 40,
                                          height: 1.2,
                                          fontFamily: 'Poppins-SemiBold',
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5, right: 20),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star,
                                              size: 25,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            state.movieDetailsModel?.voteAverage
                                                    .toStringAsFixed(2) ??
                                                'Não disponível',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins-Regular',
                                                color: Colors.white),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            icon: FutureBuilder<bool>(
                                              future:
                                                  serviceHive.isMovieFavorited(
                                                      widget.movieModel.id!),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  return const CircularProgressIndicator(); // ou qualquer indicador de carregamento desejado
                                                } else {
                                                  final isFavorited =
                                                      snapshot.data ?? false;
                                                  return Icon(
                                                    isFavorited
                                                        ? Icons.favorite
                                                        : Icons.favorite_border,
                                                    size: 30,
                                                  );
                                                }
                                              },
                                            ),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            onPressed: () async {
                                              final bool isFavorited =
                                                  await serviceHive
                                                      .isMovieFavorited(widget
                                                          .movieModel.id!);

                                              if (isFavorited) {
                                                // Exibir caixa de diálogo de confirmação para remover dos favoritos
                                                final bool confirmRemove =
                                                    await showDialog(
                                                  context: context,
                                                  builder: (context) =>
                                                      AlertDialog(
                                                    shadowColor: Colors.black,
                                                    backgroundColor:
                                                        Theme.of(context)
                                                            .colorScheme
                                                            .secondary,
                                                    title: const Text(
                                                      'Deseja desfavoritar?',
                                                      style: TextStyle(
                                                          fontSize: 24,
                                                          height: 1.2,
                                                          fontFamily:
                                                              'Poppins-Bold',
                                                          color: Colors.black),
                                                    ),
                                                    content: const Text(
                                                      'Tem certeza de que deseja remover este filme/série dos favoritos?',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          height: 1.2,
                                                          fontFamily:
                                                              'Poppins-Regular',
                                                          color: Colors.black),
                                                    ),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () => Navigator
                                                                .of(context)
                                                            .pop(
                                                                false), // Não remover
                                                        child: const Text(
                                                          'Cancelar',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              height: 1.2,
                                                              fontFamily:
                                                                  'Poppins-Bold',
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () => Navigator
                                                                .of(context)
                                                            .pop(
                                                                true), // Confirmar remoção
                                                        child: const Text(
                                                          'Remover',
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              height: 1.2,
                                                              fontFamily:
                                                                  'Poppins-Bold',
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                );

                                                // Se o usuário confirmou a remoção, então remova dos favoritos
                                                if (confirmRemove) {
                                                  await mediaBloc.favoriteMovie(
                                                      movieModel:
                                                          widget.movieModel);
                                                  
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                    SnackBar(
                                                      backgroundColor:
                                                          Colors.black,
                                                      content: Center(
                                                        child: Text(
                                                          'Removido dos favoritos!',
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              color: Theme.of(
                                                                      
                                                                      context)
                                                                  .colorScheme
                                                                  .secondary),
                                                        ),
                                                      ),
                                                      duration: const Duration(
                                                          seconds: 3),
                                                    ),
                                                  );
                                                  setState(() {});
                                                }
                                              } else {
                                                // Adicionar aos favoritos diretamente
                                                await mediaBloc.favoriteMovie(
                                                    movieModel:
                                                        widget.movieModel);
                                                
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  SnackBar(
                                                    backgroundColor:
                                                        Colors.black,
                                                    content: Center(
                                                      child: Text(
                                                        'Adicionado aos favoritos!',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Theme.of(
                                                                    
                                                                    context)
                                                                .colorScheme
                                                                .secondary),
                                                      ),
                                                    ),
                                                    duration: const Duration(
                                                        seconds: 3),
                                                  ),
                                                );
                                                setState(() {});
                                              }
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 10),
                              Text(
                                textAlign: TextAlign.start,
                                state.movieDetailsModel?.overview ??
                                    'Não disponível',
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Poppins-Regular',
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 40),
                              Row(
                                children: [
                                  const Text('Título original: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-SemiBold',
                                          color: Colors.white)),
                                  Expanded(
                                    child: Text(
                                      state.movieDetailsModel?.originalTitle ??
                                          'Não disponível',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-Regular',
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Popularidade: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-SemiBold',
                                          color: Colors.white)),
                                  Expanded(
                                    child: Text(
                                      state.movieDetailsModel?.popularity
                                              .toString() ??
                                          '',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-Regular',
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Votos: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-SemiBold',
                                          color: Colors.white)),
                                  Expanded(
                                    child: Text(
                                      state.movieDetailsModel?.voteCount
                                              .toString() ??
                                          'Não disponível',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-Regular',
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Linguagem original: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-SemiBold',
                                          color: Colors.white)),
                                  Expanded(
                                    child: Text(
                                      state.movieDetailsModel?.originalLanguage
                                              .toString()
                                              .toUpperCase() ??
                                          'Não disponível',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-Regular',
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              const Text(
                                'Recomendados',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Poppins-SemiBold',
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: RecommendedList(
                        recommendedsMovies: widget.recommendeds,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              );
            }

            if (state.serieDetailsModel != null) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        Image.network(
                          'https://image.tmdb.org/t/p/w300/${state.serieDetailsModel?.backdropPath}',
                          height: MediaQuery.of(context).size.height * 0.30,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                        Center(
                          child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/play-icon.svg',
                              width: 70,
                              height: 70,
                            ),
                            onPressed: () => {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MoviePage(
                                          imageUrl:
                                              'https://image.tmdb.org/t/p/w300/${state.serieDetailsModel?.backdropPath}',
                                        )),
                              )
                            },
                          ),
                        ),
                        Positioned(
                          left: 20,
                          top: 60,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Color(0xFF05F258),
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 15, right: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.serieDetailsModel?.name ??
                                          'Não disponível',
                                      style: const TextStyle(
                                          fontSize: 40,
                                          fontFamily: 'Poppins-SemiBold',
                                          color: Colors.white),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 5, right: 20),
                                      child: Row(
                                        children: [
                                          Icon(Icons.star,
                                              size: 25,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .secondary),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            state.serieDetailsModel!.voteAverage
                                                    ?.toStringAsFixed(2) ??
                                                'Não disponível',
                                            style: const TextStyle(
                                                fontSize: 16,
                                                fontFamily: 'Poppins-Regular',
                                                color: Colors.white),
                                          ),
                                          Text(
                                            '| Temporadas: ${state.serieDetailsModel?.numberOfSeasons}',
                                            style: const TextStyle(
                                                fontSize: 17,
                                                fontFamily: 'Poppins-SemiBold',
                                                color: Color(0xFFB5B5B5)),
                                          ),
                                          const Spacer(),
                                          IconButton(
                                            icon: const Icon(
                                                Icons.favorite_border,
                                                size: 30),
                                            color: Theme.of(context)
                                                .colorScheme
                                                .secondary,
                                            onPressed: () {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 20),
                              Text(
                                textAlign: TextAlign.start,
                                state.serieDetailsModel?.overview ??
                                    'Não disponível',
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontFamily: 'Poppins-Regular',
                                    color: Colors.white),
                              ),
                              const SizedBox(height: 40),
                              Row(
                                children: [
                                  const Text('Título original: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-SemiBold',
                                          color: Colors.white)),
                                  Expanded(
                                    child: Text(
                                      state.serieDetailsModel?.originalName ??
                                          'Não disponível',
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-Regular',
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Popularidade: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-SemiBold',
                                          color: Colors.white)),
                                  Expanded(
                                    child: Text(
                                      state.serieDetailsModel?.popularity
                                              .toString() ??
                                          'Não disponível',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-Regular',
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Votos: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-SemiBold',
                                          color: Colors.white)),
                                  Expanded(
                                    child: Text(
                                      state.serieDetailsModel?.voteCount
                                              .toString() ??
                                          'Não disponível',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-Regular',
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Text('Linguagem original: ',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-SemiBold',
                                          color: Colors.white)),
                                  Expanded(
                                    child: Text(
                                      state.serieDetailsModel?.originalLanguage
                                              .toString()
                                              .toUpperCase() ??
                                          'Não disponível',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins-Regular',
                                          color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              // const Text(
                              //   'Recomendados',
                              //   style: TextStyle(
                              //       fontSize: 20,
                              //       fontFamily: 'Poppins-SemiBold',
                              //       color: Colors.white),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 20),
                    //   child: SizedBox(
                    //     height: 200,
                    //     child: ListView.builder(
                    //       shrinkWrap: true,
                    //       scrollDirection: Axis.horizontal,
                    //       itemCount: listRecommendeds.length,
                    //       itemBuilder: (context, index) {
                    //         //Movie movies = allMovies[index];

                    //         return GestureDetector(
                    //           onTap: () {
                    //             /* Navigator.push(
                    //                   context,
                    //                   MaterialPageRoute(
                    //                       builder: (context) => DetailPage(
                    //                             media: recommendedMedia,
                    //                           )),
                    //                 ); */
                    //           },
                    //           child: RecommendedList(
                    //             movie: allMovies,
                    //           ),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 20,
                    // )
                  ],
                ),
              );
            }
          }
          return const SizedBox();
        },
      ),
    );
  }
}
