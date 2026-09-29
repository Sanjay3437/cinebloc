import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_now_playing_movies.dart';
import '../../domain/usecases/get_popular_movies.dart';
import 'movie_event.dart';
import 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMovies getNowPlayingMovies;
  final GetPopularMovies getPopularMovies;

  MovieBloc({
    required this.getNowPlayingMovies,
    required this.getPopularMovies,
  }) : super(MovieInitial()) {
    on<FetchNowPlayingMovies>(_onFetchNowPlaying);
    on<FetchPopularMovies>(_onFetchPopular);
  }

  Future<void> _onFetchNowPlaying(
      FetchNowPlayingMovies event,
      Emitter<MovieState> emit,
      ) async {
    emit(MovieLoading());

    final nowPlayingResult = await getNowPlayingMovies();
    final popularResult = await getPopularMovies();

    final nowPlayingMovies = nowPlayingResult.getOrElse(() => []);
    final popularMovies = popularResult.getOrElse(() => []);

    if (nowPlayingResult.isLeft() && popularResult.isLeft()) {
      emit(MovieError('Failed to load movies'));
    } else {
      emit(MovieLoaded(
        nowPlaying: nowPlayingMovies,
        popular: popularMovies,
      ));
    }
  }

  Future<void> _onFetchPopular(
      FetchPopularMovies event,
      Emitter<MovieState> emit,
      ) async {
    emit(MovieLoading());
    final result = await getPopularMovies();
    result.fold(
          (error) => emit(MovieError(error)),
          (movies) => emit(MovieLoaded(nowPlaying: [], popular: movies)),
    );
  }
}