// ignore_for_file: use_rethrow_when_possible, avoid_print, dead_code

import 'package:flutter_mvvm/data/remote/network/ApiEndPoints.dart';
import 'package:flutter_mvvm/data/remote/network/BaseApiService.dart';
import 'package:flutter_mvvm/data/remote/network/NetworkApiService.dart';
import 'package:flutter_mvvm/models/moviesList/MoviesMain.dart';
import 'package:flutter_mvvm/repository/movies/MovieRepo.dart';

class MovieRepoImp implements MovieRepo {

  final BaseApiService _apiService = NetworkApiService();

  @override
  Future<MoviesMain?> getMoviesList() async {
    try{
      dynamic response = await _apiService.getResponse(
        ApiEndPoints().getMovies
      );
      print("$response");
      final jsonData = MoviesMain.fromJson(response);
      return jsonData;
    }catch(e){
      throw e;
      print("$e");
    }
  }

}