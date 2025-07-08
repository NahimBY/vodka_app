import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heroicons/heroicons.dart';
import 'package:vodka_app/widgets/shared/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  static const String name = 'profile_screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(
            logo: false,
            icon: false,
            appbarTitle: 'Perfil',
          ),
        ],
      ),
    );
  }
}
