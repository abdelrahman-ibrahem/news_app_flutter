import 'package:dio/dio.dart';
import 'package:newsapp/core/constants/dio_url_paths.dart';

class DioHelper {
  static Dio dio = Dio();
  static init() {
    dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  // get method handler
  Future<Response> get({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(url, queryParameters: query);
  }
}
