import 'package:diet_app/ui/widgets/component.dart';
import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  static final route = 'changepassword';


  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child:Column(
          children: [
            Row(
              children: [
                IconButton(
                    icon: Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.purple[200],
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
                Expanded(
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      child: Image.asset("assets/images/header.png"),
                    ),
                  ),
                ),
              ],
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
                            "Change Password ",
                            style: TextStyle(
                                fontSize: 24.0, color: Colors.purple[200]),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Card(
                          elevation: 4.0,
                          child: defaultFormField(
                            label: 'Current Password',
                            type: TextInputType.visiblePassword,
                            validate: (String value){
                              if (value.isEmpty) {
                                return 'Enter a valid current password!';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10,),
                        Card(
                          elevation: 4.0,
                          child: defaultFormField(
                            label: 'New Password',
                            type: TextInputType.visiblePassword,
                            validate: (String value){
                              if (value.isEmpty) {
                                return 'Enter a valid New Password!';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 10,),
                        Card(
                          elevation: 4.0,
                          child: defaultFormField(
                            label: 'Confirmed Password',
                            type: TextInputType.visiblePassword,
                            validate: (String value){
                              if (value.isEmpty) {
                                return 'Enter a valid Confirmed Password!';
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
                          child: defaultButton(
                              text: 'Change',
                              radius: 25,
                              function: (){
                                if(_formKey.currentState.validate()){
                                  print('Login Succes');

                                }
                              }
                          ),

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

      ),
    );
  }
}


