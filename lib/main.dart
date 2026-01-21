import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'core/database/app_database.dart';
import 'core/network/api_client.dart';
import 'data/datasources/remote_datasource.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'presentation/details/movie_details_screen.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/input/search_screen.dart';
import 'presentation/providers/bookmarks_provider.dart';
import 'presentation/providers/movies_provider.dart';
import 'presentation/providers/search_provider.dart';
import 'presentation/saved/saved_movies_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // lock orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Dependencies
  final database = AppDatabase();
  final apiClient = ApiClient();
  final apiService = ApiService(apiClient.dio);
  final movieRepository = MovieRepositoryImpl(apiService, database);

  runApp(MyApp(movieRepository: movieRepository));
}

class MyApp extends StatelessWidget {
  final MovieRepositoryImpl movieRepository;

  MyApp({super.key, required this.movieRepository});

  late final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'search',
            builder: (context, state) => const SearchScreen(),
          ),
          GoRoute(
            path: 'saved',
            builder: (context, state) => const SavedMoviesScreen(),
          ),
          GoRoute(
            path: 'movie/:id',
            builder: (context, state) {
              final id = int.parse(state.pathParameters['id']!);
              return MovieDetailsScreen(movieId: id);
            },
          ),
        ],
      ),
    ],
  );

  final _theme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE50914), // Netflix Red-ish
      brightness: Brightness.dark,
    ).copyWith(surface: const Color(0xFF1E1E1E)),
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF121212),
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(color: Colors.white70),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider(movieRepository)),
        ChangeNotifierProvider(
          create: (_) => BookmarksProvider(movieRepository),
        ),
        ChangeNotifierProvider(create: (_) => SearchProvider(movieRepository)),
      ],
      child: MaterialApp.router(
        title: 'TMDB Movies',
        debugShowCheckedModeBanner: false,
        theme: _theme,
        routerConfig: _router,
      ),
    );
  }
}
