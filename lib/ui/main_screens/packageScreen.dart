import 'package:carousel_slider/carousel_slider.dart';
import 'package:diet_app/bloc/carousel_bloc/carousel_cubit.dart';
import 'package:diet_app/bloc/package_bloc/package_cubit.dart';
import 'package:diet_app/drawer/drawer_body.dart';
import 'package:diet_app/drawer/drawer_scafold.dart';
import 'package:diet_app/models/carousel_model.dart';
import 'package:diet_app/ui/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PackageScreen extends StatefulWidget {

  @override
  _PackageScreenState createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  bool isEmpty=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final membershipitemcubit = BlocProvider.of<PackageCubit>(context);
    final carouselcubit = BlocProvider.of<CarouselCubit>(context);
    carouselcubit.fetchCarouselList(context);
    membershipitemcubit.fetchPackagesList(context);
  }
  Widget build(BuildContext context) {
    GlobalKey<DrawerScaffoldState> _keyDrawer = GlobalKey<DrawerScaffoldState>();

    return DrawerScaffold(
      key: _keyDrawer,
      drawer: AppDrawer(),
      child: Scaffold(
       // key: _keyDrawer,
        body: Column(
          children: [
              HeaderWidget(
                arrowBack: false,
                function: (){
                print("hhhhhhhh");
                _keyDrawer.currentState.openCloseDrawer();
              },),
            SizedBox(height: 10,),
            Expanded(
              child: BlocBuilder<CarouselCubit,CarouselState>(
                builder: (context,state){
                  if(state is CarouselLoading){
                    return Center(child: CircularProgressIndicator());
                  }else if(state is CarouselLoaded){
                    print(state.carouselstate.length);
                    return Container(
                      height: 100,
                      width: MediaQuery.of(context).size.width * .97,
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                            autoPlay: true,
                            disableCenter: false,
                            reverse: true,
                            viewportFraction: 1,
                            aspectRatio: 1.5,
                            autoPlayInterval: Duration(seconds: 3),

                          ),
                          itemCount: state.carouselstate.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                              int pageViewIndex) =>
                              Image.network(
                                state.carouselstate[itemIndex].imagePath,
                                fit: BoxFit.cover,
                                //width: double.infinity,
                                height: 150,
                              ),
                        ));

                  }
                  return Container();

                },
              ),
            ),
            SizedBox(height: 5,),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: BlocBuilder<PackageCubit,PackageState>(
                    builder: (context,state){
                      if(state is PackageLoading){
                        return Center(child: CircularProgressIndicator());
                      }else if(state is PackageLoaded){
                        print("state.membershipitemstate.length");
                        print(state.membershipitemstate.length);
                        return ListView.builder(
                            itemCount: state.membershipitemstate.length,
                            itemBuilder: (context,index){

                              return  Card(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                shape: RoundedRectangleBorder(
                                  //borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.purple[200])),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.membershipitemstate[index].nameAr == null
                                                  ? ''
                                                  :  state.membershipitemstate[index].nameEn,
                                              style: TextStyle(
                                                color: Colors.purple,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                            SizedBox(height: 7),
                                            Text(
                                              '${ state.membershipitemstate[index].duration} Days ' ==
                                                  null
                                                 ? ''
                                                  : '${ state.membershipitemstate[index].duration} Days',
                                              style: TextStyle(
                                                color: Colors.purple,
                                                fontSize: 18,
                                              ),
                                            ),
                                            SizedBox(height: 7),
                                            Text(
                                              '${ state.membershipitemstate[index].price} KD ' ==
                                                  null
                                                  ? ''
                                                  : '${ state.membershipitemstate[index].price} KD',
                                              style: TextStyle(
                                                color: Colors.purple,
                                                fontSize: 18,
                                              ),
                                            ),
                                          ],
                                        ),
                                        state.membershipitemstate[index].image == null
                                            ? Container()
                                            : Image.network( state.membershipitemstate[index].image,
                                            height: 165, width: 75),
                                      ],
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: RaisedButton(
                                          color: Colors.purple[200],
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(25.0),
                                          ),
                                          padding: EdgeInsets.symmetric(
                                            vertical: 10.0,
                                            horizontal: 15.0,
                                          ),
                                          child: Text(
                                            "Join",
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {}),
                                    ),
                                    SizedBox(height: 10),
                                  ],
                                ),
                              ); ;
                            });
                      }
                      return Container();
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


