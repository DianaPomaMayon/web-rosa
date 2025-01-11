import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:rosa_bella/model/registro_model.dart';
import 'package:http/http.dart' as http;

Future<List<RegistroModel>> listarRegistro() async {
  final response =
      await http.get(Uri.parse('http://192.168.56.1:4001/registro'));
  if (response.statusCode == 200) {
    return compute(decodeJson, response.body);
  } else {
    throw Exception('Failed to load registro');
  }
}

List<RegistroModel> decodeJson(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<RegistroModel>((json) => RegistroModel.fromJson(json))
      .toList();
}

List<RegistroModel> decodeJson(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed
      .map<RegistroModel>((json) => RegistroModel.fromJson(json))
      .toList();
}

