import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';
import 'package:vodka_app/config/theme/app_theme.dart';

class MatchCard extends StatelessWidget {
  final String cardTitle;
  final bool collapse;
  final int itemCount;

  const MatchCard({
    super.key,
    required this.cardTitle,
    required this.collapse,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.stroke1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(cardTitle, style: AppFonts.headlineSemibold16),
                    collapse
                        ? IconButton(
                          onPressed: () {},
                          icon: HeroIcon(
                            HeroIcons.chevronDown,
                            size: 20,
                            color: AppColors.icon1,
                          ),
                        )
                        : SizedBox(height: 50),
                  ],
                ),
              ),
              Divider(color: AppColors.stroke1),
            ],
          ),
          ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: itemCount,
            itemBuilder: (context, index) {
              final color =
                  index % 2 == 0 ? Colors.white : AppColors.bgScreenColor;
              final isLast = index == itemCount - 1;
              return MatchSection(bgColor: color, isLast: isLast);
            },
          ),
        ],
      ),
    );
  }
}

class MatchSection extends StatelessWidget {
  final Color bgColor;
  final bool isLast;

  const MatchSection({super.key, required this.bgColor, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius:
            isLast
                ? BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                )
                : null,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text('Local', style: AppFonts.bodytextMedium16),
                SizedBox(height: 10),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: CircleAvatar(backgroundColor: AppColors.customDarkRed),
                ),
                SizedBox(height: 10),
                Text('Test', style: AppFonts.bodytextMedium16),
              ],
            ),
            SizedBox(width: 25),
            Text('0 - 0', style: AppFonts.headlineSemibold18),
            SizedBox(width: 25),
            Column(
              children: [
                Text('Visitante', style: AppFonts.bodytextMedium16),
                SizedBox(height: 10),
                SizedBox(
                  height: 80,
                  width: 80,
                  child: CircleAvatar(backgroundColor: AppColors.customDarkRed),
                ),
                SizedBox(height: 10),
                Text('Test', style: AppFonts.bodytextMedium16),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
