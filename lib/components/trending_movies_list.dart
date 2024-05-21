import 'package:flutter/material.dart';

import '../api/models/trending_movies_model.dart';
import '../view/detail_page.dart';
import 'small_card.dart';

class TrendingMoviesList extends StatefulWidget {
  final List<Trending> trendingMovies;
  const TrendingMoviesList({
    super.key,
    required this.trendingMovies,
  });

  @override
  State<TrendingMoviesList> createState() => _TrendingMoviesListState();
}

class _TrendingMoviesListState extends State<TrendingMoviesList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.trendingMovies.length,
        itemBuilder: (context, index) {
          Trending trendingMovie = widget.trendingMovies[index];

          return GestureDetector(
            onTap: () {
              /* Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    trending: trendingMovie,
                  ),
                ),
              ); */
            },
            child: Padding(
              padding: EdgeInsets.only(
                left: trendingMovie == widget.trendingMovies.first ? 15 : 0,
                right: 20,
              ),
              child: SmallCard(
                imageUrl:
                    "https://media.themoviedb.org/t/p/w220_and_h330_face${trendingMovie.posterPath}",
                width: 140,
              ),
            ),
          );
        },
      ),
    );
  }
}
