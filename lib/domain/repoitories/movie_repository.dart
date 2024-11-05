import 'package:filmood/data/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getTrending();
}