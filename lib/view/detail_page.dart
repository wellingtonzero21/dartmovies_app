import 'package:dart_movies_app/components/long_card.dart';
import 'package:dart_movies_app/model/media_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatelessWidget {
  final MediaModel media;

  const DetailPage({super.key, required this.media});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Image.network(
                  media.urlLongBanner,
                  height: MediaQuery.of(context).size.height * 0.48,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Center(
                  child: SvgPicture.asset(
                    'assets/icons/play-icon.svg',
                    width: 70,
                    height: 70,
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
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              media.title,
                              style: const TextStyle(
                                  fontSize: 40,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white),
                            ),
                            const Text(
                              'Animação | 1h 57m | 2021',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Color(0xFFB5B5B5)),
                            ),
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
                        media.description,
                        style: const TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins-Regular',
                            color: Colors.white),
                      ),
                      const SizedBox(height: 50),
                      const Row(
                        children: [
                          Text('Classificação: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white)),
                          Text(
                            '12 anos.',
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Poppins-Regular',
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Text('Diretor: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white)),
                          Expanded(
                            child: Text(
                              'Enrico Casarosa.',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-Regular',
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Text('Roteiro: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white)),
                          Expanded(
                            child: Text(
                              'Mike Jones e Jesse Andrews.',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-Regular',
                                  color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Text('Produtoras: ',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Poppins-SemiBold',
                                  color: Colors.white)),
                          Expanded(
                            child: Text(
                              'Pixar, Walt Disney Pictures',
                              style: TextStyle(
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    media: recommendedMedia,
                                  )),
                        );
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
