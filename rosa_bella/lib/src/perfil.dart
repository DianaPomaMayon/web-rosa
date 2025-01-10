import 'package:flutter/material.dart';
import 'package:rosa_bella/model/perfil_model.dart';
import 'package:rosa_bella/peticiones/perfil_peticiones.dart';
import 'package:rosa_bella/widgets/footWidget.dart';

class Perfil extends StatefulWidget {
  Perfil({Key? key}) : super(key: key);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  late List<PerfilModel> _perfilData = [];

  @override
  void initState() {
    super.initState();
    _obtenerDatosPerfil();
  }

  Future<void> _obtenerDatosPerfil() async {
    try {
      List<PerfilModel> perfil = await listarPerfil();
      setState(() {
        _perfilData = perfil; // Guarda la data recibida
      });
    } catch (e) {
      print('Error al obtener datos del perfil: $e');
    }
  }

  void _cerrarSesion() {
    Navigator.pushReplacementNamed(context, 'login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE6E6E6),
      body: Stack(
        children: [
          Positioned(
            top: 60.0,
            left: 20.0,
            child: CircleAvatar(
              radius: 40.0,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage('images/logo.png'),
            ),
          ),
          Positioned(
            top: 80.0,
            right: 10.0,
            child: ElevatedButton(
              onPressed: () {
                _cerrarSesion();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF990202),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Text(
                  'Cerrar Sesión',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: _perfilData.isEmpty
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 40.0),
                      CircleAvatar(
                        radius: 160.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('images/logo.png'),
                      ),
                      SizedBox(height: 100.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 40.0,
                                color: Color(0xFF990202),
                                child: Center(
                                  child: Text(
                                    'Nombre',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 40.0,
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    _perfilData.isNotEmpty
                                        ? _perfilData[0].nombre
                                        : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 40.0,
                                color: Color(0xFF990202),
                                child: Center(
                                  child: Text(
                                    'N° de Tel.',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Container(
                                height: 40.0,
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    _perfilData.isNotEmpty
                                        ? _perfilData[0].celular
                                        : '',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ],
      ),
      bottomNavigationBar: footWidget(context),
    );
  }
}
