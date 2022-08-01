class Doaamodel {
  int? id;
  String? name;
  Doaamodel(this.id, this.name);
  Doaamodel.fromjson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
  }
}
