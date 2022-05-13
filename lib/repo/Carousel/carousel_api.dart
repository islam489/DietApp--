import 'dart:convert';

import 'package:diet_app/models/carousel_model.dart';
import 'package:diet_app/utils/constant.dart';
import 'package:http/http.dart';
class CarouselRepo{
  static Future<List<ResponseCarouselItem>> fetchCarouselList() async {
    String url =
        apiLink + "DietOfferCarouselMob/GetDietOfferCarousel";

    try {
      final Response response = await get(Uri.parse(url));
      print(response.body);
      print("carouselllllllllllllllllll");
      List CarouselItem = json.decode(response.body)["responseData"];
      return CarouselItem.map((e) => ResponseCarouselItem.fromJson(e)).toList();
    } catch (e) {
      print(e.toString());
    }
  }
}