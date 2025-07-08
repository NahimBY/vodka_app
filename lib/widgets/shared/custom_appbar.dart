import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:vodka_app/config/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget {
  final bool logo;
  final bool icon;
  final String? appbarTitle;
  final HeroIcon? customIcon1;
  final HeroIcon? customIcon2;

  const CustomAppBar({
    super.key,
    this.appbarTitle,
    required this.logo,
    required this.icon,
    this.customIcon1,
    this.customIcon2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 5),
            blurRadius: 6,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            logo
                ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 18,
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: SizedBox(
                      width: 110,
                      child: Image.asset(
                        'assets/logos/LogoVA.png',
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
                : Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      appbarTitle ?? '',
                      style: AppFonts.headlineSemibold20,
                    ),
                  ),
                ),
            icon
                ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 7,
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      children: [
                        if (customIcon1 != null)
                          IconButton(onPressed: () {}, icon: customIcon1!),
                        SizedBox(width: 10),
                        if (customIcon2 != null)
                          IconButton(onPressed: () {}, icon: customIcon2!),
                      ],
                    ),
                  ),
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
