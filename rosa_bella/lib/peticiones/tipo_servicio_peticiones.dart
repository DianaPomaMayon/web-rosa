import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:rosa_bella/model/tipo_servicio_model.dart';
import 'package:http/http.dart' as http;

Future<List<TipoServicioModel>> listarTipoServicio() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.2:4001/tipoServicio'));
  if (response.statusCode == 200) {
    print('Response body: ${response.body}');
    return compute(decodeJson, response.body);
  } else {
    throw Exception('Failed to load tipo servicio');
  }
}

List<TipoServicioModel> decodeJson(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  List<TipoServicioModel> tipoServicio = parsed
      .map<TipoServicioModel>((json) => TipoServicioModel.fromJson(json))
      .toList();

  print('TipoServicio: $tipoServicio');
  return tipoServicio;
}
