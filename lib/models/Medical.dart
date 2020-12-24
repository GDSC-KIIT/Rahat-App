// To parse this JSON data, do
//
//     final medical = medicalFromJson(jsonString);

import 'dart:convert';

List<Medical> medicalFromJson(String str) => List<Medical>.from(json.decode(str).map((x) => Medical.fromJson(x)));

String medicalToJson(List<Medical> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Medical {
  Medical({
    this.description,
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  List<String> description;
  String id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Medical.fromJson(Map<String, dynamic> json) => Medical(
    description: List<String>.from(json["description"].map((x) => x)),
    id: json["_id"],
    name: json["name"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "description": List<dynamic>.from(description.map((x) => x)),
    "_id": id,
    "name": name,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
