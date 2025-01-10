import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rosa_bella/peticiones/registro_peticiones.dart';
import 'package:http/http.dart' as http;

class Registro extends StatefulWidget {
  Registro({Key? key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  late String _celular = '';
  late String _password = '';
  late String _nombre = '';
  final celularController = TextEditingController();
  final nombreController = TextEditingController();
  final passwordController = TextEditingController();
  String _errorCelular = '',
      _errorPassword = '',
      _errorRegistrar = '',
      _errorNombre = '';

  @override
  void dispose() {
    _celular = '';
    _password = '';
    _nombre = '';
    celularController.dispose();
    nombreController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> registrarUsuario() async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.56.1:4001/registro'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'nombre': _nombre,
          'celular': _celular,
          'password': _password,
        }),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> user = jsonDecode(response.body);
        print(
            'Usuario registrado: ${user['nombre']}');
        Navigator.pushNamed(context, 'welcome');
      } else {
        setState(() {
          _errorRegistrar = 'Error al registrar: ${response.body}';
        });
      }
    } catch (e) {
      setState(() {
        _errorRegistrar = 'Error al registrar. Inténtalo de nuevo.';
      });
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 30.0,
          vertical: 180.0,
        ),
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('images/logo.png'),
              ),
              Divider(
                color: Colors.transparent,
                height: 25.0,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'REGISTRARSE',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 25.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                controller: celularController,
                maxLength: 9,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                  hintText: 'N° Celular',
                  labelText: 'Celular',
                  labelStyle: TextStyle(color: Color(0xFF990202)),
                  suffixIcon: Icon(Icons.add_call),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF990202)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  errorText: _errorCelular.isNotEmpty ? _errorCelular : null,
                ),
                onChanged: (valor) {
                  if (valor.length != 9) {
                    setState(() {
                      _errorCelular =
                          'El número de celular debe tener 9 dígitos';
                    });
                  } else {
                    setState(() {
                      _errorCelular = '';
                      _errorRegistrar = '';
                      _celular = valor;
                    });
                  }
                },
              ),
              Divider(
                color: Colors.transparent,
                height: 18.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                autofocus: true,
                textCapitalization: TextCapitalization.characters,
                controller: nombreController,
                decoration: InputDecoration(
                  hintText: 'Juan Perez',
                  labelText: 'Nombre',
                  labelStyle: TextStyle(color: Color(0xFF990202)),
                  suffixIcon: Icon(Icons.account_circle_outlined),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF990202)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  errorText: _errorNombre.isNotEmpty ? _errorNombre : null,
                ),
                onChanged: (valor) {
                  setState(() {
                    _nombre = valor.toUpperCase();
                    _errorRegistrar = '';
                    _errorNombre = '';
                  });
                  if (valor.isEmpty) {
                    setState(() {
                      _errorNombre = 'Ingresa tu nombre';
                    });
                  }
                },
              ),
              Divider(
                color: Colors.transparent,
                height: 30.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                obscureText: true,
                controller: passwordController,
                maxLength: 5,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Color(0xFF990202)),
                  suffixIcon: Icon(Icons.password),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF990202)),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  errorText: _errorPassword.isNotEmpty ? _errorPassword : null,
                ),
                onChanged: (valor) {
                  if (valor.length != 5) {
                    setState(() {
                      _errorPassword = 'La contraseña debe tener 5 dígitos';
                    });
                  } else {
                    setState(() {
                      _errorPassword = '';
                      _errorRegistrar = '';
                      _password = valor;
                    });
                  }
                },
              ),
              Divider(
                color: Colors.transparent,
                height: 18.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF990202),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (_celular.isNotEmpty &&
                        _nombre.isNotEmpty &&
                        _password.isNotEmpty &&
                        _celular.length == 9 &&
                        _password.length == 5) {
                      registrarUsuario();
                      print('El celular es $_celular');
                      print('El nombre es $_nombre');
                      print('La contraseña es $_password');
                    } else {
                      setState(() {
                        _errorRegistrar =
                            'Completa todos los campos correctamente';
                        _errorCelular = _celular.isEmpty
                            ? 'Ingresa tu número de celular'
                            : '';
                        _errorNombre =
                            _nombre.isEmpty ? 'Ingresa tu nombre' : '';
                        _errorPassword =
                            _password.isEmpty ? 'Ingresa una contraseña' : '';
                      });
                    }
                  },
                ),
              ),
              if (_errorRegistrar.isNotEmpty)
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    _errorRegistrar,
                    style: TextStyle(
                      color: Color(0xFF990202),
                    ),
                  ),
                ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Text(
                  'Iniciar Sesión',
                  style: TextStyle(
                    color: Color(0xFF990202),
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
