import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vodka_app/config/router/app_router.dart';
import 'package:vodka_app/config/router/cubit/navigation_cubit.dart';
import 'package:vodka_app/config/theme/app_theme.dart';
import 'package:vodka_app/infrastructure/datasources/authdb_datasource.dart';
import 'package:vodka_app/infrastructure/repositories/auth_repository_impl.dart';
import 'package:vodka_app/infrastructure/services/key_value_storage_service.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /////////////////////////////////////////////////
  /// Pending adding services such as Firebase
  /// and Notification system
  /////////////////////////////////////////////////

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await KeyValueStorageService.init();

  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create:
              (context) => AuthCubit(AuthRepositoryImpl(AuthdbDatasource())),
        ),
        BlocProvider<RouterSimpleCubit>(
          create: (context) => RouterSimpleCubit(initialRoute: '/'),
        ),
        BlocProvider<NavigationCubit>(
          create:
              (context) =>
                  NavigationCubit(router: context.read<RouterSimpleCubit>()),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter appRouter = context.watch<RouterSimpleCubit>().state;

    // Estado inicial: mostrar splash durante X segundos
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Vodka',
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 0).theme(),
      builder: (context, child) {
        return FutureBuilder(
          future: Future.delayed(Duration(seconds: 6)), // Duración del splash
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return child!;
            } else {
              return SplashScreen();
            }
          },
        );
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.customDarkRed,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Image.asset('assets/splash/vdk.gif'),
        ),
      ),
    );
  }
}
