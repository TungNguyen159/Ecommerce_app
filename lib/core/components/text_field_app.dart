import 'package:flutter/material.dart';

class TextFieldApp extends StatelessWidget {
  const TextFieldApp({
    super.key,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
    this.validator,
    this.controller,
    this.onChanged,
    this.textInputAction,
  });
  final String? hintText;
  final bool obscureText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  @override

  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefixIcon,
        prefixIconColor: Theme.of(context).colorScheme.tertiary,
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8),
        //   borderSide: BorderSide(
        //     color: Theme.of(context).colorScheme.primary,
        //     width: 2.0,
        //   ),
        // ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 2.0,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        errorStyle: TextStyle(
          color: Colors.red, // Màu chữ error
          backgroundColor:
              Colors.red.withOpacity(0.1), // Màu nền error
          fontWeight: FontWeight.bold,
        ),
      ),
      style: const TextStyle(color: Colors.black),
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      textInputAction: textInputAction,
    );
  }
}