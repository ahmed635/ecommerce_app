import 'package:googleapis/androidpublisher/v3.dart';

class OfferModel {
  String? id;
  String? titleAr;
  String? titleEn;
  String? descriptionAr;
  String? descriptionEn;
  Timestamp? timestamp;
  bool? active;

  OfferModel(
      {this.id,
      this.titleAr,
      this.titleEn,
      this.descriptionAr,
      this.descriptionEn,
      this.timestamp,
      this.active});

  static OfferModel fromJson(Map<String, dynamic> json) => OfferModel(
        id: json["id"],
        titleAr: json["titleAr"],
        titleEn: json["titleEn"],
        descriptionAr: json["descriptionAr"],
        descriptionEn: json["descriptionEn"],
        timestamp: json["timestamp"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "titleAr": titleAr,
        "titleEn": titleEn,
        "descriptionAr": descriptionAr,
        "descriptionEn": descriptionEn,
        "timestamp": timestamp,
        "active": active,
      };
}
