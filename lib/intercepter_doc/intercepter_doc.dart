/*
import 'package:dio/dio.dart';

class ApiClient {
  late Dio _dio;

  ApiClient() {
    _dio = Dio(BaseOptions(
      baseUrl: 'https://api.example.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // Token যোগ করা হচ্ছে
        options.headers['Authorization'] = 'Bearer YOUR_ACCESS_TOKEN';
        print('Request: ${options.method} ${options.uri}');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        // Successful response handling
        print('Response: ${response.statusCode}');
        return handler.next(response);
      },
      onError: (DioError error, handler) {
        // Error handling
        print('Error: ${error.message}');
        return handler.next(error);
      },
    ));
  }

  Future<Response> fetchData(String endpoint) async {
    return await _dio.get(endpoint);
  }
}


class UserRepository {
  final ApiClient apiClient;

  UserRepository(this.apiClient);

  Future<User> getUser() async {
    final response = await apiClient.fetchData('/user');
    return User.fromJson(response.data); // JSON থেকে User অবজেক্ট তৈরি
  }
}*/
