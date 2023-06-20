import 'dart:convert';

SingleCourse singleCourseFromJson(String str) =>
    SingleCourse.fromJson(json.decode(str));

String singleCourseToJson(SingleCourse data) => json.encode(data.toJson());

class SingleCourse {
  String status;
  int code;
  Data data;
  String message;

  SingleCourse({
    required this.status,
    required this.code,
    required this.data,
    required this.message,
  });

  factory SingleCourse.fromJson(Map<String, dynamic> json) => SingleCourse(
        status: json["status"],
        code: json["code"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "data": data.toJson(),
        "message": message,
      };
}

class Data {
  dynamic averageRating;
  int numberOfCourseModules;
  int id;
  String name;
  int categoryId;
  int subcategoryId;
  String description;
  String image;
  String price;
  int totalEnrolled;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  CourseCategories courseCategories;
  CourseCategories courseSubCategories;
  List<dynamic> courseModules;
  List<dynamic> courseReviews;

  Data({
    this.averageRating,
    required this.numberOfCourseModules,
    required this.id,
    required this.name,
    required this.categoryId,
    required this.subcategoryId,
    required this.description,
    required this.image,
    required this.price,
    required this.totalEnrolled,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.courseCategories,
    required this.courseSubCategories,
    required this.courseModules,
    required this.courseReviews,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        averageRating: json["averageRating"],
        numberOfCourseModules: json["numberOfCourseModules"],
        id: json["id"],
        name: json["name"],
        categoryId: json["categoryId"],
        subcategoryId: json["subcategoryId"],
        description: json["description"],
        image: json["image"],
        price: json["price"],
        totalEnrolled: json["totalEnrolled"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        courseCategories: CourseCategories.fromJson(json["courseCategories"]),
        courseSubCategories:
            CourseCategories.fromJson(json["courseSubCategories"]),
        courseModules: List<dynamic>.from(json["courseModules"].map((x) => x)),
        courseReviews: List<dynamic>.from(json["courseReviews"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "averageRating": averageRating,
        "numberOfCourseModules": numberOfCourseModules,
        "id": id,
        "name": name,
        "categoryId": categoryId,
        "subcategoryId": subcategoryId,
        "description": description,
        "image": image,
        "price": price,
        "totalEnrolled": totalEnrolled,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "courseCategories": courseCategories.toJson(),
        "courseSubCategories": courseSubCategories.toJson(),
        "courseModules": List<dynamic>.from(courseModules.map((x) => x)),
        "courseReviews": List<dynamic>.from(courseReviews.map((x) => x)),
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

  factory CourseCategories.fromJson(Map<String, dynamic> json) =>
      CourseCategories(
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
