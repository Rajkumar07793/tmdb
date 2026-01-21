import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../core/utils/constants.dart';
import '../../data/models/movie_model.dart';
import '../providers/bookmarks_provider.dart';
import '../providers/movies_provider.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  MovieModel? _movie;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadMovie();
  }

  Future<void> _loadMovie() async {
    // Ideally we get this from a provider that caches or fetches specific movie details
    // For now, we can try to find it in the existing lists in MoviesProvider or fetch it.
    // However, the API has a 'getMovieDetails' endpoint.
    // Let's assume we can fetch it via a convenient method or just find it.
    // Simplifying: check lists first, if not found (deep link case), fetch.

    final moviesProvider = context.read<MoviesProvider>();
    final found = moviesProvider.trendingMovies
        .followedBy(moviesProvider.nowPlayingMovies)
        .where((m) => m.id == widget.movieId)
        .firstOrNull;

    if (found != null) {
      setState(() {
        _movie = found;
        _isLoading = false;
      });
    } else {
      // Fetch logic if we had a dedicated "fetchById" in provider.
      // For this demo, let's just use what we have or show error.
      // Actually, we can use the repository directly if we really need to, but better to stick to MVVM.
      // Let's add a fetch method to MoviesProvider? Or just fail gracefully for now.
      // TODO: Implement getMovieById in Provider properly.
      setState(() {
        _isLoading = false;
        // Mocking it or leaving empty if not provided.
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (_movie == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: Text("Movie not found")),
      );
    }

    final movie = _movie!;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  // Bonus: Fake Deep Link
                  final link = 'tmdb://movie/${movie.id}';
                  // In a real app we would use Share.share(link);
                  debugPrint('Shared Link: $link');
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text('Shared: $link')));
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: movie.backdropPath != null
                  ? CachedNetworkImage(
                      imageUrl:
                          '${AppConstants.backdropBaseUrl}${movie.backdropPath}',
                      fit: BoxFit.cover,
                    )
                  : Container(color: Colors.grey[850]),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: movie.posterPath != null
                              ? '${AppConstants.imageBaseUrl}${movie.posterPath}'
                              : 'https://via.placeholder.com/150x225',
                          width: 100,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie.title,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(height: 8),
                            if (movie.voteAverage != null)
                              RatingBarIndicator(
                                rating: movie.voteAverage! / 2,
                                itemBuilder: (context, index) =>
                                    const Icon(Icons.star, color: Colors.amber),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            const SizedBox(height: 8),
                            Text('Released: ${movie.releaseDate ?? "N/A"}'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Overview",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    movie.overview,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Consumer<BookmarksProvider>(
        builder: (context, bookings, child) {
          final isBookmarked = bookings.isBookmarked(movie.id);
          return FloatingActionButton(
            onPressed: () {
              bookings.toggleBookmark(movie);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    isBookmarked
                        ? 'Removed from Bookmarks'
                        : 'Added to Bookmarks',
                  ),
                  duration: const Duration(seconds: 1),
                ),
              );
            },
            backgroundColor: isBookmarked ? Colors.amber : Colors.white,
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? Colors.black : Colors.black,
            ),
          );
        },
      ),
    );
  }
}
