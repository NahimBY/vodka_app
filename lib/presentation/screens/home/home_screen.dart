import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:heroicons/heroicons.dart';
import 'package:vodka_app/config/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  static const String name = 'home_screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title:
            const SizedBox.shrink(), // Lo reemplazamos por el contenido en flexibleSpace
        flexibleSpace: Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Tu título (logo)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SizedBox(
                    width: 110,
                    child: Image.asset(
                      'assets/logos/LogoVA.png',
                      color: Colors.black,
                    ),
                  ),
                ),

                // Tus actions alineados también en bottom
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: HeroIcon(
                        HeroIcons.calendar,
                        style: HeroIconStyle.outline,
                        color: Colors.black,
                      ),
                      constraints: BoxConstraints(),
                    ),
                    SizedBox(width: 10),
                    IconButton(
                      onPressed: () {},
                      icon: HeroIcon(
                        HeroIcons.magnifyingGlass,
                        style: HeroIconStyle.outline,
                        color: Colors.black,
                      ),
                      constraints: BoxConstraints(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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
