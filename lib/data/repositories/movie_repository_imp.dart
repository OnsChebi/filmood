import 'package:filmood/data/data_sources/movie_remote.dart';
import 'package:filmood/data/models/movie_model.dart';
import 'package:filmood/domain/repoitories/movie_repository.dart';

class MovieRepositoryImp extends MovieRepository{

  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImp(this.remoteDataSource);

  @override
  Future<List<MovieModel>> getTrending() async {
    try{
      final movies = await remoteDataSource.getTrending();
      return movies;
    }on Exception catch(e){
      print("error fetching trending movies $e");
      return [];
      }
    }
}