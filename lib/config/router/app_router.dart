import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:vodka_app/presentation/screens/navigation_wrapper.dart';
import 'package:vodka_app/presentation/screens/screens.dart';

GoRouter createRouter(String initialLocation) => GoRouter(
  initialLocation: initialLocation,
  // redirect: (context, state) {
  //   final String path = state.uri.path;
  //   final Map<String, String> params = state.uri.queryParameters;

  // },
  routes: [
    GoRoute(
      name: NavigationWrapper.name,
      path: '/',
      builder: (context, state) => const NavigationWrapper(),
      routes: [
        GoRoute(
          name: LoginScreen.name,
          path: 'login',
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: NewScreen.name,
          path: 'nuevo',
          builder: (context, state) => const NewScreen(),
        ),
        GoRoute(
          name: HomeScreen.name,
          path: 'inicio',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: ProfileScreen.name,
          path: 'perfil',
          builder: (context, state) => const ProfileScreen(),
        ),
      ],
    ),
  ],
);

class RouterSimpleCubit extends Cubit<GoRouter> {
  RouterSimpleCubit({String? initialRoute})
    : super(createRouter(initialRoute ?? '/inicio'));

  void goBack() {
    state.pop();
  }

  void goWrapper() {
    state.go('/');
  }

  void pushRoute(String value, {Object? extra}) {
    state.push('/$value', extra: extra);
  }

  void goRoute(String value, {Object? extra}) {
    state.go('/$value', extra: extra);
  }
}
