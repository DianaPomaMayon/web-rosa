import 'package:flutter/material.dart';
import 'package:rosa_bella/widgets/tipoServicioWidget.dart';
import 'package:rosa_bella/model/tipo_servicio_model.dart';
import 'package:rosa_bella/peticiones/tipo_servicio_peticiones.dart';

class Unas extends StatefulWidget {
  Unas({Key? key}) : super(key: key);

  @override
  _UnasState createState() => _UnasState();
}

class _UnasState extends State<Unas> {
  List<TipoServicioModel> _unas = [];
  bool _isLoading = true;

  final List<String> _tipoServicioImages = [
    'images/uñas1.png',
    'images/uñas2.png',
    'images/uñas5.png',
    'images/uñas4.png',
    'images/uñas3.png',
  ];

  @override
  void initState() {
    super.initState();
    _fetchUnas();
  }

  Future<void> _fetchUnas() async {
    try {
      List<TipoServicioModel> unas = await listarTipoServicio();
      print('Unas: $unas');
      setState(() {
        _unas = unas;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching unas: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<TipoServicioModel> filteredUnas =
        _unas.length >= 5 ? _unas.sublist(13, 18) : _unas;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, 'home');
          },
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
                    _isLoading
                        ? Center(child: CircularProgressIndicator())
                        : SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                children:
                                    filteredUnas.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  TipoServicioModel una = entry.value;
                                  return tipoServicioWidget(
                                    una.nombreTipoServicio ?? 'Sin nombre',
                                    una.precio ?? 'S/0',
                                    'Tiempo: ${una.tiempo ?? 'N/A'}',
                                    _tipoServicioImages[
                                        index % _tipoServicioImages.length],
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
    );
  }
}
