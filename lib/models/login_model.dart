// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.responseCode,
    this.responseMessage,
    this.responseData,
  });

  int responseCode;
  String responseMessage;
  ResponseData responseData;

  LoginModel copyWith({
    int responseCode,
    String responseMessage,
    ResponseData responseData,
  }) =>
      LoginModel(
        responseCode: responseCode ?? this.responseCode,
        responseMessage: responseMessage ?? this.responseMessage,
        responseData: responseData ?? this.responseData,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    responseCode: json["responseCode"],
    responseMessage: json["responseMessage"],
    responseData: json["responseCode"]==200? ResponseData.fromJson(json["responseData"]):null,
  );

  Map<String, dynamic> toJson() => {
    "responseCode": responseCode,
    "responseMessage": responseMessage,
    "responseData": responseData.toJson(),
  };
}

class ResponseData {
  ResponseData({
    this.userId,
    this.fullName,
    this.userName,
    this.clientId,
    this.mobile,
    this.password,
    this.token,
    this.platFormType,
    this.deviceId,
    this.currentSubscriptionId,
    this.apiDataToken,
  });

  int userId;
  String fullName;
  String userName;
  int clientId;
  String mobile;
  String password;
  dynamic token;
  dynamic platFormType;
  dynamic deviceId;
  dynamic currentSubscriptionId;
  String apiDataToken;

  ResponseData copyWith({
    int userId,
    String fullName,
    String userName,
    int clientId,
    String mobile,
    String password,
    dynamic token,
    dynamic platFormType,
    dynamic deviceId,
    dynamic currentSubscriptionId,
    String apiDataToken,
  }) =>
      ResponseData(
        userId: userId ?? this.userId,
        fullName: fullName ?? this.fullName,
        userName: userName ?? this.userName,
        clientId: clientId ?? this.clientId,
        mobile: mobile ?? this.mobile,
        password: password ?? this.password,
        token: token ?? this.token,
        platFormType: platFormType ?? this.platFormType,
        deviceId: deviceId ?? this.deviceId,
        currentSubscriptionId: currentSubscriptionId ?? this.currentSubscriptionId,
        apiDataToken: apiDataToken ?? this.apiDataToken,
      );

  factory ResponseData.fromJson(Map<String, dynamic> json) => ResponseData(
    userId: json["userId"],
    fullName: json["fullName"],
    userName: json["userName"],
    clientId: json["clientId"],
    mobile: json["mobile"],
    password: json["password"],
    token: json["token"],
    platFormType: json["platFormType"],
    deviceId: json["deviceId"],
    currentSubscriptionId: json["currentSubscriptionId"],
    apiDataToken: json["apiDataToken"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "fullName": fullName,
    "userName": userName,
    "clientId": clientId,
    "mobile": mobile,
    "password": password,
    "token": token,
    "platFormType": platFormType,
    "deviceId": deviceId,
    "currentSubscriptionId": currentSubscriptionId,
    "apiDataToken": apiDataToken,
  };
}
