import 'package:diet_app/ui/widgets/component.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatefulWidget {
  static final route = 'forgetpassword';


  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
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
                padding: const EdgeInsets.symmetric(vertical: 30,horizontal: 10),
                child: Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Forget Password ",
                            style: TextStyle(
                                fontSize: 24.0, color: Colors.purple[200]),
                          ),
                        ),
                        Card(
                          elevation: 4.0,
                          child: defaultFormField(
                            label: 'Mobile Number',
                            type: TextInputType.number,
                            validate: (String value){
                              if (value.isEmpty) {
                                return 'Enter a valid Mobile Number!';
                              }
                              return null;
                            },
                          ),
                        ),




                        Card(
                          color: Colors.purple[200],
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)
                          ),
                          child: defaultButton(
                              text: 'Send',
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


