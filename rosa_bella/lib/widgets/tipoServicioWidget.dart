import 'package:flutter/material.dart';

Widget tipoServicioWidget(String nombreTipoServicio, String precio, String tiempo, String imagen) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: 10,
    ),
    child: Container(
      height: 210,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFE9E9E9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            imagen,
            height: 210,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    nombreTipoServicio,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    precio,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    tiempo,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF990202),
                    ),
                    child: Text(
                      'Agregar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
