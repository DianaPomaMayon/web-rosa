class PerfilModel {
  var nombre;
  var celular;

  PerfilModel({this.nombre, this.celular});
  factory PerfilModel.fromJson(Map<String, dynamic> json) {
    return PerfilModel(
        nombre: json['nombre'],
        celular: json['celular']
        );
  }
}
