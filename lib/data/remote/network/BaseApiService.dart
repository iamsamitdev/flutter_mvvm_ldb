// ignore_for_file: file_names

abstract class BaseApiService {
  final String baseUrl = "https://api.themoviedb.org/3/movie/";
  Future<dynamic> getResponse(String url);
}