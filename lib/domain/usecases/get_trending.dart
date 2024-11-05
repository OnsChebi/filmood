import 'package:filmood/domain/entities/movie_entity.dart';
import 'package:filmood/domain/repoitories/movie_repository.dart';

class GetTrending {
  final MovieRepository  _movieRepository;

  //constructor
  GetTrending(this._movieRepository);
   
   Future<List<MovieEntity>> call(){
    return _movieRepository.getTrending();
   }

}