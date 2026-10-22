
  import 'package:flutter/material.dart';
import 'package:lilac_machine_test/widgets/colors.dart';

InputDecoration fieldDecoration({
    String? prefixText,
    Widget? suffixIcon,
  }) {
    return InputDecoration(
      prefixText: prefixText,
      prefixStyle: TextStyle(
        color: maincolor,
        fontWeight: FontWeight.w600,
      ),
      suffixIcon: suffixIcon,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(color: borderColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(color: borderColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: BorderSide(color: maincolor, width: 1.3),
      ),
    );
  }