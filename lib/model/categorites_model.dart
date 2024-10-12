import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  String? id;
  String? nameAr;
  String? nameEn;
  String? image;
  Timestamp? dateTime;

  CategoryModel(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.image,
      this.dateTime});

  static CategoryModel fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        nameAr: json["nameAr"],
        nameEn: json["nameEn"],
        image: json["image"],
        dateTime: json['dateTime'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameAr': nameAr,
        'nameEn': nameEn,
        'image': image,
        'dateTime': dateTime,
      };
}
