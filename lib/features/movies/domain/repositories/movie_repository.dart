import 'package:dartz/dartz.dart';
import '../entities/movie.dart';

abstract class MovieRepository {
  Future<Either<String, List<Movie>>> getNowPlayingMovies();
  Future<Either<String, List<Movie>>> getPopularMovies();
}