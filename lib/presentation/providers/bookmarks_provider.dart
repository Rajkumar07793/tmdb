import 'package:flutter/material.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../data/models/movie_model.dart';

class BookmarksProvider extends ChangeNotifier {
  final MovieRepository _repository;

  List<MovieModel> _bookmarks = [];
  bool _isLoading = false;

  BookmarksProvider(this._repository) {
    loadBookmarks();
  }

  List<MovieModel> get bookmarks => _bookmarks;
  bool get isLoading => _isLoading;

  Future<void> loadBookmarks() async {
    _isLoading = true;
    notifyListeners();
    try {
      _bookmarks = await _repository.getBookmarkedMovies();
    } catch (e) {
      debugPrint('Error loading bookmarks: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> toggleBookmark(MovieModel movie) async {
    await _repository.toggleBookmark(movie);
    await loadBookmarks(); // Refresh list
  }

  bool isBookmarked(int id) {
    return _bookmarks.any((m) => m.id == id);
  }
}
