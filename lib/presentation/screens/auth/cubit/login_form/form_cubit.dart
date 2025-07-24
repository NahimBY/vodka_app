import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:vodka_app/config/theme/app_theme.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/auth_cubit.dart';
import 'package:vodka_app/presentation/screens/auth/cubit/login_form/form_state.dart';
import 'package:vodka_app/widgets/shared/custom_snackbar.dart';

class LoginFormCubit extends Cubit<LoginFormState> {
  LoginFormCubit() : super(const LoginFormState());

  void setEmail(String email) {
    if (!isClosed) {
      emit(state.copyWith(email: email));
    }
  }

  void setPassword(String password) {
    if (!isClosed) {
      emit(state.copyWith(password: password));
    }
  }

  void togglePasswordVisibility() {
    if (!isClosed) {
      emit(state.copyWith(obscureText: !state.obscureText));
    }
  }

  void setLoading(bool isLoading) {
    if (!isClosed) {
      emit(state.copyWith(isLoading: isLoading));
    }
  }

  Future<void> handleLogin(BuildContext context) async {
    if (isClosed) return;

    FocusScope.of(context).unfocus();

    if (state.email.isEmpty || state.password.isEmpty) {
      CustomSnackbar.show(
        context,
        message: 'Por favor, completa todos los campos',
        backgroundColor: AppColors.customBlack,
        textColor: Colors.white,
        icon: HeroIcons.informationCircle,
        iconStyle: HeroIconStyle.solid,
      );
      return;
    }

    setLoading(true);

    try {
      await context.read<AuthCubit>().login(state.email, state.password);
    } finally {
      if (!isClosed) {
        setLoading(false);
      }
    }
  }

  @override
  Future<void> close() {
    // Realizar limpieza adicional si es necesario
    return super.close();
  }
}
