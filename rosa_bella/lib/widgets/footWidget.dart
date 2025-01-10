import 'package:flutter/material.dart';

Widget footWidget(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 30.0,
      vertical: 10.0,
    ),
    child: Container(
      height: 60,
      padding: EdgeInsets.symmetric(
        horizontal: 35.0,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF990202),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'perfil');
            },
            child:
            Image.asset(
              'images/perfil.png',
              height: 25,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'informacion');
            },
            child:
            Image.asset(
              'images/rosa.png',
              height: 25,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'home');
              },
            child:
            Image.asset(
              'images/home.png',
              height: 25,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'reservas');
            },
            child:
            Image.asset(
              'images/reserva.png',
              height: 25,
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'carrito');
            },
            child:
            Image.asset(
              'images/carrito.png',
              height: 25,
            ),
          ),
        ],
      ),
    ),
  );
}
