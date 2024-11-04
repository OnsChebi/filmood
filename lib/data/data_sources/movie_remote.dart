import 'package:filmood/data/core/api_client.dart';
import 'package:filmood/data/models/movie_model.dart';
import 'package:filmood/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();// Call TMDB API for trending movies
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  
}

class MovieRemoteDataSourceImp implements MovieRemoteDataSource {
  final ApiClient _client;

  MovieRemoteDataSourceImp(this._client);

  @override
  Future<List<MovieModel>> getTrending() async {
    final response =await _client.get('trending/movie/day');
    final movies = MovieResultModel.fromJson(response).movies;
    return movies ?? [];
  }
  @override
  Future<List<MovieModel>> getPopular() async {
    final response =await _client.get('movie/popular');
    final movies = MovieResultModel.fromJson(response).movies;
    return movies ?? [];
    }

    @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response =await _client.get('movie/now_playing');
    final movies = MovieResultModel.fromJson(response).movies;
    return movies ?? [];
    }

    @override
  Future<List<MovieModel>> getComingSoon() async {
    final response =await _client.get('movie/upcoming');
    final movies = MovieResultModel.fromJson(response).movies;
    return movies ?? [];
    }
}