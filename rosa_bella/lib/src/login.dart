import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late String _celular = '';
  late String _password = '';
  String _errorCelular = '',_errorPassword = '', _errorIniciar = '';
  final celularController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cargarDatosGuardados();
  }

  void _cargarDatosGuardados() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedCelular = prefs.getString('celular');
    String? storedPassword = prefs.getString('password');

    if (storedCelular != null && storedPassword != null) {
      setState(() {
        _celular = storedCelular;
        _password = storedPassword;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    _celular = '';
    _password = '';
    celularController.dispose();
    passwordController.dispose();
  }

  void _iniciarSesion() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedCelular = prefs.getString('celular');
    String? storedPassword = prefs.getString('password');

    if (_celular.isEmpty || _password.isEmpty) {
      setState(() {
        _errorIniciar = 'Por favor, ingresa el número de celular y la contraseña';
      });
      return;
    }

    if (_celular == storedCelular && _password == storedPassword) {
      _guardarSesion();
    } else {
      setState(() {
        _errorIniciar = 'Los datos ingresados son incorrectos';
      });
    }
  }

  Future<void> _guardarSesion() async {
    Navigator.pushReplacementNamed(context, 'welcome');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('sesion_iniciada', true);
    await prefs.setString('celular', _celular);
    await prefs.setString('password', _password);
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
                  'LOGIN',
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
                      _errorCelular = 'El número de celular debe tener 9 dígitos';
                    });
                  } else {
                    setState(() {
                      _errorCelular = '';
                      _errorIniciar = '';
                      _celular = valor;
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
                      _errorIniciar = '';
                      _password = valor;
                    });
                  }
                },
              ),
              Divider(
                color: Colors.transparent,
                height: 35.0,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _iniciarSesion,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF990202),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Iniciar Sesión',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
              Divider(
                color: Colors.transparent,
                height: 30.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'registro');
                },
                child: Text(
                  'Registrate',
                  style: TextStyle(
                    color: Color(0xFF990202),
                    fontSize: 18.0,
                  ),
                ),
              ),
              if (_errorIniciar.isNotEmpty)
                Text(
                  _errorIniciar,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16.0,
                  ),
                ),
            ],
          )
        ],
      ),
    );
  }
}