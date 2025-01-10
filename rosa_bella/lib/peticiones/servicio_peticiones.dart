import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:rosa_bella/model/servicio_model.dart';
import 'package:http/http.dart' as http;

Future<List<ServicioModel>> listarServicio() async {
  final response =
      await http.get(Uri.parse('http://192.168.56.1:4001/servicio'));
  if (response.statusCode == 200) {
    return compute(decodeJson, response.body);
  } else {
    throw Exception('Failed to load servicios');
  }
}

List<ServicioModel> decodeJson(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<ServicioModel>((json) => ServicioModel.fromJson(json))
      .toList();
}
