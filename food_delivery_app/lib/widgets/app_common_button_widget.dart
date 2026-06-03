import 'package:flutter/material.dart';

Widget commonElivatedButton(
  String text,
  VoidCallback onTap, {
  Icon icon = const Icon(Icons.location_on_rounded),
  bool showIcon = false,
}) {
  return SizedBox(
    height: 64,
    width: .infinity,
    child: ElevatedButton(
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: .center,
        children: [Text(text.toUpperCase()), SizedBox(width: 10,),showIcon ? icon : SizedBox()],
      ),
    ),
  );
}
