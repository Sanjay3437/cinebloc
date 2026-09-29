// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:cinebloc/features/movies/domain/entities/movie.dart';

void main() {
  test('Movie entity creation and equality', () {
    const movie1 = Movie(
      id: 1,
      title: 'Inception',
      overview: 'A mind-bending thriller',
      posterPath: '/path.jpg',
      voteAverage: 8.8,
      releaseDate: '2010-07-16',
    );

    const movie2 = Movie(
      id: 1,
      title: 'Inception',
      overview: 'A mind-bending thriller',
      posterPath: '/path.jpg',
      voteAverage: 8.8,
      releaseDate: '2010-07-16',
    );

    expect(movie1, equals(movie2));
    expect(movie1.title, 'Inception');
  });
}
