class TipoServicioModel {
  String? nombreTipoServicio;
  String? precio;
  String? tiempo;

 TipoServicioModel({this.nombreTipoServicio, this.tiempo, this.precio});

  factory TipoServicioModel.fromJson(Map<String, dynamic> json) {
    return TipoServicioModel(
      nombreTipoServicio: json['nombreTipoServicio'],
      precio: json['precio'],
      tiempo: json['tiempo'],
    );
  }
}
