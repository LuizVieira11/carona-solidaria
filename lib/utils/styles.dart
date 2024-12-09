import '../utils/colors.dart';
import 'package:flutter/material.dart';

ButtonStyle buttonStyle() {
  return ElevatedButton.styleFrom(
    backgroundColor: green,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  );
}

InputDecoration textFieldDecoration({
  required String label,
  bool isPassword = false,
  bool isPasswordVisible = false,
  VoidCallback? togglePasswordVisibility,
}) {
  return InputDecoration(
    labelText: label,
    floatingLabelStyle: const TextStyle(color: Colors.black),
    filled: true,
    suffixIcon: isPassword
        ? IconButton(
            icon: Icon(isPasswordVisible
                ? Icons.visibility_off_outlined
                : Icons.remove_red_eye_outlined),
            onPressed: togglePasswordVisibility,
          )
        : null,
    fillColor: Colors.grey[275],
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: green, width: 2.0),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white, width: 2.0),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.red, width: 2.0),
    ),
  );
}
