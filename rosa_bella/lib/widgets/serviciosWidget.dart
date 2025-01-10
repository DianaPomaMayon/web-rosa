import 'package:flutter/material.dart';

Widget serviciosWidget(IconData icon, String label) {
  return Container(
    width: 100,
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Color(0xFF990202),
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 5,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 40, color: Colors.white),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}