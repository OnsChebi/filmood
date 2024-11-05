import 'package:filmood/data/core/api_client.dart';
import 'package:filmood/data/data_sources/movie_remote.dart';
import 'package:filmood/data/repositories/movie_repository_imp.dart';
import 'package:filmood/domain/repoitories/movie_repository.dart';
import 'package:filmood/domain/usecases/get_coming_soon.dart';
import 'package:filmood/domain/usecases/get_play_now.dart';
import 'package:filmood/domain/usecases/get_popular.dart';
import 'package:filmood/domain/usecases/get_trending.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

final getItInstance=GetIt.I;

Future init() async{
  getItInstance.registerLazySingleton<Client>(()=>Client());//intilize instance of client whent it's first used in the app
  getItInstance.registerLazySingleton<ApiClient>(()=>ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(()=>MovieRemoteDataSourceImp(getItInstance()));
  getItInstance.registerLazySingleton<MovieRepository>(()=>MovieRepositoryImp(getItInstance()));
  getItInstance.registerLazySingleton<GetTrending>(()=>GetTrending(getItInstance()));
  getItInstance.registerLazySingleton<GetPopular>(()=>GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayNow>(()=>GetPlayNow(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(()=>GetComingSoon(getItInstance()));




  }


