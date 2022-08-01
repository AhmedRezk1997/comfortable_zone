class Khawatermodel {
  String? body;
  Khawatermodel(this.body);
  Khawatermodel.fromjson(Map<String, dynamic> json) {
    body = json["body"];
  }
}
