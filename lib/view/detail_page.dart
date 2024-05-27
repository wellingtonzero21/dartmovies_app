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
  final bool isSerie;
  final int id;

  DetailPage(
      {super.key, required this.id, this.isSerie = false, required allMovies});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late List<MediaModel> allMovies = [];
  late MediaBloc mediaBloc;

  MovieDetailsModel? movieDetailsModel;
  SerieDetailsModel? serieDetailsModel;

  @override
  void initState() {
    mediaBloc = BlocProvider.of<MediaBloc>(context);
    mediaBloc.add(GetDetaisMediaEvent(id: widget.id, isSerie: widget.isSerie));
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
                                      state.movieDetailsModel?.title ??
                                          'Não disponível',
                                      style: const TextStyle(
                                          fontSize: 40,
                                          height: 1.2,
                                          fontFamily: 'Poppins-SemiBold',
                                          color: Colors.white),
                                    ),
                                    // Text(
                                    //   '${state.movieDetailsModel?.releaseDate}',
                                    //   style: const TextStyle(
                                    //       fontSize: 17,
                                    //       fontFamily: 'Poppins-SemiBold',
                                    //       color: Color(0xFFB5B5B5)),
                                    // ),
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
                    //       itemCount: allMovies.length,
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
                                    // Text(
                                    //   '${state.movieDetailsModel?.releaseDate}',
                                    //   style: const TextStyle(
                                    //       fontSize: 17,
                                    //       fontFamily: 'Poppins-SemiBold',
                                    //       color: Color(0xFFB5B5B5)),
                                    // ),
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
