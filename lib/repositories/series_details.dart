import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/models/serie_details_model.dart';

class SerieDetailsRepository {
  SerieDetailsRepository();

  final HttpAdapter httpAdater = HttpAdapter();

  Future<SerieDetailsModel> getSerieDetail(int id) async {
    final url = 'https://api.themoviedb.org/3/tv/$id?language=pt-BR';

    final response = await httpAdater.get(url: url);

    return SerieDetailsModel.fromJson(response);
  }
}
