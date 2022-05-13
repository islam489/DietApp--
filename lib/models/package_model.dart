// To parse this JSON data, do
//
//     final packageModel = packageModelFromJson(jsonString);

import 'dart:convert';

PackageModel packageModelFromJson(String str) => PackageModel.fromJson(json.decode(str));

String packageModelToJson(PackageModel data) => json.encode(data.toJson());

class PackageModel {
  PackageModel({
    this.responseCode,
    this.responseMessage,
    this.responseData,
  });

  int responseCode;
  String responseMessage;
  List<MembershipTypePackage> responseData;

  PackageModel copyWith({
    int responseCode,
    String responseMessage,
    List<MembershipTypePackage> responseData,
  }) =>
      PackageModel(
        responseCode: responseCode ?? this.responseCode,
        responseMessage: responseMessage ?? this.responseMessage,
        responseData: responseData ?? this.responseData,
      );

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
    responseCode: json["responseCode"],
    responseMessage: json["responseMessage"],
    responseData: List<MembershipTypePackage>.from(json["responseData"].map((x) => MembershipTypePackage.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "responseMessage": responseMessage,
    "responseData": List<dynamic>.from(responseData.map((x) => x.toJson())),
  };
}

class MembershipTypePackage {
  MembershipTypePackage({
    this.membershipId,
    this.nameAr,
    this.nameEn,
    this.price,
    this.duration,
    this.note,
    this.image,
    this.imageInside,
    this.membershipTypes,
  });

  int membershipId;
  String nameAr;
  String nameEn;
  String price;
  String duration;
  String note;
  String image;
  String imageInside;
  List<MembershipType> membershipTypes;

  MembershipTypePackage copyWith({
    int membershipId,
    String nameAr,
    String nameEn,
    String price,
    String duration,
    String note,
    String image,
    String imageInside,
    List<MembershipType> membershipTypes,
  }) =>
      MembershipTypePackage(
        membershipId: membershipId ?? this.membershipId,
        nameAr: nameAr ?? this.nameAr,
        nameEn: nameEn ?? this.nameEn,
        price: price ?? this.price,
        duration: duration ?? this.duration,
        note: note ?? this.note,
        image: image ?? this.image,
        imageInside: imageInside ?? this.imageInside,
        membershipTypes: membershipTypes ?? this.membershipTypes,
      );

  factory MembershipTypePackage.fromJson(Map<String, dynamic> json) => MembershipTypePackage(
    membershipId: json["membershipId"],
    nameAr: json["nameAr"],
    nameEn: json["nameEn"],
    price: json["price"],
    duration: json["duration"],
    note: json["note"],
    image: json["image"] == null ? null : json["image"],
    imageInside: json["imageInside"] == null ? null : json["imageInside"],
    membershipTypes: List<MembershipType>.from(json["membershipTypes"].map((x) => MembershipType.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "membershipId": membershipId,
    "nameAr": nameAr,
    "nameEn": nameEn,
    "price": price,
    "duration": duration,
    "note": note,
    "image": image == null ? null : image,
    "imageInside": imageInside == null ? null : imageInside,
    "membershipTypes": List<dynamic>.from(membershipTypes.map((x) => x.toJson())),
  };
}


class MembershipType {
  MembershipType({
    this.id,
    this.membershipId,
    this.titleEn,
    this.titleAr,
    this.dayCount,
    this.price,
    this.discEnable,
    this.notes,
  });

  int id;
  int membershipId;
  String titleEn;
  TitleAr titleAr;
  int dayCount;
  double price;
  bool discEnable;
  dynamic notes;

  MembershipType copyWith({
    int id,
    int membershipId,
    String titleEn,
    TitleAr titleAr,
    int dayCount,
    double price,
    bool discEnable,
    dynamic notes,
  }) =>
      MembershipType(
        id: id ?? this.id,
        membershipId: membershipId ?? this.membershipId,
        titleEn: titleEn ?? this.titleEn,
        titleAr: titleAr ?? this.titleAr,
        dayCount: dayCount ?? this.dayCount,
        price: price ?? this.price,
        discEnable: discEnable ?? this.discEnable,
        notes: notes ?? this.notes,
      );

  factory MembershipType.fromJson(Map<String, dynamic> json) => MembershipType(
    id: json["id"],
    membershipId: json["membershipId"],
    titleEn: json["titleEn"],
    titleAr: titleArValues.map[json["titleAr"]],
    dayCount: json["dayCount"],
    price: json["price"],
    discEnable: json["discEnable"],
    notes: json["notes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "membershipId": membershipId,
    "titleEn": titleEn,
    "titleAr": titleArValues.reverse[titleAr],
    "dayCount": dayCount,
    "price": price,
    "discEnable": discEnable,
    "notes": notes,
  };
}

enum TitleAr { FULL_SUBSCRIPTION, HALF_SUBSCRIPTION, WEEKLY_SUBSCRIPTION, DAILY_SUBSCRIPTION, EMPTY }

final titleArValues = EnumValues({
  "Daily Subscription": TitleAr.DAILY_SUBSCRIPTION,
  "اشتراك كامل": TitleAr.EMPTY,
  "Full Subscription": TitleAr.FULL_SUBSCRIPTION,
  "Half Subscription": TitleAr.HALF_SUBSCRIPTION,
  "Weekly Subscription": TitleAr.WEEKLY_SUBSCRIPTION
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
