import 'package:covid_19/screens/home.dart';
import 'package:covid_19/service/service.dart';
import 'package:covid_19/utils/init_get_it.dart';
import 'package:covid_19/viewmodel/home_view_model.dart';
import 'package:covid_19/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:covid_19/constant.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main(){
  getIt.registerLazySingleton(() => DataService());
  HomeViewModel homeViewModel = HomeViewModel();
  homeViewModel.onAppStart().then((_){
    runApp(MyApp(homeViewModel));
  }).catchError((e){
    runApp(MyAppError());
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

class MyAppError extends StatefulWidget {

  @override
  _MyAppErrorState createState() => _MyAppErrorState();
}

class _MyAppErrorState extends State<MyAppError> {
  bool _loading = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "Poppins",
      ),
      home: Scaffold(
          key: _scaffoldKey,
          body: _loading ? _circularProgressIndicator(): Builder(
                builder:(context)=> SafeArea(
                child: Container(
                  margin: EdgeInsets.all(10),
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Oh no!",
                      textAlign: TextAlign.center,
                      style: kHeadingTextStyle.copyWith(fontSize: 24),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "No internet found. Check your connection",
                      textAlign: TextAlign.center,
                    ),

                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                      height: 43.0,
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                style: BorderStyle.solid,
                                width: 1.0
                            ),
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(20.0)),
                            child: GestureDetector(
                              child: Center(
                                child: Text(
                                  "Retry",
                                  style: kHeadingTextStyle,
                                ),
                              ),
                              onTap: retry
                            )
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 40),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.black,
                                  style: BorderStyle.solid,
                                  width: 1.0
                                ),
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(20.0)),
                                child: GestureDetector(
                                  onTap: () {
                                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                                  },
                                  child: Center(
                                    child: Text('Exit',
                                    style: kHeadingTextStyle
                                ),
                              )
                            )
                          ),
                        ],
                      )  
                    ),
                  ],
                    ),
                ),
            ),
          ),
      )
    );
  }

  Future<void> retry() async{
    setState(() {
      _loading = true;
    });
    HomeViewModel homeViewModel = HomeViewModel();
    homeViewModel.onAppStart().then((_){
      print('init');
      Navigator.pushReplacement(_scaffoldKey.currentContext, MaterialPageRoute(builder: (context)=> Home(data : homeViewModel.data)));
    }).catchError((e){
      setState(() {
        _loading = false;
      });
    });
  }
  Widget _circularProgressIndicator(){
    return Container(
      width : MediaQuery.of(_scaffoldKey.currentContext).size.width,
      height : MediaQuery.of(_scaffoldKey.currentContext).size.height,
      color: Colors.white,
      child: Center(
        child: SizedBox(
          height: 50,
          width: 50,
          child : CircularProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation(Colors.teal),
              strokeWidth: 3.0,
          )
        ),
      ),
    );
  }
}


