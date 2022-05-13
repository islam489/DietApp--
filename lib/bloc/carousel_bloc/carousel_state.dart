part of 'carousel_cubit.dart';

@immutable
abstract class CarouselState {}

class CarouselInitial extends CarouselState {}
class CarouselLoading extends CarouselState {}

class CarouselLoaded extends CarouselState {
final List<ResponseCarouselItem> carouselstate;
CarouselLoaded({this.carouselstate});
}

