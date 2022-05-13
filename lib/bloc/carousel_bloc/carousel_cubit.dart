import 'package:bloc/bloc.dart';
import 'package:diet_app/models/carousel_model.dart';
import 'package:diet_app/repo/Carousel/carousel_api.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'carousel_state.dart';

class CarouselCubit extends Cubit<CarouselState> {
  CarouselCubit() : super(CarouselInitial());

  Future< List <ResponseCarouselItem>> fetchCarouselList( BuildContext context) async {
    List <ResponseCarouselItem> carouselcubit;
    carouselcubit = await CarouselRepo.fetchCarouselList() ;
    // if(loginOne != null){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));
    // }
    emit(CarouselLoaded(carouselstate: carouselcubit));
    return carouselcubit;
}
}
