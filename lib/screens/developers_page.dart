import 'package:covid_19/widgets/app_drawer.dart';
import 'package:covid_19/widgets/myheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class DevelopersPage extends StatefulWidget {
  @override
  _DevelopersPageState createState() => _DevelopersPageState();
}

class _DevelopersPageState extends State<DevelopersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      body: Builder(
        builder: (context)=>SingleChildScrollView(
          child: Column(
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
                                  padding: EdgeInsets.symmetric(horizontal : 20, vertical: 10),
                                  decoration: BoxDecoration(color: Colors.brown),
                                  child: SvgPicture.asset("assets/icons/menu.svg")
                                )
                              ),
                          ),
                      ),
                      ListTile(
                        leading: Icon(Icons.lightbulb_outline, color: Colors.white,),
                        title: Text('Handcrafted by' , style: TextStyle(color: Colors.white)),
                        subtitle: Text('Rohit Bakoliya' , style: TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: Image.asset(
                          'assets/images/github-logo.png',
                          width: 24.0,
                          height: 24.0,
                        ),
                        title: Text('@rohitbakoliya' , style: TextStyle(color: Colors.white)),
                        onTap: ()=>_launchURL('https://github.com/rohitbakoliya'),
                      ),
                      ListTile(
                        leading: Icon(Icons.code , color : Colors.white),
                        title:  Text('Souce Code' , style: TextStyle(color: Colors.white)),
                        onTap: ()=>_launchURL('https://github.com/rohitbakoliya'),
                        subtitle: Text('It is a open source project.' , style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                leading: Icon(Icons.star),
                title: Text(
                  'Rate',
                  style : TextStyle(
                    fontSize: 20
                  )
                ),
                onTap: (){
                  //Launch Review
                },
              ),
              ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                leading: Icon(Icons.share),
                title: Text(
                  'Share',
                  style : TextStyle(
                    fontSize: 20
                  )
                ),
                onTap: (){
                  final RenderBox box = context.findRenderObject();
                  Share.share(
                    'Stay Updated with COVID19!\nI recommend __THISAPP__ to fight against COVID-19. Please download and share it using this link:\nhttps://play.google.com/store/apps/details?id=com.rohitbakoliya.covid_19'
                  , subject: '#IndiaFightsCORONA',
                  sharePositionOrigin:
                  box.localToGlobal(Offset.zero) &
                  box.size);
                },
              ),
              ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                leading: Icon(Icons.alternate_email),
                title: Text(
                  'Contact Us',
                  style : TextStyle(
                    fontSize: 20
                  )
                ),
                onTap: (){
                  //Contact Us
                  _launchURL('mailto:contact@rohitbakoliya.com');
                },
              ),
              ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                leading: Icon(Icons.bug_report),
                title: Text(
                  'Report a bug',
                  style : TextStyle(
                    fontSize: 20
                  )
                ),
                onTap: (){
                  //Report a bug
                  _launchURL('mailto:contact@rohitbakoliya.com?subject=For%20Reporting%20a%20Bug&body=<strong>NOTE:%20Please%20do%20not%20change%20the%20initial%20subject%20in%20order%20to%20find%20out%20it%20is%20a%20bug%20reporting%20email.<strong/><br>');
                },
              ),
              ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                leading: Icon(Icons.wb_cloudy),
                title: Text(
                  'Covid19 India API',
                  style : TextStyle(
                    fontSize: 20
                  )
                ),
                onTap: ()=>_launchURL('https://api.covid19india.org/'),
              ),
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