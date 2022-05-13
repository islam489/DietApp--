import 'package:diet_app/ui/widgets/component.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static final route = 'signup';


  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Sign Up ",
                            style: TextStyle(
                                fontSize: 24.0, color: Colors.purple[200]),
                          ),
                        ),
                        Card(
                          elevation: 4.0,
                          child: defaultFormField(
                            label: 'Full Name',
                            prefix: Icons.email,
                            type: TextInputType.name,
                            validate: (String value){
                              if (value.isEmpty) {
                                return 'Enter a valid Name!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Card(
                          elevation: 4.0,
                          child: defaultFormField(
                            label: 'mobile',
                            prefix: Icons.lock_clock_outlined,
                            type: TextInputType.number,
                            validate: (String value){
                              if (value.isEmpty) {
                                return 'Enter a valid mobile!';
                              }
                              return null;
                            },
                          ),
                        ),
                        Card(
                          elevation: 4.0,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                               child: defaultFormField(
                                  label: 'Weight',
                                  type: TextInputType.phone,
                                  validate: (String value){
                                    if (value.isEmpty) {
                                      return 'Enter a valid Weight!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: defaultFormField(
                                  label: 'Target Weigt',
                                  type: TextInputType.phone,
                                  validate: (String value){
                                    if (value.isEmpty) {
                                      return 'Enter a valid Target Weigt!';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: defaultFormField(
                                  label: 'Height',
                                  type: TextInputType.phone,
                                  validate: (String value){
                                    if (value.isEmpty) {
                                      return 'Enter a valid Height!';
                                    }
                                    return null;
                                  },
                                ),
                              ),

                            ],
                          ),

                        ),


                        Card(
                          color: Colors.purple[200],
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)
                          ),
                          child: defaultButton(
                              text: 'Register',
                              radius: 25,
                              function: (){
                                if(_formKey.currentState.validate()){
                                  print('Login Succes');

                                }
                              }
                          ),

                        ),

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


