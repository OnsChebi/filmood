import 'package:filmood/domain/entities/movie_entity.dart';
import 'package:filmood/domain/repoitories/movie_repository.dart';

class GetComingSoon {
  final MovieRepository  _movieRepository;

  //constructor
  GetComingSoon(this._movieRepository);
   
   Future<List<MovieEntity>> call(){
    return _movieRepository.getComingSoon();
   }

}