import 'dart:convert';
import 'package:filmood/data/core/api_constants.dart';
import 'package:filmood/data/models/movie_model.dart';
import 'package:filmood/data/models/movies_result_model.dart';
import 'package:http/http.dart' as http;

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending(); //to call TMDB API for trending movies
}

class MovieRemoteDataSourceImp implements MovieRemoteDataSource {
  final http.Client _client;

  MovieRemoteDataSourceImp(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await _client.get(
      Uri.parse('${ApiConstants.BASE_URL}trending/movie/day?api_key=${ApiConstants.API_KEY}'),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body); // Decodes JSON response
      final movies = MovieResultModel.fromJson(jsonResponse).movies;
      return movies ?? [];
    } else {
      throw Exception('Failed to load trending movies');
    }
  }
}
