import 'package:googleapis/androidpublisher/v3.dart';

class ItemModel {
  String? id;
  String? nameAr;
  String? nameEn;
  String? descriptionAr;
  String? descriptionEn;
  String? image;
  int? count;
  double? price;
  double? discount;
  double? tax;
  bool? active;
  Timestamp? dateTime;
  String? categoryId;

  ItemModel(
      {this.id,
      this.nameAr,
      this.nameEn,
      this.descriptionAr,
      this.descriptionEn,
      this.image,
      this.count,
      this.price,
      this.discount,
      this.tax,
      this.active,
      this.dateTime,
      this.categoryId});

  static ItemModel fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["id"],
        nameAr: json["nameAr"],
        nameEn: json["nameEn"],
        descriptionAr: json["descriptionAr"],
        descriptionEn: json["descriptionEn"],
        image: json["image"],
        count: json["count"],
        price: double.tryParse(json["price"]),
        discount: double.tryParse(json["discount"]),
        tax: double.tryParse(json["tax"]),
        active: json["active"],
        categoryId: json["categoryId"],
        dateTime: json['dateTime'],
      );

  Map<String, dynamic> toJson() => {
    'id': id,
    'nameAr': nameAr,
    'nameEn': nameEn,
    'descriptionAr': descriptionAr,
    'descriptionEn': descriptionEn,
    'image': image,
    'count': count,
    'price': price,
    'tax': tax,
    'discount': discount,
    'active': active,
    'categoryId': categoryId,
    'dateTime': dateTime,
  };
}
