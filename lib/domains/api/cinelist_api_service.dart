import 'package:cinelist/models/animes.dart';
import 'package:cinelist/models/tvs.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
//import '../models/top_aired_fanart_model.dart';
//import '../models/animes.dart';
//import '../models/show_model.dart';

part 'cinelist_api_service.g.dart';

@RestApi(baseUrl: "https://api.simkl.com/")
abstract class CinelistApiService {
  factory CinelistApiService(Dio dio, {String baseUrl}) = _CinelistApiService;


  @GET("/anime")
  Future<Animes> getTrendingAnime();

  @GET("/anime/{id}")
  Future<Animes> getAnimeDetails(@Path("id") String id);

  @GET("/tv")
  Future<TVs> getTrendingSeries();

  @GET("/tv/{id}")
  Future<TVs> getSeriesDetails(@Path("id") String id);
  //Liste


  /*
  @GET("/search/all")
  Future<List<SearchResultModel>> searchAnimeOrSeries(@Query("q") String query);
  */

  }




