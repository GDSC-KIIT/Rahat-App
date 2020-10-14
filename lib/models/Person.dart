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
  });

  String id;
  String name;
  String age;
  String medicalCondition;
  String userBy;

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json["_id"],
    name: json["name"],
    age: json["age"],
    medicalCondition: json["medicalCondition"],
    userBy: json["userBy"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "age": age,
    "medicalCondition": medicalCondition,
    "userBy": userBy,
  };
}
