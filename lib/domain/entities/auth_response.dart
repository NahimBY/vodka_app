class AuthResponse {
  final int id;
  final String name;
  final String email;
  final String? role;
  final String token;

  AuthResponse({
    required this.id,
    required this.name,
    required this.email,
    this.role,
    required this.token,
  });
}
