class RegistroModel {
  var nombreUsuaurio;
  var celular;
  var password;

  RegistroModel({this.nombreUsuaurio, this.celular, this.password});
  factory RegistroModel.fromJson(Map<String, dynamic> json) {
    return RegistroModel(
        nombreUsuaurio: json['nombreUsuaurio'],
        celular: json['celular'],
        password: json['password'],
        );
  }
}
