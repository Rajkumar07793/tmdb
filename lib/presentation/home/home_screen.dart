import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../core/utils/constants.dart';
import '../providers/movies_provider.dart';
import '../../data/models/movie_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<MoviesProvider>().loadData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TMDB Movies',
            style: TextStyle(
                color: Colors.redAccent, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => context.go('/search'),
          ),
          IconButton(
            icon: const Icon(Icons.bookmark),
            onPressed: () => context.go('/saved'),
          ),
        ],
      ),
      body: Consumer<MoviesProvider>(
        builder: (context, provider, child) {
          if (provider.isLoadingTrending && provider.trendingMovies.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null && provider.trendingMovies.isEmpty) {
            return Center(child: Text('Error: ${provider.error}'));
          }

          return RefreshIndicator(
            onRefresh: () => provider.loadData(),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Trending Now',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  _buildTrendingCarousel(context, provider.trendingMovies),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Now Playing',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                  _buildNowPlayingGrid(context, provider.nowPlayingMovies),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrendingCarousel(BuildContext context, List<MovieModel> movies) {
    if (movies.isEmpty) return const SizedBox.shrink();

    return CarouselSlider(
      options: CarouselOptions(
        height: 400.0,
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        aspectRatio: 16 / 9,
      ),
      items: movies.map((movie) {
        return Builder(
          builder: (BuildContext context) {
            return GestureDetector(
              onTap: () => context.go('/movie/${movie.id}'),
              child: Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      movie.posterPath != null
                          ? '${AppConstants.imageBaseUrl}${movie.posterPath}'
                          : 'https://via.placeholder.com/500x750',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.8),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  alignment: Alignment.bottomLeft,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildNowPlayingGrid(BuildContext context, List<MovieModel> movies) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        final movie = movies[index];
        return GestureDetector(
          onTap: () => context.go('/movie/${movie.id}'),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: movie.posterPath != null
                        ? '${AppConstants.imageBaseUrl}${movie.posterPath}'
                        : 'https://via.placeholder.com/500x750',
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey[900]),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                movie.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 14),
                  const SizedBox(width: 4),
                  Text(movie.voteAverage?.toStringAsFixed(1) ?? 'N/A',
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
