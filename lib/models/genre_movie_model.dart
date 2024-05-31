class GenreMovieModel {
  List<GenreMovieModelList>? genres;

  GenreMovieModel({this.genres});

  GenreMovieModel.fromJson(Map<String, dynamic> json) {
    /* if (json['genres'] != null) {
      genres = json['genres']
          .map((genre) => GenreMovieModelList.fromJson(genre))
          .toList();
    } */
    if (json['genres'] != null) {
      genres = <GenreMovieModelList>[];
      json['genres'].forEach((v) {
        genres!.add(GenreMovieModelList.fromJson(v));
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

class GenreMovieModelList {
  int? id;
  String? name;

  GenreMovieModelList({
    required this.id,
    required this.name,
  });

  // Função fromJson para desserializar o JSON para um objeto Genre
  factory GenreMovieModelList.fromJson(Map<String, dynamic> json) {
    return GenreMovieModelList(
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
