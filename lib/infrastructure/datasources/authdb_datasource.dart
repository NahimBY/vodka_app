import 'package:dio/dio.dart';
import 'package:vodka_app/domain/datasources/auth_datasource.dart';
import 'package:vodka_app/domain/entities/auth_response.dart';
import 'package:vodka_app/infrastructure/mappers/auth_mapper.dart';
import 'package:vodka_app/infrastructure/models/userdb/login_response.dart';
import 'package:vodka_app/infrastructure/providers/dio_provider.dart';
import 'package:vodka_app/infrastructure/services/key_value_storage_service.dart';

class AuthdbDatasource extends AuthDatasource {
  late final Dio dio = DioProvider.createDio();

  String? get token => KeyValueStorageService.getString('auth_token');

  @override
  Future<AuthResponse> login(String email, String password) async {
    try {
      final response = await dio.post(
        '/users/login',
        data: {'email': email, 'password': password},
      );

      final loginResponse = LoginResponse.fromJson(response.data);

      return AuthMapper.loginResponseToEntity(loginResponse);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final errorData = e.response?.data;
        throw Exception(errorData['message'] ?? 'Unknown error');
      }
      rethrow;
    }
  }
}
