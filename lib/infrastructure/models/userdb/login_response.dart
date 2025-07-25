import 'package:json_annotation/json_annotation.dart';
import 'package:vodka_app/domain/entities/assing/assing.dart';
import 'package:vodka_app/domain/entities/user/user.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final User user;
  final List<Assign> assign;
  final String token;

  LoginResponse({
    required this.user,
    required this.assign,
    required this.token,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}
