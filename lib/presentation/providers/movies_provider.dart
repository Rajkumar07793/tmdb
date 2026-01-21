import 'package:flutter/material.dart';
import '../../domain/repositories/movie_repository.dart';
import '../../data/models/movie_model.dart';

class MoviesProvider extends ChangeNotifier {
  final MovieRepository _repository;

  List<MovieModel> _trendingMovies = [];
  List<MovieModel> _nowPlayingMovies = [];
  bool _isLoadingTrending = false;
  bool _isLoadingNowPlaying = false;
  String? _error;

  MoviesProvider(this._repository);

  List<MovieModel> get trendingMovies => _trendingMovies;
  List<MovieModel> get nowPlayingMovies => _nowPlayingMovies;
  bool get isLoadingTrending => _isLoadingTrending;
  bool get isLoadingNowPlaying => _isLoadingNowPlaying;
  String? get error => _error;

  Future<void> loadData() async {
    _error = null;
    await Future.wait([
      fetchTrending(),
      fetchNowPlaying(),
    ]);
  }

  Future<void> fetchTrending() async {
    _isLoadingTrending = true;
    notifyListeners();
    try {
      _trendingMovies = await _repository.getTrendingMovies();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoadingTrending = false;
      notifyListeners();
    }
  }

  Future<void> fetchNowPlaying() async {
    _isLoadingNowPlaying = true;
    notifyListeners();
    try {
      _nowPlayingMovies = await _repository.getNowPlayingMovies();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoadingNowPlaying = false;
      notifyListeners();
    }
  }
}
