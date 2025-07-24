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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                      bottom: 5,
                    ),
                    child: Column(
                      children: [
                        MatchCard(
                          cardTitle: true,
                          title: 'Administrando',
                          collapse: false,
                          itemCount: 1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        SizedBox(height: 5),
                        Divider(color: AppColors.stroke2),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 5,
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
          ),
          CustomAppBar(
            transparentBg: false,
            logo: true,
            icon: true,
            customIcon1: HeroIcon(HeroIcons.calendar),
            customIcon2: HeroIcon(HeroIcons.magnifyingGlass),
          ),
        ],
      ),
    );
  }
}
