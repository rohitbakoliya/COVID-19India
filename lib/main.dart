import 'package:covid_19/service/service.dart';
import 'package:covid_19/utils/init_get_it.dart';
import 'package:covid_19/viewmodel/home_view_model.dart';
import 'package:covid_19/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/constant.dart';
import 'package:provider/provider.dart';

void main(){
  getIt.registerLazySingleton(() => DataService());
  HomeViewModel homeViewModel = HomeViewModel();
  homeViewModel.onAppStart().then((_){
    runApp(MyApp(homeViewModel));
  });
}

class MyApp extends StatelessWidget {
  final HomeViewModel homeViewModel;

  const MyApp(this.homeViewModel);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
      ),
      home: Provider(
        create: (context) => homeViewModel,
        builder: (context)=> homeViewModel,
        child: Wrapper(),
      ) 
    );
  }
}
