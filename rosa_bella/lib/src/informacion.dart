//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Informacion extends StatefulWidget {
  Informacion({Key? key}) : super(key: key);

  @override
  _InformacionState createState() => _InformacionState();
}

class _InformacionState extends State<Informacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300], // Color(0xFF990202),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushNamed(context, 'home');
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/logo_transparente.png',
              height: 150,
            ),
            Text(
              'SISTEMA DE ROSAS',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color:Color(0xFF990202),
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  RoseInfoCard(),
                  SizedBox(height: 25),
                  RoseInfoCard(),
                  SizedBox(height: 25),
                  RoseInfoCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoseInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          'Con nuestro sistema de rosas, ganas una rosa por cada compra de al menos 10 soles. Estas rosas valen un sol cada una y puedes usarlas para obtener servicios gratuitos. En la aplicación, verás tu saldo de rosas y cómo canjearlas. ¡Disfruta de tus recompensas!',
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
