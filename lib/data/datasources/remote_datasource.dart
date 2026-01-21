import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/movie_model.dart';
import '../models/movie_response.dart';

part 'remote_datasource.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET('/trending/movie/day')
  Future<MovieResponse> getTrendingMovies(@Query('api_key') String apiKey);

  @GET('/movie/now_playing')
  Future<MovieResponse> getNowPlayingMovies(@Query('api_key') String apiKey);

  @GET('/movie/{id}')
  Future<MovieModel> getMovieDetails(
    @Path('id') int id,
    @Query('api_key') String apiKey,
  );

  @GET('/search/movie')
  Future<MovieResponse> searchMovies(
    @Query('query') String query,
    @Query('api_key') String apiKey,
  );
}
