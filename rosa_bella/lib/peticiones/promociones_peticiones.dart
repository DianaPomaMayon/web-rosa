import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:rosa_bella/model/promociones_model.dart';
import 'package:http/http.dart' as http;

Future<List<PromocionesModel>> listarPromociones() async {
  final response =
      await http.get(Uri.parse('http://192.168.1.2:4001/promocion'));
  if (response.statusCode == 200) {
    print('Response body: ${response.body}');
    return compute(decodeJson, response.body);
  } else {
    throw Exception('Failed to load promociones');
  }
}

List<PromocionesModel> decodeJson(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  List<PromocionesModel> promociones = parsed
      .map<PromocionesModel>((json) => PromocionesModel.fromJson(json))
      .toList();

  print('Promociones: $promociones');
  return promociones;
}
