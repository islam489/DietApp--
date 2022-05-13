part of 'package_cubit.dart';

@immutable
abstract class PackageState {}

class PackageInitial extends PackageState {}
class PackageLoading extends PackageState{}
class PackageLoaded extends PackageState {
   final List <MembershipTypePackage> membershipitemstate;
  PackageLoaded({this.membershipitemstate});
}

