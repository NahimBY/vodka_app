import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:heroicons/heroicons.dart';
import 'package:vodka_app/config/router/app_router.dart';
import 'package:vodka_app/config/router/cubit/navigation_cubit.dart';
import 'package:vodka_app/config/router/cubit/navigation_state.dart';
import 'package:vodka_app/config/theme/app_theme.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/auth_state.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/login_form/form_cubit.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/login_form/form_state.dart';
import 'package:vodka_app/widgets/shared/custom_global_button.dart';
import 'package:vodka_app/widgets/shared/custom_input_field.dart';
import 'package:vodka_app/widgets/shared/custom_snackbar.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NavigationCubit>().setTab(NavigationTab.values[0]);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == AuthStatus.error && state.errorMessage != null) {
            CustomSnackbar.show(
              context,
              message: state.errorMessage!,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              icon: HeroIcons.exclamationCircle,
              iconStyle: HeroIconStyle.solid,
            );
          }
          if (state.status == AuthStatus.authenticated) {
            context.read<RouterSimpleCubit>().goWrapper();
            CustomSnackbar.show(
              context,
              message: 'Inicio de sesión exitoso',
              backgroundColor: Colors.green,
              textColor: Colors.white,
              icon: HeroIcons.checkCircle,
              iconStyle: HeroIconStyle.solid,
              hasBottomBar: true,
            );
          }
        },
        child: BlocProvider(
          create: (context) => LoginFormCubit(),
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, authState) {
              final loginFormCubit = context.read<LoginFormCubit>();
              if (authState.status == AuthStatus.loading) {
                loginFormCubit.setLoading(true);
              } else {
                loginFormCubit.setLoading(false);
              }
            },
            child: BlocBuilder<LoginFormCubit, LoginFormState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        Image.asset(
                          'assets/logos/LogoVA.png',
                          color: Colors.black,
                        ),
                        SizedBox(height: 30),
                        Text(
                          'Ingresa a tu cuenta de Vodka',
                          style: AppFonts.bodytextRegular18,
                        ),
                        SizedBox(height: 30),
                        CustomInputField(
                          width: double.infinity,
                          onChanged:
                              (value) => context
                                  .read<LoginFormCubit>()
                                  .setEmail(value),
                          textInputAction: TextInputAction.next,
                          hintText: 'Correo electrónico',
                          prefixIcon: HeroIcon(
                            HeroIcons.envelope,
                            style: HeroIconStyle.solid,
                          ),
                          keyboardType: TextInputType.emailAddress,
                          enabledForm: !state.isLoading,
                        ),
                        SizedBox(height: 15),
                        CustomInputField(
                          width: double.infinity,
                          textInputAction: TextInputAction.done,
                          onChanged:
                              (value) => context
                                  .read<LoginFormCubit>()
                                  .setPassword(value),
                          hintText: 'Contraseña',
                          obscureText: state.obscureText,
                          prefixIcon: HeroIcon(
                            HeroIcons.lockClosed,
                            style: HeroIconStyle.solid,
                          ),
                          suffixIcon: IconButton(
                            onPressed:
                                () =>
                                    context
                                        .read<LoginFormCubit>()
                                        .togglePasswordVisibility(),
                            icon: HeroIcon(
                              state.obscureText
                                  ? HeroIcons.eye
                                  : HeroIcons.eyeSlash,
                              style: HeroIconStyle.solid,
                            ),
                          ),
                          enabledForm: !state.isLoading,
                        ),
                        SizedBox(height: 30),
                        CustomGlobalButton(
                          text: 'Iniciar sesión',
                          onTap:
                              state.isLoading
                                  ? null
                                  : () => context
                                      .read<LoginFormCubit>()
                                      .handleLogin(context),
                          isLoading: state.isLoading,
                        ),
                        Spacer(),
                        RichText(
                          textAlign:
                              TextAlign
                                  .center, // Opcional: para centrar el texto
                          text: TextSpan(
                            style: GoogleFonts.montserrat(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(text: 'Al continuar, aceptas los '),
                              TextSpan(
                                text:
                                    'Términos & Condiciones y Política de Privacidad',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer:
                                    TapGestureRecognizer()..onTap = () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
