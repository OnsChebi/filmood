import 'package:filmood/data/models/movie_model.dart';

class MovieResultModel {
  List<MovieModel>? results;

  MovieResultModel({this.results});

  MovieResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <MovieModel>[];
      json['results'].forEach((v) {
        results!.add(MovieModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =<String, dynamic>{};
    if (results != null) {
      data['results'] =results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
