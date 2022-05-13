import 'package:flutter/material.dart';

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  Function OnSubmite,
  Function OnChange,
  @required Function validate,
  @required String label,
  IconData prefix,


})
=>TextFormField(
  controller: controller,
  keyboardType: type,
  onFieldSubmitted: OnSubmite,
  validator: validate,
  onChanged: OnChange,
  decoration: InputDecoration(labelText: label,labelStyle: TextStyle(color: Colors.black,fontSize: 20,
  ),

    border: InputBorder.none,
    focusedBorder: InputBorder.none,
    enabledBorder: InputBorder.none,
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
    //contentPadding: EdgeInsets.only(left: 15, top: 11, right: 15),
    prefixIcon: prefix!=null? Icon(prefix):null,

  ),
);

Widget defaultButton({
  double width =double.infinity,
  @required Function function,
  @required String text,
  bool isUpperCase =false,
  double radius=0.0,
})=>Container(
  width: width,
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius)),
   child: MaterialButton(
     onPressed:function ,
    child: Text(
      isUpperCase ?text.toUpperCase():text,
      style: TextStyle(color: Colors.white,
    ),
  ),
    
  )
    
  
);