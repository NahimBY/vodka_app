import 'package:flutter/material.dart';
import 'package:vodka_app/config/theme/app_theme.dart';

class CustomGlobalButton extends StatelessWidget {
  final double? width;
  final double? height;
  final String text;
  final Color? backgroundColor;
  final Color splashColor;
  final VoidCallback? onTap;
  final double? borderRadius;
  final TextStyle? textStyle;
  final bool isLoading;

  const CustomGlobalButton({
    super.key,
    this.width,
    this.height,
    required this.text,
    this.backgroundColor,
    this.splashColor = Colors.white30,
    required this.onTap,
    this.borderRadius,
    this.textStyle,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(borderRadius ?? 10)),
      child: Material(
        color: backgroundColor ?? AppColors.customDarkRed,
        child: InkWell(
          splashColor: splashColor,
          onTap: isLoading ? null : onTap,
          child: SizedBox(
            width: width ?? sizeScreen.width,
            height: height ?? 50,
            child: Center(
              child:
                  isLoading
                      ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white, // Color del indicador
                          ),
                        ),
                      )
                      : Text(
                        text,
                        style:
                            textStyle ??
                            const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
