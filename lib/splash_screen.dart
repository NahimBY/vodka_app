import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vodka_app/config/router/app_router.dart';
import 'package:vodka_app/config/theme/app_theme.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/auth_state.dart';

class SplashScreen extends StatelessWidget {
  static const String name = 'splash_screen';
  static const Duration splashDuration = Duration(seconds: 5);

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Iniciar verificación de autenticación
    try {
      final authCubit = context.read<AuthCubit>();
      if (authCubit.state.status == AuthStatus.initial) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          authCubit.checkStoredToken();
        });
      }
    } catch (e) {
      print('SPLASH: Error al acceder AuthCubit: $e');
    }

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // Solo navegar cuando la verificación de autenticación esté completa
        if (state.status == AuthStatus.authenticated ||
            state.status == AuthStatus.unauthenticated ||
            state.status == AuthStatus.error) {
          // Esperar el tiempo completo del splash antes de navegar
          Future.delayed(splashDuration, () {
            if (context.mounted) {
              _navigateBasedOnAuthStatus(context, state.status);
            }
          });
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.customDarkRed,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/splash/vdk.gif'),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateBasedOnAuthStatus(BuildContext context, AuthStatus status) {
    if (!context.mounted) return;

    try {
      switch (status) {
        case AuthStatus.authenticated:
          context.read<RouterSimpleCubit>().goWrapper();
          break;
        case AuthStatus.unauthenticated:
        case AuthStatus.error:
          context.read<RouterSimpleCubit>().goLogin();
          break;
        default:
          break;
      }
    } catch (e) {
      print('SPLASH: Error en navegación: $e');
    }
  }
}
