import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/api/models/movie_details_model.dart';
import 'package:dart_movies_app/api/provider/movie_details_provider.dart';
import 'package:dart_movies_app/components/long_card.dart';
import 'package:dart_movies_app/model/enums.dart';
import 'package:dart_movies_app/model/media_model.dart';
import 'package:dart_movies_app/view/movie_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatefulWidget {
  final MovieDetailsProvider movieDetailsProvider =
      MovieDetailsProvider(httpAdater: HttpAdapter());
  final int id;

  DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

/* String getGenreText() {
  switch (media.genre) {
    case Genre.action:
      return 'Ação';
    case Genre.comedy:
      return 'Comédia';
    case Genre.drama:
      return 'Drama';
    case Genre.documentario:
      return 'Documentário';
    case Genre.aventura:
      return 'Aventura';
    default:
      return 'Desconhecido';
  }
} */

class _DetailPageState extends State<DetailPage> {
  MovieDetailsModel? moviedetailsList;
  @override
  void initState() {
    super.initState();
    _fetchDetails();
  }

  Future<void> _fetchDetails() async {
    int id = widget.id;
    final movieDetailsModel =
        await widget.movieDetailsProvider.getMovieDetail(id);
    setState(() {
      moviedetailsList = movieDetailsModel;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    if (moviedetailsList == null) {
      return const CircularProgressIndicator();
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Image.network(
                  'https://image.tmdb.org/t/p/w300/${moviedetailsList?.backdropPath}',
                  height: MediaQuery.of(context).size.height * 0.48,
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
                      /* Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MoviePage(
                                  imageUrl: media.urlLongBanner,
                                )),
                      ) */
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
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              moviedetailsList?.title ?? '',
                              style: const TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white),
                            ),
                            /* Text(
                              '${getGenreText()} | ${media.length} | ${media.lancamento}',
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Color(0xFFB5B5B5)),
                            ), */
                            const Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Icon(Icons.star,
                                      size: 20, color: Colors.amber),
                                  Icon(Icons.star,
                                      size: 20, color: Colors.white),
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
                      const SizedBox(height: 25),
                      Text(
                        textAlign: TextAlign.start,
                        moviedetailsList?.overview ?? '',
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins-Regular',
                            color: Colors.white),
                      ),
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          const Text('Classificação: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white)),
                          Text(
                            moviedetailsList?.voteAverage.toString() ?? '',
                            style: const TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins-Regular',
                                color: Colors.white),
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
                              moviedetailsList?.popularity.toString() ?? '',
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
                          const Text('Título original: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white)),
                          Expanded(
                            child: Text(
                              moviedetailsList?.originalTitle ?? '',
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
                              moviedetailsList?.voteCount.toString() ?? '',
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
              child: SizedBox(
                height: 160,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: listRecommendeds.length,
                  itemBuilder: (context, index) {
                    MediaModel recommendedMedia = listRecommendeds[index];

                    return GestureDetector(
                      onTap: () {
                        /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    media: recommendedMedia,
                                  )),
                        ); */
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: recommendedMedia == listRecommendeds.first
                                ? 15
                                : 0,
                            right: 20),
                        child: LongCard(
                          imageUrl: recommendedMedia.urlLongBanner,
                          width: 280,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
