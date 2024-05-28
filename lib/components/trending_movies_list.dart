import 'package:dart_movies_app/models/media_model.dart';
import 'package:dart_movies_app/view/detail_page.dart';
import 'package:flutter/material.dart';
import 'small_card.dart';

class TrendingMoviesList extends StatefulWidget {
  final List<MovieModel> trendingMovies;
  final List<MovieModel> recommendeds;

  const TrendingMoviesList({
    super.key,
    required this.trendingMovies,
    required this.recommendeds,
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
          MovieModel trendingMovie = widget.trendingMovies[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    movieModel: trendingMovie,
                    recommendeds: widget.recommendeds,
                  ),
                ),
              );
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
