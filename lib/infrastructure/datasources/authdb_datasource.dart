import 'package:dio/dio.dart';
import 'package:vodka_app/domain/datasources/auth_datasource.dart';
import 'package:vodka_app/domain/entities/auth_response.dart';
import 'package:vodka_app/infrastructure/mappers/auth_mapper.dart';
import 'package:vodka_app/infrastructure/providers/dio_provider.dart';
import 'package:vodka_app/infrastructure/services/key_value_storage_service.dart';
import 'package:vodka_app/infrastructure/services/retrofit/auth/auth_service.dart';

class AuthdbDatasource extends AuthDatasource {
  late final AuthService _authService;

  AuthdbDatasource() {
    final dio = DioProvider.createDio();
    _authService = AuthService(dio);
  }

  String? get token => KeyValueStorageService.getString('auth_token');

  @override
  Future<AuthResponse> login(String email, String password) async {
    try {
      final loginData = {'email': email, 'password': password};

      final loginResponse = await _authService.login(loginData);

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
