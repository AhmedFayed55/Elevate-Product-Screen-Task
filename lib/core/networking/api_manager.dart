import 'package:dio/dio.dart';
import 'package:elevate_task/core/constants.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class ApiManager {
  final dio = Dio();

  Future<Response> getData({
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      Constants.baseUrl + Constants.endPoint,
      queryParameters: queryParameters,
      options: Options(headers: headers, validateStatus: (status) => true),
    );
  }
}
