import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vodka_app/config/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 90),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView.builder(
          itemCount: 400,
          itemBuilder:
              (context, index) =>
                  Text('Hola', style: AppFonts.bodytextRegular24),
        ),
      ),
    );
  }
}
