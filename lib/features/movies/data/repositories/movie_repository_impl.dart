import 'package:dartz/dartz.dart';
import '../../domain/entities/movie.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_datasource.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDatasource remoteDatasource;

  MovieRepositoryImpl(this.remoteDatasource);

  @override
  Future<Either<String, List<Movie>>> getNowPlayingMovies() async {
    try {
      final movies = await remoteDatasource.getNowPlayingMovies();
      return Right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Movie>>> getPopularMovies() async {
    try {
      final movies = await remoteDatasource.getPopularMovies();
      return Right(movies);
    } catch (e) {
      return Left(e.toString());
    }
  }
}