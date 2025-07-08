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
      // appBar: AppBar(
      //   toolbarHeight: 80,
      //   title:
      //       const SizedBox.shrink(), // Lo reemplazamos por el contenido en flexibleSpace
      //   flexibleSpace: Align(
      //     alignment: Alignment.bottomCenter,
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      //       child: Row(
      //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //         crossAxisAlignment: CrossAxisAlignment.end,
      //         children: [
      //           // Tu título (logo)
      //           Padding(
      //             padding: const EdgeInsets.only(bottom: 10),
      //             child: SizedBox(
      //               width: 110,
      //               child: Image.asset(
      //                 'assets/logos/LogoVA.png',
      //                 color: Colors.black,
      //               ),
      //             ),
      //           ),

      //           // Tus actions alineados también en bottom
      //           Row(
      //             crossAxisAlignment: CrossAxisAlignment.end,
      //             children: [
      //               IconButton(
      //                 onPressed: () {},
      //                 icon: HeroIcon(
      //                   HeroIcons.calendar,
      //                   style: HeroIconStyle.outline,
      //                   color: Colors.black,
      //                 ),
      //                 constraints: BoxConstraints(),
      //               ),
      //               SizedBox(width: 10),
      //               IconButton(
      //                 onPressed: () {},
      //                 icon: HeroIcon(
      //                   HeroIcons.magnifyingGlass,
      //                   style: HeroIconStyle.outline,
      //                   color: Colors.black,
      //                 ),
      //                 constraints: BoxConstraints(),
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 20,
                      bottom: 5,
                    ),
                    child: Column(
                      children: [
                        MatchCard(
                          cardTitle: 'Administrando',
                          collapse: false,
                          itemCount: 1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
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
                      left: 15,
                      right: 15,
                      top: 5,
                      bottom: 115,
                    ),
                    child: Column(
                      children: [
                        MatchCard(
                          cardTitle: 'Próximos partidos',
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
