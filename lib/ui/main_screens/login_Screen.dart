import 'package:diet_app/bloc/login_bloc/login_cubit.dart';
import 'package:diet_app/models/login_model.dart';
import 'package:diet_app/ui/main_screens/packageScreen.dart';
import 'package:diet_app/ui/widgets/component.dart';
import 'package:diet_app/ui/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'changePassword_Screen.dart';

class LoginScreen extends StatefulWidget {
  static final route = 'login';


  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final loginkey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginCubit loginCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     loginCubit = BlocProvider.of<LoginCubit>(context);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: loginkey,
        appBar: AppBar(),
      body: BlocBuilder<LoginCubit,LoginState>(
        builder: (context,state){
          return SingleChildScrollView(
            child:Column(
              children: [

                Center(
                  child: Container(
                      width: 200,
                      height: 200,
                      child: Image.asset("assets/images/header.png")),
                ),
                SizedBox(
                  height: 50,
                ),
                Card(

                  margin: EdgeInsets.all(15.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(color: Colors.purple[200])
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Container(
                              margin: EdgeInsets.only(top: 5.0),
                              child: Text(
                                "Log In ",
                                style: TextStyle(
                                    fontSize: 24.0, color: Colors.purple[200]),
                              ),
                            ),
                            SizedBox(height: 15,),
                            Card(
                              elevation: 4.0,
                              child: defaultFormField(
                                controller: nameController,
                                label: 'mobile',
                                prefix: Icons.email,
                                type: TextInputType.phone,
                                validate: (String value){
                                  if (value.isEmpty) {
                                    return 'Enter a valid email!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 10,),
                            Card(
                              elevation: 4.0,
                              child: defaultFormField(
                                controller: passwordController,
                                label: 'password',
                                prefix: Icons.lock_clock_outlined,
                                type: TextInputType.number,
                                validate: (String value){
                                  if (value.isEmpty) {
                                    return 'Enter a valid password!';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(height: 10,),
                            Card(
                              color: Colors.purple[200],
                              elevation: 4.0,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)
                              ),
                              child: state is LoginLoading?Center(
                                child: CircularProgressIndicator(),
                              ):defaultButton(
                                  text: 'login',
                                  radius: 25,
                                  function: ()async{
                                    print("ssssss");
                                    if(_formKey.currentState.validate()) {
                                      LoginModel login = await loginCubit.login(nameController.text, passwordController.text,context);
                                     if(state is LoginLoaded){
                                       print("WWWWW");
                                       if(state.loginModelstate.responseCode == 200){
                                         Navigator.push(context, MaterialPageRoute(builder: (context)=>PackageScreen()));
                                       }
                                       else if (state.loginModelstate.responseCode == 404){
                                         loginkey.currentState.showSnackBar(SnackBar(
                                           backgroundColor: Colors.purple[200],
                                           margin: EdgeInsets.all(50),
                                           behavior: SnackBarBehavior.floating,
                                           shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.all(
                                                   Radius.circular(20))),
                                           content: Text(
                                             'Sorry, username or password is not correct.',
                                             style: TextStyle(
                                                 color: Colors.white, fontSize: 18),
                                           ),
                                         ));
                                       }
                                     }
                                    }
                                  }
                              ),

                            ),
                            SizedBox(height: 10,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextButton(onPressed: (){}, child: Text('sign Up',style: TextStyle(color: Colors.purple[200],fontSize: 18),)) ,
                                TextButton(onPressed: (){}, child: Text('forget Password',style: TextStyle(color: Colors.purple[200],fontSize: 18),)) ,



                              ],
                            ),
                            SizedBox(height: 15,),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ) ,

          );
        },
      )
    );
  }
}


/*TextFormField(
controller: nameController,
decoration: InputDecoration(
labelText: 'Mobile',
labelStyle: TextStyle(color: Colors.purple[200]),
border: InputBorder.none,
focusedBorder: InputBorder.none,
enabledBorder: InputBorder.none,
errorBorder: InputBorder.none,
disabledBorder: InputBorder.none,
contentPadding:
EdgeInsets.only(left: 15, top: 11, right: 15),
),
keyboardType: TextInputType.phone,
autofocus: true,
onFieldSubmitted: (value) {
//Validator
},
validator: (value) {
if (value.isEmpty) {
return 'Enter a valid email!';
}
return null;
},
),*/