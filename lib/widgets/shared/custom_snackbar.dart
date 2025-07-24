import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class AnimatedCustomSnackbar extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final HeroIconStyle? iconStyle;
  final HeroIcons? icon;
  final Duration duration;
  final VoidCallback? onDismissed;

  const AnimatedCustomSnackbar({
    super.key,
    required this.message,
    this.backgroundColor = Colors.black87,
    this.textColor = Colors.white,
    this.iconStyle,
    this.icon,
    this.duration = const Duration(seconds: 2),
    this.onDismissed,
  });

  @override
  State<AnimatedCustomSnackbar> createState() => _AnimatedCustomSnackbarState();
}

class _AnimatedCustomSnackbarState extends State<AnimatedCustomSnackbar> 
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _controller.forward();

    Future.delayed(widget.duration, () {
      if (mounted) {
        _hideSnackbar();
      }
    });
  }

  void _hideSnackbar() async {
    await _controller.reverse();
    widget.onDismissed?.call();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    if (widget.icon != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: HeroIcon(
                          widget.icon!,
                          color: widget.textColor,
                          style: widget.iconStyle,
                        ),
                      ),
                    Expanded(
                      child: Text(
                        widget.message,
                        style: TextStyle(
                          color: widget.textColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomSnackbar {
  static OverlayEntry? _currentOverlay;

  static void show(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
    HeroIconStyle? iconStyle,
    HeroIcons? icon,
    Duration duration = const Duration(seconds: 2),
    bool hasBottomBar = false,
    double? bottomOffset,
  }) {
    _currentOverlay?.remove();

    final overlayState = Overlay.of(context);
    
    _currentOverlay = OverlayEntry(
      builder: (context) {
        // Obtener el padding del sistema
        final bottomPadding = MediaQuery.of(context).padding.bottom;
        final viewInsets = MediaQuery.of(context).viewInsets.bottom;
        
        // Calcular el padding total basado en los parámetros
        double totalBottomPadding;
        
        if (bottomOffset != null) {
          // Si se proporciona bottomOffset, usar ese valor directamente
          totalBottomPadding = bottomOffset;
        } else {
          // Si no se proporciona, usar la lógica anterior
          final bottomNavHeight = hasBottomBar ? kBottomNavigationBarHeight + 40 : 0.0;
          totalBottomPadding = bottomPadding + bottomNavHeight + viewInsets;
        }

        return Positioned(
          bottom: totalBottomPadding,
          left: 0,
          right: 0,
          child: AnimatedCustomSnackbar(
            message: message,
            backgroundColor: backgroundColor,
            textColor: textColor,
            iconStyle: iconStyle,
            icon: icon,
            duration: duration,
            onDismissed: () {
              _currentOverlay?.remove();
              _currentOverlay = null;
            },
          ),
        );
      },
    );

    overlayState.insert(_currentOverlay!);
  }

  static void dismiss() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }
}
