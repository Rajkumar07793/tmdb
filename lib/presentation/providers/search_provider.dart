import 'dart:async';

import 'package:flutter/material.dart';

import '../../data/models/movie_model.dart';
import '../../domain/repositories/movie_repository.dart';

class SearchProvider extends ChangeNotifier {
  final MovieRepository _repository;

  List<MovieModel> _searchResults = [];
  bool _isLoading = false;
  Timer? _debounce;

  SearchProvider(this._repository);

  List<MovieModel> get searchResults => _searchResults;
  bool get isLoading => _isLoading;

  void onSearchQueryChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    if (query.isEmpty) {
      _searchResults = [];
      notifyListeners();
      return;
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      _performSearch(query);
    });
  }

  Future<void> _performSearch(String query) async {
    _isLoading = true;
    notifyListeners();

    try {
      _searchResults = await _repository.searchMovies(query);
    } catch (e) {
      debugPrint('Search error: $e');
      _searchResults = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
