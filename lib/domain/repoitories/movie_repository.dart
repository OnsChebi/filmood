import 'package:filmood/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<List<MovieEntity>> getTrending();
  Future<List<MovieEntity>> getPopular();
  Future<List<MovieEntity>> getComingSoon();
  Future<List<MovieEntity>> getPlayNow();

}