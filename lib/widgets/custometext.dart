  import 'package:flutter/material.dart';
import 'package:lilac_machine_test/widgets/colors.dart';

Widget fieldLabel(String text,) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          letterSpacing: 1,
          color: labelColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }