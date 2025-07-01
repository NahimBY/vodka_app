import 'package:flutter/material.dart';

Future<bool?> showAccountDialog(BuildContext context) async {
  return showDialog<bool>(
    useSafeArea: true,
    barrierDismissible: false,
    context: context,
    builder: (BuildContext dialogContext) => AlertDialog(
      actionsPadding: const EdgeInsets.all(15),
      backgroundColor: Colors.white,
      actionsAlignment: MainAxisAlignment.center,
      title: const Text(
        'Autenticación Requerida',
        textAlign: TextAlign.center,
      ),
      content: const Text(
        'Para disfrutar de todas las funcionalidades personalizadas de Swingtails, necesitas iniciar sesión o crear una cuenta.\n\n¿Te gustaría iniciar sesión ahora?',
      ),
      actions: [
        FilledButton(
          onPressed: () => Navigator.of(dialogContext).pop(true),
          child: const Text(
            'Iniciar sesión',
          ),
        ),
        OutlinedButton(
          onPressed: () => Navigator.of(dialogContext).pop(false),
          child: const Text(
            'Más tarde',
          ),
        ),
      ],
    ),
  );
}

