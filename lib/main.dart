import 'package:diet_app/bloc/carousel_bloc/carousel_cubit.dart';
import 'package:diet_app/bloc/login_bloc/login_cubit.dart';
import 'package:diet_app/bloc/package_bloc/package_cubit.dart';
import 'package:diet_app/repo/Carousel/carousel_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'repo/auth/login.dart';
import 'ui/main_screens/login_Screen.dart';

void main() {
 // CarouselRepo.fetchCarouselList();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(create: (context) => PackageCubit()),
        BlocProvider(create: (context) => CarouselCubit()),


      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.purple[200],
          appBarTheme: AppBarTheme(color: Colors.purple[200]),

          textTheme: TextTheme(headline3: TextStyle(fontSize: 25,color: Colors.white))

        ),
       home: LoginScreen(),
       /* initialRoute: LoginScreen.route,*/
       /* routes: {
          LoginScreen.route: (context) => LoginScreen(),
        },*/
      ),
    );
  }
}

