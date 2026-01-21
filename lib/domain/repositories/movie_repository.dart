import '../../data/models/movie_model.dart';
// Ideally Domain should not know about Database entities.
// But for simplicity, we can use MovieModel or create a Domain Entity.
// Let's use MovieModel as Domain Entity for this scale.

abstract class MovieRepository {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> searchMovies(String query);
  Future<List<MovieModel>> getBookmarkedMovies();
  Stream<List<MovieModel>> watchBookmarkedMovies();
  Future<void> toggleBookmark(MovieModel movie);
  Future<bool> isBookmarked(int id);
}
