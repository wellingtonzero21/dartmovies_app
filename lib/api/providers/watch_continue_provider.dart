import 'package:dart_movies_app/api/http_adapter.dart';
import 'package:dart_movies_app/api/models/watch_continue_model.dart';

class WatchContinueProvider {
  final HttpAdapter httpAdater;

  WatchContinueProvider({required this.httpAdater});

  Future<WatchContinueModel> getWatchContinue(int pagina) async {
    final url =
        'https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=$pagina&sort_by=popularity.desc';

    final response = await httpAdater.get(url: url);

    return WatchContinueModel.fromJson(response);
  }
}
