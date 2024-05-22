import 'package:dart_movies_app/models/discover_movie_model.dart';
import 'package:dart_movies_app/components/small_card.dart';
import 'package:flutter/material.dart';

class RecommendedList extends StatelessWidget {
  final List<Movie> movie;
  const RecommendedList({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: movie.length,
        itemBuilder: (context, index) {
          Movie allMoviesModel = movie[index];

          return GestureDetector(
            onTap: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          media: allMoviesModel.,
                        )),
              ); */
            },
            child: Padding(
              padding: EdgeInsets.only(
                  left: allMoviesModel == movie.first ? 15 : 0, right: 15),
              child: SmallCard(
                imageUrl:
                    'https://media.themoviedb.org/t/p/w220_and_h330_face${allMoviesModel.posterPath}',
                width: 140,
              ),
            ),
          );
        },
      ),
    );
  }
}
