import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:vodka_app/infrastructure/models/userdb/login_response.dart';

part 'auth_service.g.dart';

@RestApi()
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl}) = _AuthService;

  @POST('/users/login')
  Future<LoginResponse> login(@Body() Map<String, dynamic> loginData);
}