import 'package:carona_solidaria/utils/colors.dart';
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

InputDecoration textFieldDecoration(
    {required String label, bool? viewPasswordText}) {
  if (viewPasswordText == null) {
    return InputDecoration(
      labelText: label,
      floatingLabelStyle: TextStyle(color: Colors.black),
      filled: true,
      fillColor: Colors.grey[275],
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: green, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white, width: 2.0),
      ),
    );
  } else {
    return InputDecoration(
      suffixIcon: (viewPasswordText)
          ? IconButton(
              icon: const Icon(Icons.remove_red_eye_outlined),
              onPressed: () {
                viewPasswordText = !viewPasswordText!;
              })
          : IconButton(
              icon: const Icon(Icons.visibility_off_outlined),
              onPressed: () {
                viewPasswordText = !viewPasswordText!;
              }),
      labelText: label,
      floatingLabelStyle: TextStyle(color: Colors.black),
      filled: true,
      fillColor: Colors.grey[275],
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: green, width: 2.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.white, width: 2.0),
      ),
    );
  }
}
