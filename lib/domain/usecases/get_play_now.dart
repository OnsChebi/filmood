import 'package:filmood/domain/entities/movie_entity.dart';
import 'package:filmood/domain/repoitories/movie_repository.dart';

class GetPlayNow {
  final MovieRepository  _movieRepository;

  //constructor
  GetPlayNow(this._movieRepository);
   
   Future<List<MovieEntity>> call(){
    return _movieRepository.getPlayNow();
   }

}