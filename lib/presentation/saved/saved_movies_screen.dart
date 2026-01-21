import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/utils/constants.dart';
import '../providers/bookmarks_provider.dart';

class SavedMoviesScreen extends StatelessWidget {
  const SavedMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Saved Movies')),
      body: Consumer<BookmarksProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.bookmarks.isEmpty) {
            return const Center(child: Text("No saved movies yet"));
          }

          return ListView.builder(
            itemCount: provider.bookmarks.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (context, index) {
              final movie = provider.bookmarks[index];
              return Card(
                color: const Color(0xFF1E1E1E),
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(8),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: CachedNetworkImage(
                      imageUrl: movie.posterPath != null
                          ? '${AppConstants.imageBaseUrl}${movie.posterPath}'
                          : 'https://via.placeholder.com/500x750',
                      width: 50,
                      fit: BoxFit.cover,
                      errorWidget: (_, __, ___) =>
                          Container(width: 50, color: Colors.grey),
                    ),
                  ),
                  title: Text(
                    movie.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: Text(
                    'Rating: ${movie.voteAverage?.toStringAsFixed(1) ?? 'N/A'}',
                    style: TextStyle(color: Colors.grey[400]),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete_outline,
                      color: Colors.redAccent,
                    ),
                    onPressed: () => provider.toggleBookmark(movie),
                  ),
                  onTap: () => context.go('/movie/${movie.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
