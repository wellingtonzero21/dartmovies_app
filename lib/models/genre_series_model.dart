class GenreSeriesModel {
  List<GenreSeriesModelList>? genres;

  GenreSeriesModel({this.genres});

  GenreSeriesModel.fromJson(Map<String, dynamic> json) {
    /* if (json['genres'] != null) {
      genres = json['genres']
          .map((genre) => GenreMovieModelList.fromJson(genre))
          .toList();
    } */
    if (json['genres'] != null) {
      genres = <GenreSeriesModelList>[];
      json['genres'].forEach((v) {
        genres!.add(GenreSeriesModelList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (genres != null) {
      data['genres'] = genres!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GenreSeriesModelList {
  int? id;
  String? name;

  GenreSeriesModelList({
    required this.id,
    required this.name,
  });

  // Função fromJson para desserializar o JSON para um objeto Genre
  factory GenreSeriesModelList.fromJson(Map<String, dynamic> json) {
    return GenreSeriesModelList(
      id: json['id'],
      name: json['name'],
    );
  }

  // Função toJson para serializar o objeto Genre para JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
