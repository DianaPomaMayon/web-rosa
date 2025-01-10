class PromocionesModel {
  String? nombrePromocion;
  String? precio;
  String? contiene;

  PromocionesModel({this.nombrePromocion, this.contiene, this.precio});

  factory PromocionesModel.fromJson(Map<String, dynamic> json) {
    return PromocionesModel(
      nombrePromocion: json['nombrePromocion'],
      precio: json['precio'],
      contiene: json['contiene'],
    );
  }
}
