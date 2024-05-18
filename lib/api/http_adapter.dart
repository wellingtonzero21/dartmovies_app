import 'dart:convert';

import 'package:http/http.dart' as http;

// const token = String.fromEnvironment('TOKEN', defaultValue: '');
const token =
    'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxNGU0ZDQyM2JjMTg2MWIyYTQ1OWNlM2JkMTM5NTA1NSIsInN1YiI6IjY2NDRhNGM3N2E3ZWQ0ZTZjOGVjNDI0OCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.L0YGb14bxu2EmZeml5wM7BICiqIJ4tUH8U3jyr88OgM';

class HttpAdapter {
  Future<Map<String, dynamic>> get({
    required String url,
    Map<String, String> queryParams = const {},
    Map<String, String> headers = const {
      'Content-Type': 'application/json',
      'accept': 'application/json',
    },
  }) async {
    final response = await http.get(Uri.parse(url),
        headers: {...headers, 'Authorization': 'Bearer $token'});
    return jsonDecode(response.body);
  }
}
