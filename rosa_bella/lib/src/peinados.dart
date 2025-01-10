import 'package:flutter/material.dart';
import 'package:rosa_bella/widgets/tipoServicioWidget.dart';
import 'package:rosa_bella/model/tipo_servicio_model.dart';
import 'package:rosa_bella/peticiones/tipo_servicio_peticiones.dart';

class Peinados extends StatefulWidget {
  Peinados({Key? key}) : super(key: key);

  @override
  _PeinadosState createState() => _PeinadosState();
}

class _PeinadosState extends State<Peinados> {
  List<TipoServicioModel> _peinados = [];
  bool _isLoading = true;

  final List<String> _tipoServicioImages = [
    'images/peinado2.png',
    'images/peinado4.png',
    'images/peinado1.png',
    'images/peinado5.png',
    'images/peinado3.png',
    'images/peinado6.png',
    'images/peinado7.png',
  ];

  @override
  void initState() {
    super.initState();
    _fetchPeinados();
  }

  Future<void> _fetchPeinados() async {
    try {
      List<TipoServicioModel> peinados = await listarTipoServicio();
      print('Peinados: $peinados');
      setState(() {
        _peinados = peinados;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching peinados: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<TipoServicioModel> filteredPeinados =
        _peinados.length >= 7 ? _peinados.sublist(18, 25) : [];

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
                                children: filteredPeinados
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                  int index = entry.key;
                                  TipoServicioModel peinado = entry.value;
                                  return tipoServicioWidget(
                                    peinado.nombreTipoServicio ?? 'Sin nombre',
                                    peinado.precio ?? 'S/0',
                                    'Tiempo: ${peinado.tiempo ?? 'N/A'}',
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
