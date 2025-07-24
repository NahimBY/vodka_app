import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heroicons/heroicons.dart';
import 'package:vodka_app/config/theme/app_theme.dart';
import 'package:vodka_app/widgets/shared/custom_appbar.dart';
import 'package:vodka_app/widgets/shared/match_card.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        homeAppbar: true,
        transparentBg: false,
        logo: true,
        icon: true,
        customIcon1: HeroIcon(HeroIcons.calendar),
        customIcon2: HeroIcon(HeroIcons.magnifyingGlass),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 30,
                bottom: 115,
              ),
              child: Column(
                children: [
                  MatchCard(
                    cardTitle: true,
                    title: 'Jornadas pendientes',
                    collapse: true,
                    itemCount: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
