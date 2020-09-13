import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.token,
        this.user,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        token: json["token"],
        user: UserClass.fromJson(json["user"]),
    );

    String token;
    UserClass user;

    Map<String, dynamic> toJson() => {
        "token": token,
        "user": user.toJson(),
    };
}

class UserClass {
    UserClass({
        this.id,
        this.name,
        this.lastName,
        this.email,
    });

    factory UserClass.fromJson(Map<String, dynamic> json) => UserClass(
        id: json["_id"],
        name: json["name"],
        lastName: json["lastName"],
        email: json["email"],
    );

    String email;
    String id;
    String lastName;
    String name;

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "lastName": lastName,
        "email": email,
    };
}
