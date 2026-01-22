import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../core/utils/constants.dart';
import '../providers/search_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SearchProvider>();

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Search movies...',
            hintStyle: TextStyle(color: Colors.white54),
            border: InputBorder.none,
          ),
          onChanged: provider.onSearchQueryChanged,
        ),
      ),
      body: provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: provider.searchResults.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, color: Colors.white24),
              itemBuilder: (context, index) {
                final movie = provider.searchResults[index];
                return ListTile(
                  leading: movie.posterPath != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${AppConstants.imageBaseUrl}${movie.posterPath}',
                            width: 50,
                            fit: BoxFit.cover,
                            placeholder: (_, __) =>
                                Container(width: 50, color: Colors.grey[900]),
                          ),
                        )
                      : Container(
                          width: 50,
                          height: 75,
                          color: Colors.grey[900],
                        ),
                  title: Text(
                    movie.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(movie.releaseDate?.split('-').first ?? ''),
                  onTap: () => context.go('/movie/${movie.id}'),
                );
              },
            ),
    );
  }
}
