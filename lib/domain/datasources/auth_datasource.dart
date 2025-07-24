import 'package:vodka_app/domain/entities/auth_response.dart';

abstract class AuthDatasource {
  Future<AuthResponse> login(String email, String password);
}