import 'package:dart_movies_app/models/media_model.dart';

class DiscoverMovieModel {
  int? page;
  List<MediaModel>? results;
  int? totalPages;
  int? totalResults;

  DiscoverMovieModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  DiscoverMovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MediaModel>[];
      json['results'].forEach((v) {
        results!.add(MediaModel.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}