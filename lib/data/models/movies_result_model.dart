import 'package:filmood/data/models/movie_model.dart';

class MovieResultModel {
  List<MovieModel>? movies;

  MovieResultModel({this.movies});

  MovieResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      movies = <MovieModel>[];
      json['results'].forEach((v) {
        movies!.add(MovieModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =<String, dynamic>{};
    if (movies != null) {
      data['results'] =movies!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
