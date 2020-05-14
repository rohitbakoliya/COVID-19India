import 'package:covid_19/screens/developers_page.dart';
import 'package:covid_19/screens/faqs.dart';
import 'package:covid_19/screens/home.dart';
import 'package:covid_19/screens/india_helplines.dart';
import 'package:covid_19/screens/info.dart';
import 'package:covid_19/screens/protect_yourself.dart';
import 'package:covid_19/screens/transmission.dart';
import 'package:flutter/material.dart';
class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // DrawerHeader(
          //   child: Image.asset('assets/images/steps.png'),
          //   decoration: BoxDecoration(
          //     color: Colors.transparent,
          //   ),
          // ),
          ListTile(
            trailing: Icon(Icons.arrow_right),
            title: Text('Home & Case Update'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(context , MaterialPageRoute(builder: (context){return Home();}));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_right),
            title: Text('Symptoms & Preventions'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context , MaterialPageRoute(builder: (context){return Info();}));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_right),
            title: Text('Protect Yourself & Others'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context , MaterialPageRoute(builder: (context){return ProtectYourself();}));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_right),
            title: Text('Trasmission of Covid-19'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context , MaterialPageRoute(builder: (context){return TransmissionOfCovid();}));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_right),
            title: Text('FAQ\'s'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context , MaterialPageRoute(builder: (context){return FAQs();}));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_right),
            title: Text('Covid-19 Help'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context , MaterialPageRoute(builder: (context){return IndiaHelplines();}));
            },
          ),
          ListTile(
            trailing: Icon(Icons.arrow_right),
            title: Text('Developers page'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(context , MaterialPageRoute(builder: (context){return DevelopersPage();}));
            },
          ),
        ],
        ),
      ),
    );
  }
}