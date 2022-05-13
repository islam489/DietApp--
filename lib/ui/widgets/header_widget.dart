import 'package:diet_app/drawer/drawer_body.dart';
import 'package:diet_app/drawer/drawer_scafold.dart';
import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
   final bool arrowBack;
   final Function function;
   HeaderWidget({this.arrowBack = true,this.function});
  @override
  Widget build(BuildContext context) {
    GlobalKey<DrawerScaffoldState> _keyDrawer = GlobalKey<DrawerScaffoldState>();

    return  Padding(
      padding: EdgeInsets.only(top: 25),
      child: Row(
          children: [
            SizedBox(width:10),
            arrowBack
                ?
            Icon( Icons.arrow_back)
                :
            InkWell(
                onTap: function,
                child: Icon(
                  Icons.menu,
                  color: Colors.purple[200],
                )),
            Spacer(),
            Image.asset(
              "assets/images/header.png",
              height: 100,
              width: 200,
            ),
            Spacer(),
            SizedBox(width:25),
          ]
      ),
    );
      
  }
}
