import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/network/dio_client.dart';
import 'features/movies/data/datasources/movie_remote_datasource.dart';
import 'features/movies/data/repositories/movie_repository_impl.dart';
import 'features/movies/domain/usecases/get_now_playing_movies.dart';
import 'features/movies/domain/usecases/get_popular_movies.dart';
import 'features/movies/presentation/bloc/movie_bloc.dart';
import 'features/movies/presentation/bloc/movie_event.dart';
import 'features/movies/presentation/pages/home_screen.dart';

void main() {
  runApp(const CineBlocApp());
}

class CineBlocApp extends StatelessWidget {
  const CineBlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Dependency injection (manual)
    final dioClient = DioClient();
    final remoteDatasource = MovieRemoteDatasourceImpl(dioClient);
    final repository = MovieRepositoryImpl(remoteDatasource);
    final getNowPlaying = GetNowPlayingMovies(repository);
    final getPopular = GetPopularMovies(repository);

    return BlocProvider(
      create: (_) => MovieBloc(
        getNowPlayingMovies: getNowPlaying,
        getPopularMovies: getPopular,
      )..add(FetchNowPlayingMovies()),
      child: MaterialApp(
        title: 'CineBloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: const HomeScreen(),
      ),
    );
  }
}