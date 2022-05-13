import 'package:bloc/bloc.dart';
import 'package:diet_app/models/login_model.dart';
import 'package:diet_app/repo/auth/login.dart';
import 'package:diet_app/ui/main_screens/changePassword_Screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<LoginModel> login( String userName, String password,BuildContext context) async {
    LoginModel loginModelcubit;
    loginModelcubit = await LoginRepo.login(userName, password);
    // if(loginOne != null){
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePasswordScreen()));
    // }
    emit(LoginLoaded(loginModelstate: loginModelcubit));
    return loginModelcubit;


  }
}


