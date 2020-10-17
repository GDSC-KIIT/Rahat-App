// To parse this JSON data, do
//
//     final person = personFromJson(jsonString);

import 'dart:convert';

List<User> personFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String personToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    User({
        this.id,
        this.name,
        this.lastName,
        this.phone,
        this.email,
        this.v,
    });

    String id;
    String name;
    String lastName;
    String phone;
    String email;
    int v;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        name: json["name"],
        lastName: json["lastName"],
        phone: json["phone"],
        email: json["email"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "lastName": lastName,
        "phone": phone,
        "email": email,
        "__v": v,
    };
}
