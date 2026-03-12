import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;
  final String baseUrl = 'https://api.aladhan.com/v1';

  ApiService(this.dio);

  Future<Response> get({
    required String endpoint,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get('$baseUrl/$endpoint', queryParameters: query);
  }
}
