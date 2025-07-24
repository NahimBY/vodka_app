import 'package:vodka_app/domain/entities/assing.dart';
import 'package:vodka_app/domain/entities/user.dart';

class LoginResponse {
  final User user;
  final List<Assign> assign;
  final String token;

  LoginResponse({
    required this.user,
    required this.assign,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      assign:
          (json['assign'] as List<dynamic>)
              .map((e) => Assign.fromJson(e as Map<String, dynamic>))
              .toList(),
      token: json['token'] as String,
    );
  }
}
