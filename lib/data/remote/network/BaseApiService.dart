// ignore_for_file: file_names

import 'package:flutter_mvvm/utils/constant.dart';

abstract class BaseApiService {
  final String baseUrl = baseAPIUrl;
  Future<dynamic> getResponse(String url);
}