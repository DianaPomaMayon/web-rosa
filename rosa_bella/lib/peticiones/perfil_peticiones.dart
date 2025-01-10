import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:rosa_bella/model/perfil_model.dart';
import 'package:http/http.dart' as http;

Future<List<PerfilModel>> listarPerfil() async {
  final response = await http.get(Uri.parse('http://192.168.56.1:4001/perfil'));
  if (response.statusCode == 200) {
    return compute(decodeJson, response.body);
  } else {
    throw Exception('Failed to load perfil');
  }
}

List<PerfilModel> decodeJson(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<PerfilModel>((json) => PerfilModel.fromJson(json))
      .toList();
}
