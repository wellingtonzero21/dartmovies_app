class TrendingPeopleModel {
  int? page;
  List<People>? results;
  int? totalPages;
  int? totalResults;

  TrendingPeopleModel(
      {this.page, this.results, this.totalPages, this.totalResults});

  TrendingPeopleModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <People>[];
      json['results'].forEach((v) {
        results!.add(People.fromJson(v));
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

class People {
  int? id;
  String? originalName;
  String? mediaType;
  bool? adult;
  String? name;
  double? popularity;
  int? gender;
  String? knownForDepartment;
  String? profilePath;
  List<KnownFor>? knownFor;

  People(
      {this.id,
      this.originalName,
      this.mediaType,
      this.adult,
      this.name,
      this.popularity,
      this.gender,
      this.knownForDepartment,
      this.profilePath,
      this.knownFor});

  People.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    originalName = json['original_name'];
    mediaType = json['media_type'];
    adult = json['adult'];
    name = json['name'];
    popularity = json['popularity'];
    gender = json['gender'];
    knownForDepartment = json['known_for_department'];
    profilePath = json['profile_path'];
    if (json['known_for'] != null) {
      knownFor = <KnownFor>[];
      json['known_for'].forEach((v) {
        knownFor!.add(KnownFor.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['original_name'] = originalName;
    data['media_type'] = mediaType;
    data['adult'] = adult;
    data['name'] = name;
    data['popularity'] = popularity;
    data['gender'] = gender;
    data['known_for_department'] = knownForDepartment;
    data['profile_path'] = profilePath;
    if (knownFor != null) {
      data['known_for'] = knownFor!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class KnownFor {
  String? backdropPath;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? mediaType;
  bool? adult;
  String? title;
  String? originalLanguage;
  List<int>? genreIds;
  double? popularity;
  String? releaseDate;
  bool? video;
  double? voteAverage;
  int? voteCount;
  String? originalName;
  String? name;
  String? firstAirDate;
  List<String>? originCountry;

  KnownFor(
      {this.backdropPath,
      this.id,
      this.originalTitle,
      this.overview,
      this.posterPath,
      this.mediaType,
      this.adult,
      this.title,
      this.originalLanguage,
      this.genreIds,
      this.popularity,
      this.releaseDate,
      this.video,
      this.voteAverage,
      this.voteCount,
      this.originalName,
      this.name,
      this.firstAirDate,
      this.originCountry});

  KnownFor.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    mediaType = json['media_type'];
    adult = json['adult'];
    title = json['title'];
    originalLanguage = json['original_language'];
    genreIds = json['genre_ids'].cast<int>();
    popularity = json['popularity'];
    releaseDate = json['release_date'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    originalName = json['original_name'];
    name = json['name'];
    firstAirDate = json['first_air_date'];
    originCountry = json['origin_country'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['backdrop_path'] = backdropPath;
    data['id'] = id;
    data['original_title'] = originalTitle;
    data['overview'] = overview;
    data['poster_path'] = posterPath;
    data['media_type'] = mediaType;
    data['adult'] = adult;
    data['title'] = title;
    data['original_language'] = originalLanguage;
    data['genre_ids'] = genreIds;
    data['popularity'] = popularity;
    data['release_date'] = releaseDate;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['original_name'] = originalName;
    data['name'] = name;
    data['first_air_date'] = firstAirDate;
    data['origin_country'] = originCountry;
    return data;
  }
}
