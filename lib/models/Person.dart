// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

List<Person> personFromJson(String str) => List<Person>.from(json.decode(str).map((x) => Person.fromJson(x)));

String personToJson(List<Person> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Person {
  Person({
    this.id,
    this.name,
    this.age,
    this.medicalCondition,
    this.userBy,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String name;
  String age;
  MedicalCondition medicalCondition;
  UserBy userBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["_id"],
    name: json["name"],
    age: json["age"],
    medicalCondition: MedicalCondition.fromJson(json["medicalCondition"]),
    userBy: UserBy.fromJson(json["userBy"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "age": age,
    "medicalCondition": medicalCondition.toJson(),
    "userBy": userBy.toJson(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}

class MedicalCondition {
  MedicalCondition({
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

  factory MedicalCondition.fromJson(Map<String, dynamic> json) => MedicalCondition(
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

class UserBy {
  UserBy({
    this.id,
    this.name,
    this.lastName,
    this.phone,
    this.email,
    this.salt,
    this.encryPassword,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String name;
  String lastName;
  String phone;
  String email;
  String salt;
  String encryPassword;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory UserBy.fromJson(Map<String, dynamic> json) => UserBy(
    id: json["_id"],
    name: json["name"],
    lastName: json["lastName"],
    phone: json["phone"],
    email: json["email"],
    salt: json["salt"],
    encryPassword: json["encry_password"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "lastName": lastName,
    "phone": phone,
    "email": email,
    "salt": salt,
    "encry_password": encryPassword,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
  };
}
