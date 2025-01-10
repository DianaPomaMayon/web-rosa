class ServicioModel {
  //var id;
  var nombreServicio;

  ServicioModel({this.nombreServicio});
  factory ServicioModel.fromJson(Map<String, dynamic> json) {
    return ServicioModel(
        //id: json['_id'], 
        nombreServicio: json['nombreServicio']);
  }
}
