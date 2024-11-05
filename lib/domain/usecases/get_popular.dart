import 'package:filmood/domain/entities/movie_entity.dart';
import 'package:filmood/domain/repoitories/movie_repository.dart';

class GetPopular {
  final MovieRepository  _movieRepository;

  //constructor
  GetPopular(this._movieRepository);
   
   Future<List<MovieEntity>> call(){
    return _movieRepository.getPopular();
   }

}