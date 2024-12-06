import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
//import '../models/top_aired_fanart_model.dart';
//import '../models/animes.dart';
//import '../models/show_model.dart';

part 'cinelist_api_service.g.dart';

@RestApi(baseUrl: "https://api.simkl.com/")
abstract class CinelistApiService {
  factory CinelistApiService(Dio dio, {String baseUrl}) = _CinelistApiService;

  /*
  @GET("/anime/id")
  Future<List<AnimeModel>> getTrendingAnime({
    @Header("Authorization") required String apiKey,
  });

  @GET("/tv/id")
  Future<List<ShowModel>> getTrendingShows({
    @Header("Authorization") required String apiKey,
  });

  @GET("/search/all")
  Future<List<SearchResultModel>> search({
    @Header("Authorization") required String apiKey,
    @Query("q") required String query,
  });
  */
  }




