import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vodka_app/config/router/app_router.dart';
import 'package:vodka_app/config/router/cubit/navigation_cubit.dart';
import 'package:vodka_app/config/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /////////////////////////////////////////////////
  /// Pending adding services such as Firebase
  /// and Notification system
  /////////////////////////////////////////////////

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
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
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter appRouter = context.watch<RouterSimpleCubit>().state;
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Vodka',
      routerConfig: appRouter,
      theme: AppTheme(selectedColor: 0).theme(),
    );
  }
}
