import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vodka_app/config/router/app_router.dart';
import 'package:vodka_app/config/theme/app_theme.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/auth_state.dart';

class SplashScreen extends StatelessWidget {
  static const String name = 'splash_screen';

  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        // Redirigir basándose en el estado de autenticación
        switch (state.status) {
          case AuthStatus.authenticated:
            // Pequeño delay para que se vea el splash
            Future.delayed(const Duration(seconds: 1), () {
              if (context.mounted) {
                context.read<RouterSimpleCubit>().goWrapper();
              }
            });
            break;
          case AuthStatus.unauthenticated:
            // Pequeño delay para que se vea el splash
            Future.delayed(const Duration(seconds: 1), () {
              if (context.mounted) {
                context.read<RouterSimpleCubit>().goRoute('login');
              }
            });
            break;
          case AuthStatus.error:
            // En caso de error, redirigir a login
            Future.delayed(const Duration(seconds: 1), () {
              if (context.mounted) {
                context.read<RouterSimpleCubit>().goRoute('login');
              }
            });
            break;
          default:
            // Para loading e initial, no hacer nada (mostrar splash)
            break;
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
                // Opcional: Mostrar indicador de carga
                BlocBuilder<AuthCubit, AuthState>(
                  builder: (context, state) {
                    if (state.status == AuthStatus.loading) {
                      return const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
