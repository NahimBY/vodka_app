import 'package:vodka_app/domain/datasources/auth_datasource.dart';
import 'package:vodka_app/domain/entities/auth_response.dart';
import 'package:vodka_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository{
  final AuthDatasource datasource;

  AuthRepositoryImpl(this.datasource);

  @override
  Future<AuthResponse> login(String email, String password) {
    return datasource.login(email, password);
  }
}