import 'package:equatable/equatable.dart';

class LoginFormState extends Equatable{
  final String email;
  final String password;
  final bool isLoading;
  final bool obscureText;

  const LoginFormState({
    this.email = '',
    this.password = '',
    this.isLoading = false,
    this.obscureText = true,
  });

  LoginFormState copyWith({
    String? email,
    String? password,
    bool? isLoading,
    bool? obscureText,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      isLoading: isLoading ?? this.isLoading,
      obscureText: obscureText ?? this.obscureText,
    );
  }

  @override
  List<Object?> get props => [email, password, isLoading, obscureText];
}