class Doaadetailmodel {
  int? id;
  String? body;
  Doaadetailmodel(this.id, this.body);
  Doaadetailmodel.fromjson(Map<String, dynamic> json) {
    id = json["id"];
    body = json["body"];
  }
}
