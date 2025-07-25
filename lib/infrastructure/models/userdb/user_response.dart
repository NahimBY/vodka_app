class UserResponse {
  final int id;
  final String name;
  final String email;
  final String? role;

  UserResponse({
    required this.id,
    required this.name,
    required this.email,
    this.role,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
  );
}
