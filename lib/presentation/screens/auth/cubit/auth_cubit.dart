import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vodka_app/domain/repositories/auth_repository.dart';
import 'package:vodka_app/infrastructure/services/key_value_storage_service.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  static const String accessTokenKey = 'auth_token';
  static const String userIdKey = 'id';
  static const String nameKey = 'name';
  static const String emailKey = 'email';
  static const String roleKey = 'role';

  AuthCubit(this._authRepository) : super(AuthState()) {
    // Ejecutar checkStoredToken inmediatamente
    WidgetsBinding.instance.addPostFrameCallback((_) {
      checkStoredToken();
    });
  }

  Future<void> checkStoredToken() async {
    if (isClosed) {
      return;
    }

    emit(state.copyWith(status: AuthStatus.loading));

    try {
      await Future.delayed(const Duration(milliseconds: 100));

      final token = KeyValueStorageService.getString(accessTokenKey);

      if (token != null && token.isNotEmpty) {
        final userId = KeyValueStorageService.getString(userIdKey);
        final name = KeyValueStorageService.getString(nameKey);
        final email = KeyValueStorageService.getString(emailKey);
        final role = KeyValueStorageService.getString(roleKey);

        if (!isClosed) {
          emit(
            state.copyWith(
              status: AuthStatus.authenticated,
              token: token,
              userId: userId,
              name: name,
              email: email,
              role: role,
            ),
          );
        }
      } else {
        if (!isClosed) {
          emit(state.copyWith(status: AuthStatus.unauthenticated));
        }
      }
    } catch (e) {
      if (!isClosed) {
        emit(
          state.copyWith(
            status: AuthStatus.error,
            errorMessage: 'Error verificando autenticación: $e',
          ),
        );
      }
    }
  }

  Future<void> login(String email, String password) async {
    try {
      emit(state.copyWith(status: AuthStatus.loading, errorMessage: null));

      final response = await _authRepository.login(email, password);

      // Guardar los datos del usuario y el token
      await Future.wait([
        KeyValueStorageService.setValue(accessTokenKey, response.token),
        KeyValueStorageService.setValue(userIdKey, response.id.toString()),
        KeyValueStorageService.setValue(nameKey, response.name),
        KeyValueStorageService.setValue(emailKey, response.email),
        if (response.role != null)
          KeyValueStorageService.setValue(roleKey, response.role!),
      ]);

      emit(
        state.copyWith(
          status: AuthStatus.authenticated,
          token: response.token,
          decodedToken: null,
          userId: response.id.toString(),
          name: response.name,
          email: response.email,
          role: response.role,
        ),
      );
    } catch (e) {
      handleLoginError(e);
    }
  }

  Future<void> logout() async {
    await Future.wait([
      KeyValueStorageService.remove(accessTokenKey),
      KeyValueStorageService.remove(userIdKey),
      KeyValueStorageService.remove(nameKey),
      KeyValueStorageService.remove(emailKey),
    ]);

    emit(AuthState(status: AuthStatus.unauthenticated));
  }

  void handleLoginError(dynamic e) {
    String errorMessage;
    if (e.toString().contains("incorrectos")) {
      errorMessage = "Correo y/o contraseña incorrectos.";
    } else {
      errorMessage = "Ocurrió un error inesperado.";
    }

    emit(state.copyWith(status: AuthStatus.error, errorMessage: errorMessage));
  }

  void emitLoading() {
    emit(state.copyWith(status: AuthStatus.loading));
  }

  void emitError(String errorMessage) {
    emit(state.copyWith(status: AuthStatus.error, errorMessage: errorMessage));
  }

  void emitAuthenticated(String token, Map<String, dynamic> decodedToken) {
    emit(
      state.copyWith(
        status: AuthStatus.authenticated,
        token: token,
        decodedToken: decodedToken,
      ),
    );
  }

  void emitUnauthenticated() {
    emit(AuthState(status: AuthStatus.unauthenticated));
  }
}
