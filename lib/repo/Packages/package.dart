import 'dart:convert';

import 'package:diet_app/models/package_model.dart';
import 'package:diet_app/utils/constant.dart';
import 'package:http/http.dart';
class PackageRepo{
  static Future<List<MembershipTypePackage>> fetchPackagesList() async {
    String url =
        apiLink + "DietMembershipMob/GetDietMemberships";

    try {
      final Response response = await get(Uri.parse(url));
        print(response.body);
       print("sssssssssssssssssssssssssssss");
      List packageItem = json.decode(response.body)["responseData"];
      return packageItem.map((e) => MembershipTypePackage.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
    }
  }
}