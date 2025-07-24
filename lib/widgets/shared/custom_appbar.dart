import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:vodka_app/config/theme/app_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool transparentBg;
  final bool logo;
  final bool icon;
  final String? appbarTitle;
  final HeroIcon? customIcon1;
  final HeroIcon? customIcon2;
  final bool homeAppbar;

  const CustomAppBar({
    super.key,
    required this.logo,
    required this.icon,
    required this.transparentBg,
    this.appbarTitle,
    this.customIcon1,
    this.customIcon2,
    this.homeAppbar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: transparentBg ? Colors.transparent : Colors.white,
        boxShadow: [
          BoxShadow(
            color: transparentBg ? Colors.transparent : Colors.black12,
            offset: const Offset(0, 2),
            blurRadius: 5,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            appbarTitle ?? '',
                            style: AppFonts.headlineSemibold20,
                          ),
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
                            const SizedBox(width: 10),
                            if (customIcon2 != null)
                              IconButton(onPressed: () {}, icon: customIcon2!),
                          ],
                        ),
                      ),
                    )
                    : const SizedBox(),
              ],
            ),
            if (homeAppbar)
              DefaultTabController(
                length: 2,
                child: TabBar(
                  tabs: const [
                    Tab(text: 'Tournament 1'),
                    Tab(text: 'Tournament 2'),
                  ],
                  labelStyle: AppFonts.bodytextRegular15,
                  indicatorColor: AppColors.customDarkRed,
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize {
    double baseHeight = logo ? 65.0 : 48.0;
    double tabBarHeight = homeAppbar ? 48.0 : 0.0;
    double padding = 10.0;
    return Size.fromHeight(baseHeight + tabBarHeight + padding);
  }
}
