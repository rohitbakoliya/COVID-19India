import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/app_drawer.dart';
import 'package:covid_19/widgets/myheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class TransmissionOfCovid extends StatefulWidget {
  @override
  _TransmissionOfCovidState createState() => _TransmissionOfCovidState();
}

class _TransmissionOfCovidState extends State<TransmissionOfCovid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      endDrawer: AppDrawer(),
      body: Builder(
          builder: (context)=>SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  padding: EdgeInsets.only(left: 40, top: 30, right: 10),
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF3383CD),
                        Color(0xFF11249F)
                      ]
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/virus.png"),
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                          Tooltip(
                            message: MaterialLocalizations.of(context).openAppDrawerTooltip,
                              child: Align(
                              alignment: Alignment.topRight,
                                child: InkWell(
                                onTap: (){
                                  Scaffold.of(context).openEndDrawer();
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal : 20, vertical: 10),
                                  decoration: BoxDecoration(color: Colors.brown),
                                  child: SvgPicture.asset("assets/icons/menu.svg")
                                )
                              ),
                            ),
                      ),
                      SizedBox(height: 20),
                      Image.asset(
                        'assets/images/protect.png',
                        width: 300,
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fitWidth,
                      ),
                      // Expanded(
                      //   child: Stack(
                      //     children: <Widget>[
                            
                      //       Positioned(
                      //       top: 15,
                      //       left: 200,
                      //         child: Text(
                      //           "Always wear\n  a Mask!" ,
                      //           style : kHeadingTextStyle.copyWith(color : Colors.white, fontSize: 18)
                      //           ),
                      //       ),
                      //       Container(),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Transmission of Covid-19',
                      style : kTitleTextstyle
                    ),
                    SizedBox(height: 10),
                    Text(
                        'Droplets that from infected person coughs or sneezes\' to Droplets from when an infected person coughs or sneezes.'
                       , style: TextStyle(
                         color: kBodyTextColor.withOpacity(.95),
                       ),
                    ),
                    TransmissionCard(
                      image: 'assets/images/spread-a.png',
                      title: 'Person-to-person spread as close contact with infected',
                      subtitle: 'The coronavirus is thought to spread mainly from person to person. This can happen between people who are in close contact with one another.',
                    ),
                    TransmissionCard(
                      image: 'assets/images/spread-b.png',
                      title: 'Touching or contact with infected surfaces or objects',
                      subtitle: 'A person can get COVID-19 by touching a surface or object that has the virus on it and then touching their own mouth, nose, or possibly their eyes.',
                    ),
                    TransmissionCard(
                      image: 'assets/images/spread-c.png',
                      title: 'Droplets that from infected person coughs or sneezes',
                      subtitle: 'The coronavirus is thought to spread mainly from person to person. This can happen between people who are in close contact with one another.',
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,)
            ],
          ),
        ),
      ),
    );
  }
}

class TransmissionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;
  const TransmissionCard({
    Key key, this.title, this.subtitle, this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 30,
              color: kShadowColor,
            ),
          ]
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              image,
              fit: BoxFit.fitWidth,
              alignment: Alignment.topCenter,
            ),
            Divider(
            height: 0,
            thickness: 4,
            color: Color.fromRGBO(156, 194, 247, 1.0),),
            SizedBox(height: 10,),
            ListTile(
              title: Text(title),
              subtitle: Text(subtitle),
            ),
          ],
        ),
    );
  }
}