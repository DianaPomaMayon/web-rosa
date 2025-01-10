import 'package:flutter/material.dart';
import 'package:rosa_bella/src/login.dart';
import 'package:rosa_bella/src/registro.dart';
import 'package:rosa_bella/src/welcome.dart';
import 'package:rosa_bella/src/perfil.dart';
import 'package:rosa_bella/src/home.dart';
import 'package:rosa_bella/src/cortes.dart';
import 'package:rosa_bella/src/uñas.dart';
import 'package:rosa_bella/src/peinados.dart';
import 'package:rosa_bella/src/tintes.dart';
import 'package:rosa_bella/src/informacion.dart';
import 'package:rosa_bella/src/carrito.dart';
import 'package:rosa_bella/src/reservas.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'letrita',
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      title: 'App Rosa Bella',
      initialRoute: 'login',
      routes: <String, WidgetBuilder>{
        'login': (BuildContext context) => Login(),
        'registro': (BuildContext context) => Registro(),
        'welcome': (BuildContext context) => Welcome(),
        'home': (BuildContext context) => Home(),
        'cortes': (BuildContext context) => Cortes(),
        'unas': (BuildContext context) => Unas(),
        'peinados': (BuildContext context) => Peinados(),
        'tintes': (BuildContext context) => Tintes(),
        'perfil': (BuildContext context) => Perfil(),
        'informacion': (BuildContext context) => Informacion(),
        'carrito': (BuildContext context) => Carrito(),
        'reservas': (BuildContext context) => Reservas(),
      },
    );
  }
}
