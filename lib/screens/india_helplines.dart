import 'package:covid_19/widgets/app_drawer.dart';
import 'package:covid_19/widgets/myheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
class IndiaHelplines extends StatefulWidget {
  @override
  _IndiaHelplinesState createState() => _IndiaHelplinesState();
}

class _IndiaHelplinesState extends State<IndiaHelplines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      body: Builder(
        builder: (context)=>SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  padding: EdgeInsets.only(left: 40, top: MediaQuery.of(context).padding.top + 5, right: 10),
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
                  ),
                  child: Column(
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
                                  // decoration: BoxDecoration(color: Colors.brown),
                                  padding: EdgeInsets.symmetric(horizontal : 20, vertical: 10),
                                  child: SvgPicture.asset("assets/icons/menu.svg")
                                )
                              ),
                          ),
                      ),
                      SizedBox(height: 20),
                      Text('#IndiaFightsCorona'  , style: TextStyle(color: Colors.white , fontSize: 18),),
                      Text('Lets Fight Together!!!' , style: TextStyle(color: Colors.white),),
                      Expanded(
                          child: Image.asset(
                          'assets/images/fight-corona.png',
                          alignment: Alignment.bottomCenter,
                          height: 230,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ],
                  ),
                )
              ),
              ListTile(
                leading: Icon(Icons.phone),
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('Helpline Number'),
                subtitle: Text('+91-11-23978046'),
                onTap: ()=> _launchURL('tel:+91-11-23978046'),
              ),
              ListTile(
                leading: Icon(Icons.email),
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('Helpline Email ID'),
                subtitle: Text('ncov2019@gov.in'),
                onTap: ()=> _launchURL('mailto:ncov2019@gov.in'),
              ),
              ListTile(
                leading: Icon(Icons.phone),
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('Toll Free'),
                subtitle: Text('1075'),
                onTap: ()=> _launchURL('tel:1075'),
              ),
              ListTile(
                leading: Icon(Icons.help),
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('State & Union Terrories'),
                subtitle: Text('View PDF'),
                onTap: ()=>_launchURL('https://www.mohfw.gov.in/pdf/coronvavirushelplinenumber.pdf'),
              ),
              ListTile(
                leading: Image.asset('assets/images/rupee-icon.png'),
                trailing: Icon(Icons.keyboard_arrow_right),
                title: Text('Donate to PM Cares'),
                subtitle: Text('Via Website'),
                onTap: ()=>_launchURL('https://www.pmcares.gov.in/en?should_open_safari=true'),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}