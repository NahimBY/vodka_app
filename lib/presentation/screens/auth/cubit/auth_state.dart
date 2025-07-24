enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState {
  final AuthStatus status;
  final String? token;
  final String? errorMessage;
  final Map<String, dynamic>? decodedToken;
  final String? userId;
  final String? name;
  final String? email;
  final String? role;

  AuthState({
    this.status = AuthStatus.initial,
    this.token,
    this.errorMessage,
    this.decodedToken,
    this.userId,
    this.name,
    this.email,
    this.role,
  });

  AuthState copyWith({
    AuthStatus? status,
    String? token,
    String? errorMessage,
    Map<String, dynamic>? decodedToken,
    String? userId,
    String? name,
    String? email,
    String? role,
  }) {
    final newState = AuthState(
      status: status ?? this.status,
      token: token ?? this.token,
      errorMessage: errorMessage ?? this.errorMessage,
      decodedToken: decodedToken ?? this.decodedToken,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
    );
    return newState;
  }
}
