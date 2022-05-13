import 'package:bloc/bloc.dart';
import 'package:diet_app/bloc/login_bloc/login_cubit.dart';
import 'package:diet_app/models/package_model.dart';
import 'package:diet_app/repo/Packages/package.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'package_state.dart';

class PackageCubit extends Cubit<PackageState> {
  PackageCubit() : super(PackageInitial());

  Future< List <MembershipTypePackage>> fetchPackagesList( BuildContext context) async {
    List <MembershipTypePackage> membershipitemcubit;
    membershipitemcubit = await PackageRepo.fetchPackagesList() ;
    print("membershipitemcubit.length");
    print(membershipitemcubit.length);
    // if(loginOne != null){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));
    // }
    emit(PackageLoaded(membershipitemstate: membershipitemcubit));
    return membershipitemcubit;


  }
}
