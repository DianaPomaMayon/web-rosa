import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rosa_bella/src/home.dart';

class Welcome extends StatefulWidget {
  Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  late String _nombre = '';
  late String _celular = '';

  @override
  void initState() {
    super.initState();
    _navegarAServicio();
    _obtenerDatosRegistro();
  }

  Future<void> _obtenerDatosRegistro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _nombre = prefs.getString('nombre') ?? '';
      _celular = prefs.getString('celular') ?? '';
    });
  }

  Future<void> _navegarAServicio() async {
    await Future.delayed(Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                color: Color(0xFF990202),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Text(
                'BIENVENIDO A ROSA BELLA',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
