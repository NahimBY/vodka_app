import 'package:vodka_app/domain/entities/auth_response.dart';
import 'package:vodka_app/domain/entities/user.dart';
import 'package:vodka_app/infrastructure/models/userdb/login_response.dart';
import 'package:vodka_app/infrastructure/models/userdb/user_response.dart';

class AuthMapper {
  static User userResponseToEntity(UserResponse userResponse) => User(
    id: userResponse.id,
    name: userResponse.name,
    email: userResponse.email,
    role: userResponse.role,
  );

  static AuthResponse loginResponseToEntity(LoginResponse loginResponse) =>
      AuthResponse(
        id: loginResponse.user.id,
        name: loginResponse.user.name,
        email: loginResponse.user.email,
        token: loginResponse.token);
}
