import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:heroicons/heroicons.dart';
import 'package:vodka_app/config/router/cubit/navigation_cubit.dart';
import 'package:vodka_app/config/router/cubit/navigation_state.dart';
import 'package:vodka_app/config/theme/app_theme.dart';

class CustomNavigationBar extends StatelessWidget {
  final NavigationState state;
  final Function(int) onDestinationSelected;

  const CustomNavigationBar({
    super.key,
    required this.state,
    required this.onDestinationSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.stroke1),
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(40)),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(50, 0, 0, 0),
              blurRadius: 5,
            ),
          ],
        ),
        margin: const EdgeInsets.all(16),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(
              index: 0,
              icon: HeroIcons.home,
              label: 'Inicio',
              isSelected: state.currentTab == NavigationTab.inicio,
            ),
            _buildNavItem(
              index: 1,
              icon: HeroIcons.plusCircle,
              label: 'Nuevo',
              isSelected: state.currentTab == NavigationTab.nuevo,
            ),
            _buildNavItem(
              index: 2,
              icon: HeroIcons.user,
              label: 'Perfil',
              isSelected: state.currentTab == NavigationTab.perfil,
              isProfileIcon:
                  state.currentTab == NavigationTab.perfil ? true : false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required HeroIcons icon,
    required String label,
    required bool isSelected,
    bool isProfileIcon = false,
  }) {
    return GestureDetector(
      onTap: () => onDestinationSelected(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.customRed : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isProfileIcon && !isSelected)
              // Ícono de perfil circular cuando no está seleccionado
              Container(
                width: 24,
                height: 24,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.person, size: 16, color: Colors.black),
              )
            else
              // Íconos normales
              HeroIcon(
                icon,
                style: isSelected ? HeroIconStyle.solid : HeroIconStyle.outline,
                color: isSelected ? Colors.white : Colors.black,
                size: 26,
              ),
            if (isSelected && label.isNotEmpty) ...[
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
