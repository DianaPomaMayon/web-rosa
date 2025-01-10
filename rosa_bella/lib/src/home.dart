import 'package:flutter/material.dart';
import 'package:rosa_bella/widgets/serviciosWidget.dart';
import 'package:rosa_bella/widgets/promocionesWidget.dart';
import 'package:rosa_bella/widgets/footWidget.dart';
import 'package:rosa_bella/model/servicio_model.dart';
import 'package:rosa_bella/model/promociones_model.dart';
import 'package:rosa_bella/peticiones/servicio_peticiones.dart';
import 'package:rosa_bella/peticiones/promociones_peticiones.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ServicioModel> _servicios = [];
  List<PromocionesModel> _promociones = [];
  bool _isLoadingServicios = true;
  bool _isLoadingPromociones = true;

  final List<String> _promotionImages = [
    'images/mama.png',
    'images/tresuno.png',
    'images/2x1.png',
  ];

  @override
  void initState() {
    super.initState();
    _fetchServicios();
    _fetchPromociones();
  }

  Future<void> _fetchServicios() async {
    try {
      List<ServicioModel> servicios = await listarServicio();
      print('Servicios: $servicios');
      setState(() {
        _servicios = servicios;
        _isLoadingServicios = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoadingServicios = false;
      });
    }
  }

  Future<void> _fetchPromociones() async {
    try {
      List<PromocionesModel> promociones = await listarPromociones();
      print('Promociones: $promociones');
      setState(() {
        _promociones = promociones;
        _isLoadingPromociones = false;
      });
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoadingPromociones = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('images/logo_transparente.png'),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFE9E9E9),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "BIENVENIDO A ROSA BELLA",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "Descubre nuestros servicios",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Servicios",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    _isLoadingServicios
                        ? Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: _servicios.map((servicio) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context,
                                          servicio.nombreServicio
                                              .toLowerCase());
                                    },
                                    child: serviciosWidget(
                                        Icons.star, servicio.nombreServicio),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                    SizedBox(height: 20),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Promociones",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    _isLoadingPromociones
                        ? Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children:
                                    _promociones.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  PromocionesModel promocion = entry.value;
                                  return promocionesWidget(
                                    promocion.nombrePromocion ?? 'Sin nombre',
                                    promocion.precio ?? 'Sin precio',
                                    promocion.contiene ?? 'Sin descripción',
                                    _promotionImages[index %
                                        _promotionImages
                                            .length],
                                  );
                                }).toList(),
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
