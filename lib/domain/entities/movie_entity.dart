import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable{
  final String? posterPath;
  final String? backdropPath;
  final String title;
  final String overview;
  final String releaseDate;
  final double voteAverage;
  final int id;
  
  const MovieEntity({
    required this.posterPath,
    required this.backdropPath,
    required this.title,
    required this.overview,
    required this.releaseDate,
    required this.voteAverage,
    required this.id,
  }) ;

  @override
  @override
  List<Object?> get props => [posterPath, backdropPath, title, overview, releaseDate, voteAverage, id];


   @override
  bool get stringify => true;
}