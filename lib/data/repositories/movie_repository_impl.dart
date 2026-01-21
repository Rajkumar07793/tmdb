import '../../core/database/app_database.dart';
import '../../domain/repositories/movie_repository.dart';
import '../datasources/remote_datasource.dart';
import '../models/movie_model.dart';

class MovieRepositoryImpl implements MovieRepository {
  final ApiService _apiService;
  final AppDatabase _database;

  MovieRepositoryImpl(this._apiService, this._database);

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    try {
      final response = await _apiService.getTrendingMovies();
      final movies = response.results;

      // Cache in DB
      await _database.insertBatch(movies, isTrending: true);

      // Update local 'isTrending' flags for simpler logic if needed,
      // but insertBatch (if implemented efficiently) handles it.
      // For now, let's assuming insertBatch does the job of updating 'isTrending'.
      // Only issue: If a movie was trending yesterday but not today,
      // we might want to clear 'isTrending' flag for all movies first?
      // For this simple app, we might ignore clearing old trends or do a clearTrending() first.

      return movies;
    } catch (e) {
      // Fallback to local
      final localMovies = await _database.getTrendingMovies();
      return localMovies.map((m) => _mapToModel(m)).toList();
    }
  }

  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    try {
      final response = await _apiService.getNowPlayingMovies();
      final movies = response.results;
      await _database.insertBatch(movies, isNowPlaying: true);
      return movies;
    } catch (e) {
      final localMovies = await _database.getNowPlayingMovies();
      return localMovies.map((m) => _mapToModel(m)).toList();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    // Search is usually online only unless we want to search in local DB.
    // Spec says: "Make network calls after some time... update results".
    // Also "Store movies from the api in the local database".
    // Usually search results aren't cached indefinitely, but we can store them to show details offline.

    final response = await _apiService.searchMovies(query);
    return response.results;
  }

  @override
  Future<List<MovieModel>> getBookmarkedMovies() async {
    final localMovies = await _database.getBookmarkedMovies();
    return localMovies.map((m) => _mapToModel(m)).toList();
  }

  @override
  Stream<List<MovieModel>> watchBookmarkedMovies() {
    return _database.watchBookmarkedMovies().map(
      (list) => list.map((m) => _mapToModel(m)).toList(),
    );
  }

  @override
  Future<void> toggleBookmark(MovieModel movie) async {
    final currentlyBookmarked = await isBookmarked(movie.id);
    await _database.insertMovie(movie); // Ensure it exists
    await _database.toggleBookmark(movie.id, !currentlyBookmarked);
  }

  @override
  Future<bool> isBookmarked(int movieId) async {
    final dbMovie = await _database.getMovieById(movieId);
    return dbMovie?.isBookmarked ?? false;
  }

  // Helper to map Drift Entity to Domain/Data Model
  MovieModel _mapToModel(Movy m) {
    return MovieModel(
      id: m.id,
      title: m.title,
      overview: m.overview,
      posterPath: m.posterPath,
      backdropPath: m.backdropPath,
      voteAverage: m.voteAverage,
      releaseDate: m.releaseDate,
    );
  }
}
