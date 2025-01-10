import 'package:flutter/material.dart';
import 'package:rosa_bella/widgets/tipoServicioWidget.dart';
import 'package:rosa_bella/model/tipo_servicio_model.dart';
import 'package:rosa_bella/peticiones/tipo_servicio_peticiones.dart';

class Cortes extends StatefulWidget {
  Cortes({Key? key}) : super(key: key);

  @override
  _CortesState createState() => _CortesState();
}

class _CortesState extends State<Cortes> {
  List<TipoServicioModel> _cortes = [];
  bool _isLoading = true;

  final List<String> _tipoServicioImages = [
    'images/corte2.png',
    'images/corte4.png',
    'images/corte1.png',
    'images/corte5.png',
    'images/corte3.png',
    'images/corte6.png',
    'images/corte7.png',
  ];

  @override
  void initState() {
    super.initState();
    _fetchCortes();
  }

  Future<void> _fetchCortes() async {
    try {
      List<TipoServicioModel> cortes = await listarTipoServicio();
      print('Cortes: $cortes');
      setState(() {
        _cortes = cortes;
        _isLoading = false;
      });
    } catch (e) {
      print('Error fetching cortes: $e');
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<TipoServicioModel> filteredCortes =
        _cortes.length >= 7 ? _cortes.sublist(6, 13) : [];

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
                                    filteredCortes.asMap().entries.map((entry) {
                                  int index = entry.key;
                                  TipoServicioModel corte = entry.value;
                                  return tipoServicioWidget(
                                    corte.nombreTipoServicio ?? 'Sin nombre',
                                    corte.precio ?? 'S/0',
                                    'Tiempo: ${corte.tiempo ?? 'N/A'}',
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
