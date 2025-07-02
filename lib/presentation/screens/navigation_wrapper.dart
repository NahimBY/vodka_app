import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:vodka_app/config/router/app_router.dart';
import 'package:vodka_app/config/router/cubit/navigation_cubit.dart';
import 'package:vodka_app/config/router/cubit/navigation_state.dart';
import 'package:vodka_app/config/theme/app_theme.dart';
// import 'package:vodka_app/infrastructure/services/refresh_token_service.dart';
// import 'package:vodka_app/infrastructure/services/token_service.dart';
import 'package:vodka_app/presentation/screens/screens.dart';
import 'package:vodka_app/widgets/shared/customNavigationBar.dart';
import 'package:vodka_app/widgets/shared/show_about_dialog.dart';

class NavigationWrapper extends StatelessWidget {
  static const name = 'navigation_wrapper';

  const NavigationWrapper({super.key});

  // Future<bool> checkAuthAndRefresh(BuildContext context) async {
  //   final authService = RefreshTokenService.instance;
  //   final accessToken = authService.accessToken;

  //   if (accessToken == null) return false;

  //   if (TokenService.isTokenExpired(accessToken)) {
  //     final refreshToken = authService.refreshToken;
  //     if (refreshToken == null) return false;

  //     try {
  //       final newToken = await authService.refreshAccessToken();
  //       return newToken != null;
  //     } catch (e) {
  //       return false;
  //     }
  //   }

  //   return true;
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              IndexedStack(
                index: state.currentTab.index,
                children: const [HomeScreen(), NewScreen(), ProfileScreen()],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: CustomNavigationBar(
                  state: state,
                  onDestinationSelected: (index) async {
                    FocusScope.of(context).unfocus();
                    // if (NavigationTab.values[index] == NavigationTab.perfil ||
                    //     NavigationTab.values[index] == NavigationTab.history) {
                    //   final isAuthenticated = await checkAuthAndRefresh(context);

                    //   if (!isAuthenticated) {
                    //     if (context.mounted) {
                    //       final shouldProceed = await showAccountDialog(context);
                    //       if (shouldProceed == true && context.mounted) {
                    //         context.read<RouterSimpleCubit>().goRoute('login');
                    //       }
                    //     }
                    //     return;
                    //   }
                    // }
                    context.read<NavigationCubit>().setTab(
                      NavigationTab.values[index],
                    );
                  },
                  // decoration: const BoxDecoration(
                  //   border: Border(
                  //     top: BorderSide(color: Colors.black12),
                  //   ),
                  // ),
                  // child: NavigationBar(
                  //   height: 65,
                  //   selectedIndex: state.currentTab.index,
                  //   backgroundColor: const Color.fromARGB(255, 239, 227, 221),
                  //   indicatorColor: const Color.fromARGB(88, 194, 149, 140),
                  //   labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
                  //   surfaceTintColor: Colors.transparent,
                  //   overlayColor: WidgetStateColor.transparent,
                  //   labelTextStyle: WidgetStateProperty.resolveWith<TextStyle>(
                  //     (Set<WidgetState> states) {
                  //       if (states.contains(WidgetState.selected)) {
                  //         return const TextStyle(
                  //           color: AppColors.customBlack,
                  //           fontWeight: FontWeight.bold,
                  //         );
                  //       }
                  //       return const TextStyle(color: AppColors.customBlack);
                  //     },
                  //   ),
                  // destinations: [
                  //   NavigationDestination(
                  //     icon: HeroIcon(
                  //       HeroIcons.home,
                  //       style: state.currentTab == NavigationTab.inicio
                  //           ? HeroIconStyle.solid
                  //           : HeroIconStyle.outline,
                  //       color: state.currentTab == NavigationTab.inicio
                  //           ? const Color.fromARGB(255, 95, 57, 49)
                  //           : Colors.black54,
                  //       size: 30,
                  //     ),
                  //     label: '',
                  //   ),
                  //   NavigationDestination(
                  //     icon: HeroIcon(
                  //       HeroIcons.plusCircle,
                  //       style: state.currentTab == NavigationTab.nuevo
                  //           ? HeroIconStyle.solid
                  //           : HeroIconStyle.outline,
                  //       color: state.currentTab == NavigationTab.nuevo
                  //           ? const Color.fromARGB(255, 95, 57, 49)
                  //           : Colors.black54,
                  //       size: 30,
                  //     ),
                  //     label: '',
                  //   ),
                  //   NavigationDestination(
                  //     icon: HeroIcon(
                  //       HeroIcons.user,
                  //       style: state.currentTab == NavigationTab.perfil
                  //           ? HeroIconStyle.solid
                  //           : HeroIconStyle.outline,
                  //       color: state.currentTab == NavigationTab.perfil
                  //           ? const Color.fromARGB(255, 95, 57, 49)
                  //           : Colors.black54,
                  //       size: 30,
                  //     ),
                  //     label: '',
                  //   ),
                  // ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
