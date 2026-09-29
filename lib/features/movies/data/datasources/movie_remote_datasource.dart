import '../../../../core/network/dio_client.dart';
import '../models/movie_model.dart';

abstract class MovieRemoteDatasource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
}

class MovieRemoteDatasourceImpl implements MovieRemoteDatasource {
  final DioClient dioClient;

  MovieRemoteDatasourceImpl(this.dioClient);

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await dioClient.dio.get('/movie/now_playing');
    final results = response.data['results'] as List;
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await dioClient.dio.get('/movie/popular');
    final results = response.data['results'] as List;
    return results.map((e) => MovieModel.fromJson(e)).toList();
  }
}