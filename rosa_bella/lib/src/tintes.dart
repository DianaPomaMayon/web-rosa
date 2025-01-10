import 'package:flutter/material.dart';
import 'package:rosa_bella/widgets/tipoServicioWidget.dart';
import 'package:rosa_bella/model/tipo_servicio_model.dart';
import 'package:rosa_bella/peticiones/tipo_servicio_peticiones.dart';

class Tintes extends StatefulWidget {
  Tintes({Key? key}) : super(key: key);

  @override
  _TintesState createState() => _TintesState();
}

class _TintesState extends State<Tintes> {
  List<TipoServicioModel> _tintes = [];
  bool _isLoading = true;

  final List<String> _tipoServicioImages = [
    'images/tinte5.png',
    'images/tinte4.png',
    'images/tinte1.png',
    'images/tinte2.png',
    'images/tinte3.png',
    'images/tinte6.png',
  ];

  @override
  void initState() {
    super.initState();
    _fetchTintes();
  }

  Future<void> _fetchTintes() async {
    try {
      List<TipoServicioModel> tintes = await listarTipoServicio();
      print('Tintes: $tintes');
      setState(() {
        _tintes = tintes;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching tintes: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<TipoServicioModel> filteredTintes =
        _tintes.length >= 6 ? _tintes.sublist(0, 6) : _tintes;

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
                                    filteredTintes.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  TipoServicioModel tinte = entry.value;
                                  return tipoServicioWidget(
                                    tinte.nombreTipoServicio ?? 'Sin nombre',
                                    tinte.precio ?? 'S/0',
                                    'Tiempo: ${tinte.tiempo ?? 'N/A'}',
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
