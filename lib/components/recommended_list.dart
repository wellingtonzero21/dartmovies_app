import 'package:dart_movies_app/components/small_card.dart';
import 'package:dart_movies_app/models/media_model.dart';
import 'package:dart_movies_app/view/detail_page.dart';
import 'package:flutter/material.dart';

class RecommendedList extends StatelessWidget {
  final List<MovieModel> recommendedsMovies;
  const RecommendedList({super.key, required this.recommendedsMovies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: recommendedsMovies.length,
        itemBuilder: (context, index) {
          MovieModel recommendedMovie = recommendedsMovies[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          movieModel: recommendedMovie,
                          recommendeds: recommendedsMovies,
                        )),
              );
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: recommendedMovie == recommendedsMovies.first ? 15 : 0,
                  right: 15),
              child: SmallCard(
                imageUrl:
                    'https://media.themoviedb.org/t/p/w220_and_h330_face${recommendedMovie.posterPath}',
                width: 140,
              ),
            ),
          );
        },
      ),
    );
  }
}
