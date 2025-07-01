import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vodka_app/config/router/app_router.dart';
import 'package:vodka_app/config/router/cubit/navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  final RouterSimpleCubit router;

  NavigationCubit({required this.router}) : super(NavigationState());

  void navigateToHome() {
    setTab(NavigationTab.inicio);
    router.goWrapper();
  }

  void navigateToNew() {
    setTab(NavigationTab.nuevo);
    router.goWrapper();
  }

  void navigateToProfile() {
    setTab(NavigationTab.perfil);
    router.goWrapper();
  }

  void setTab(NavigationTab tab) {
    emit(state.copyWith(currentTab: tab));
  }
}
