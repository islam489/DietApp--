// To parse this JSON data, do
//
//     final carouselModel = carouselModelFromJson(jsonString);

import 'dart:convert';

CarouselModel carouselModelFromJson(String str) => CarouselModel.fromJson(json.decode(str));

String carouselModelToJson(CarouselModel data) => json.encode(data.toJson());

class CarouselModel {
  CarouselModel({
    this.responseCode,
    this.responseMessage,
    this.responseData,
  });

  int responseCode;
  String responseMessage;
  List<ResponseCarouselItem> responseData;

  CarouselModel copyWith({
    int responseCode,
    String responseMessage,
    List<ResponseCarouselItem> responseData,
  }) =>
      CarouselModel(
        responseCode: responseCode ?? this.responseCode,
        responseMessage: responseMessage ?? this.responseMessage,
        responseData: responseData ?? this.responseData,
      );

  factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
    responseCode: json["responseCode"],
    responseMessage: json["responseMessage"],
    responseData: List<ResponseCarouselItem>.from(json["responseData"].map((x) => ResponseCarouselItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "responseMessage": responseMessage,
    "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
  };
}

class ResponseCarouselItem {
  ResponseCarouselItem({
    this.id,
    this.titleEn,
    this.titleAr,
    this.imagePath,
    this.packageId,
    this.sortOrder,
    this.vaildFrom,
    this.vaildTo,
  });

  int id;
  String titleEn;
  String titleAr;
  String imagePath;
  int packageId;
  dynamic sortOrder;
  dynamic vaildFrom;
  dynamic vaildTo;

  ResponseCarouselItem copyWith({
    int id,
    String titleEn,
    String titleAr,
    String imagePath,
    int packageId,
    dynamic sortOrder,
    dynamic vaildFrom,
    dynamic vaildTo,
  }) =>
      ResponseCarouselItem(
        id: id ?? this.id,
        titleEn: titleEn ?? this.titleEn,
        titleAr: titleAr ?? this.titleAr,
        imagePath: imagePath ?? this.imagePath,
        packageId: packageId ?? this.packageId,
        sortOrder: sortOrder ?? this.sortOrder,
        vaildFrom: vaildFrom ?? this.vaildFrom,
        vaildTo: vaildTo ?? this.vaildTo,
      );

  factory ResponseCarouselItem.fromJson(Map<String, dynamic> json) => ResponseCarouselItem(
    id: json["id"],
    titleEn: json["titleEn"],
    titleAr: json["titleAr"],
    imagePath: json["imagePath"],
    packageId: json["packageId"],
    sortOrder: json["sortOrder"],
    vaildFrom: json["vaildFrom"],
    vaildTo: json["vaildTo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "titleEn": titleEn,
    "titleAr": titleAr,
    "imagePath": imagePath,
    "packageId": packageId,
    "sortOrder": sortOrder,
    "vaildFrom": vaildFrom,
    "vaildTo": vaildTo,
  };
}
