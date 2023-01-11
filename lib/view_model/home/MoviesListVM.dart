import 'package:flutter/material.dart';
import 'package:flutter_mvvm/data/remote/response/ApiResponse.dart';
import 'package:flutter_mvvm/models/moviesList/MoviesMain.dart';
import 'package:flutter_mvvm/repository/movies/MovieRepoImp.dart';

class MoviesListVM extends ChangeNotifier {
  final _myRepo = MovieRepoImp();

  ApiResponse<MoviesMain> movieMain = ApiResponse.loading();

  void _setMovieMain(ApiResponse<MoviesMain> response){
    print('$response');
    movieMain = response;
    notifyListeners();
  }

  Future<void> fetchMovies() async {
    _setMovieMain(ApiResponse.loading());
    _myRepo
    .getMoviesList()
    .then((value) => _setMovieMain(ApiResponse.compleate(value)))
    .onError((error, stackTrace) => _setMovieMain(ApiResponse.error(error.toString())));
  }

}