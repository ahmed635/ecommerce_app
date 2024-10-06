import 'package:ecommerce_app/data/model/item_model.dart';

class CategoryModel {
  String? id;
  String? nameAr;
  String? nameEn;
  String? image;
  DateTime? dateTime;
  List<ItemModel>? items;

  CategoryModel(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.image,
      this.dateTime,
      this.items});

  static CategoryModel fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        nameAr: json["nameAr"],
        nameEn: json["nameEn"],
        image: json["image"],
        dateTime: DateTime.parse(json['dateTime']),
        items: json["items"],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'nameAr': nameAr,
        'nameEn': nameEn,
        'image': image,
        'dateTime': dateTime!.toIso8601String(),
        'items': items!.map((element) {
          element.toJson();
        }),
      };
}
