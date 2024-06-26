

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
    int categoryId;
    int subCategoryId;
    String description;
    String image;
    String price;
    int totalEnrolled;
    String createdBy;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    CourseCategories courseCategories;
    CourseCategories courseSubCategories;

    Datum({
        required this.id,
        required this.name,
        required this.categoryId,
        required this.subCategoryId,
        required this.description,
        required this.image,
        required this.price,
        required this.totalEnrolled,
        required this.createdBy,
        required this.createdAt,
        required this.updatedAt,
        this.deletedAt,
        required this.courseCategories,
        required this.courseSubCategories,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        categoryId: json["categoryId"] ?? "",
        subCategoryId: json["subCategoryId"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        totalEnrolled: json["totalEnrolled"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        deletedAt: json["deletedAt"],
        courseCategories: CourseCategories.fromJson(json["courseCategories"]),
        courseSubCategories: CourseCategories.fromJson(json["courseSubCategories"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "categoryId": categoryId,
        "subCategoryId": subCategoryId,
        "description": description,
        "image": image,
        "price": price,
        "totalEnrolled": totalEnrolled,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "deletedAt": deletedAt,
        "courseCategories": courseCategories.toJson(),
        "courseSubCategories": courseSubCategories.toJson(),
    };
}

class CourseCategories {
    int id;
    String name;
    String image;
    DateTime createdAt;
    DateTime updatedAt;
    int? categoryId;

    CourseCategories({
        required this.id,
        required this.name,
        required this.image,
        required this.createdAt,
        required this.updatedAt,
        this.categoryId,
    });

    factory CourseCategories.fromJson(Map<String, dynamic> json) => CourseCategories(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        categoryId: json["categoryId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "categoryId": categoryId,
    };
}
