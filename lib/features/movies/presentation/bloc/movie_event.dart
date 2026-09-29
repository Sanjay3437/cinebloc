import 'package:equatable/equatable.dart';

abstract class MovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchNowPlayingMovies extends MovieEvent {}

class FetchPopularMovies extends MovieEvent {}