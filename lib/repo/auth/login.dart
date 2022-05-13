import 'dart:convert';

import 'package:diet_app/models/login_model.dart';
import 'package:diet_app/utils/constant.dart';
import 'package:http/http.dart';

class LoginRepo{
  static Future<LoginModel> login( String userName, String password) async {
      String url =
        apiLink + "AdministratorMob/UserLogIn";
      final Response response = await post( Uri.parse(url),
        headers: <String, String>{'Content-Type': 'application/json'},
        body: jsonEncode(<String, String>{
          "UserName": userName,
          "Password": password,
        }));
    if (response.statusCode == 200) {
      print(response.body);
      print('login succses 0000000000000000000000');

      return LoginModel.fromJson(json.decode(response.body.toString()));

    } else {
      throw Exception('can not reload');
    }
  }

}