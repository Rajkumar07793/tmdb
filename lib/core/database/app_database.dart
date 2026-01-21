import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../data/models/movie_model.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Movies])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // Insert or Update Movie
  Future<void> insertMovie(
    MovieModel movie, {
    bool? isTrending,
    bool? isNowPlaying,
  }) async {
    // We need to be careful not to overwrite the 'isBookmarked' flag if it exists.
    // So we check if it exists first.
    final existing = await (select(
      movies,
    )..where((t) => t.id.equals(movie.id))).getSingleOrNull();

    final wasBookmarked = existing?.isBookmarked ?? false;
    final wasTrending = isTrending ?? existing?.isTrending ?? false;
    final wasNowPlaying = isNowPlaying ?? existing?.isNowPlaying ?? false;

    await into(movies).insertOnConflictUpdate(
      MoviesCompanion(
        id: Value(movie.id),
        title: Value(movie.title),
        overview: Value(movie.overview),
        posterPath: Value(movie.posterPath),
        backdropPath: Value(movie.backdropPath),
        voteAverage: Value(movie.voteAverage),
        releaseDate: Value(movie.releaseDate),
        isTrending: Value(wasTrending),
        isNowPlaying: Value(wasNowPlaying),
        isBookmarked: Value(wasBookmarked),
      ),
    );
  }

  Future<void> insertBatch(
    List<MovieModel> moviesList, {
    bool isTrending = false,
    bool isNowPlaying = false,
  }) async {
    await batch((batch) {
      // Empty batch - we do sequential inserts below to preserve isBookmarked
    });

    // Doing it sequentially for safety to preserve 'isBookmarked'
    for (final movie in moviesList) {
      await insertMovie(
        movie,
        isTrending: isTrending,
        isNowPlaying: isNowPlaying,
      );
    }
  }

  // Queries
  Future<List<Movy>> getTrendingMovies() =>
      (select(movies)..where((t) => t.isTrending.equals(true))).get();

  Future<List<Movy>> getNowPlayingMovies() =>
      (select(movies)..where((t) => t.isNowPlaying.equals(true))).get();

  Future<List<Movy>> getBookmarkedMovies() =>
      (select(movies)..where((t) => t.isBookmarked.equals(true))).get();

  Future<void> toggleBookmark(int id, bool isBookmarked) {
    return (update(movies)..where((t) => t.id.equals(id))).write(
      MoviesCompanion(isBookmarked: Value(isBookmarked)),
    );
  }

  Stream<List<Movy>> watchBookmarkedMovies() {
    return (select(movies)..where((t) => t.isBookmarked.equals(true))).watch();
  }

  Future<Movy?> getMovieById(int id) =>
      (select(movies)..where((t) => t.id.equals(id))).getSingleOrNull();

  // Clear cache (optional: reset flags but keep bookmarks)
  Future<void> clearCache() async {
    // Set isTrending and isNowPlaying to false for all, but keep entries if isBookmarked is true
    // Or just delete if not bookmarked.
    // For now, let's keep it simple.
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
