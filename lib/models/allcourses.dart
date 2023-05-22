// To parse this JSON data, do
//
//     final allcourses = allcoursesFromJson(jsonString);

import 'dart:convert';

Allcourses allcoursesFromJson(String str) => Allcourses.fromJson(json.decode(str));

String allcoursesToJson(Allcourses data) => json.encode(data.toJson());

class Allcourses {
    String status;
    int code;
    List<Datum> data;
    String message;

    Allcourses({
        required this.status,
        required this.code,
        required this.data,
        required this.message,
    });

    factory Allcourses.fromJson(Map<String, dynamic> json) => Allcourses(
        status: json["status"],
        code: json["code"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
    };
}

class Datum {
    int id;
    String name;
    String image;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.name,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}
