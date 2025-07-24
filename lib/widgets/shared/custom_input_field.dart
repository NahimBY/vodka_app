import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class CustomInputField extends StatelessWidget {
  const CustomInputField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.width,
    this.suffixIcon,
    this.controller,
    this.obscureText = false,
    this.keyboardType,
    this.onChanged,
    this.focusNode,
    this.textInputAction,
    this.enabledForm = true,
  });

  final String hintText;
  final HeroIcon? prefixIcon;
  final IconButton? suffixIcon;
  final double? width;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType? keyboardType;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool enabledForm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: TextFormField(
        autofocus: false,
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        enabled: enabledForm,
        textInputAction: textInputAction,
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        onChanged: onChanged,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefixIconColor: enabledForm ? Colors.black26 : Colors.grey,
          suffixIcon: suffixIcon,
          suffixIconColor: enabledForm ? Colors.black26 : Colors.grey,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black38, width: 1.5),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade300, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: enabledForm ? Colors.black38 : Colors.grey,
          ),
          filled: true,
          fillColor: enabledForm ? Colors.white : Colors.grey.shade100,
        ),
      ),
    );
  }
}
