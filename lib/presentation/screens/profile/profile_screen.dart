import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:vodka_app/config/router/app_router.dart';
import 'package:vodka_app/config/theme/app_theme.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/auth_state.dart';
import 'package:vodka_app/widgets/shared/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state.status == AuthStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status != AuthStatus.authenticated || state.name == null) {
            return const Center(
              child: Text('No se encontraron datos del usuario'),
            );
          }

          final name = state.name!;
          final email = state.email ?? 'Correo no disponible';
          final initial = name.isNotEmpty ? name[0].toUpperCase() : 'U';

          return Column(
            children: [
              CustomAppBar(
                transparentBg: true,
                logo: false,
                icon: false,
                appbarTitle: 'Hola, $name',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 30,
                ),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.stroke1, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              child: Text(
                                initial,
                                style: const TextStyle(fontSize: 25),
                              ),
                            ),
                            const SizedBox(width: 30),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(name, style: AppFonts.bodytextMedium18),
                                Text(
                                  email,
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: AppColors.customGray,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.stroke1, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          ListTile(
                            leading: const HeroIcon(
                              HeroIcons.pencilSquare,
                              size: 20,
                            ),
                            title: Text(
                              'Editar perfil',
                              style: AppFonts.bodytextRegular15,
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const HeroIcon(
                              HeroIcons.cog6Tooth,
                              size: 20,
                            ),
                            title: Text(
                              'Ajustes',
                              style: AppFonts.bodytextRegular15,
                            ),
                            onTap: () {},
                          ),
                          ListTile(
                            leading: const HeroIcon(
                              HeroIcons.questionMarkCircle,
                              size: 20,
                            ),
                            title: Text(
                              'Ayuda',
                              style: AppFonts.bodytextRegular15,
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: AppColors.stroke1, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        leading: const HeroIcon(
                          HeroIcons.arrowLeftEndOnRectangle,
                          size: 20,
                        ),
                        title: Text(
                          'Cerrar sesión',
                          style: AppFonts.bodytextRegular15,
                        ),
                        onTap: () {
                          context.read<AuthCubit>().logout();
                          if (context.mounted) {
                            context.read<RouterSimpleCubit>().goRoute('login');
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
