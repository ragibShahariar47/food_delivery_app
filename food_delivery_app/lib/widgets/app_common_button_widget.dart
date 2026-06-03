import 'package:flutter/material.dart';

Widget commonElivatedButton(String text, VoidCallback onTap) {
  return SizedBox(
    height: 64,
    width: .infinity,
    child: ElevatedButton(onPressed: onTap, child: Text(text)),
  );
}
