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

  @GET("/tv")
  Future<TVs> getAllSeries();

  @GET("/tv/{id}")
  Future<TVs> getSeriesDetails(@Path("id") String id);

  @GET("/tv/trending")
  Future<TVs> getTrendingSeries();

  @GET("/anime")
  Future<TVs> getAllAnime();

  }




