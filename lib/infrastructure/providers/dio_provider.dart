import 'package:dio/dio.dart';

class DioProvider {
  static Dio createDio({bool handleRefresh = true}) {
    final dio = Dio(
      BaseOptions(
        baseUrl:
            'https://alt.ligasabatinadefutbol.com.mx/teams/public/index.php/api',
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );

    return dio;
  }
}
