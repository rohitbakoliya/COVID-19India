import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/app_drawer.dart';
import 'package:covid_19/widgets/myheader.dart';
import 'package:flutter/material.dart';
class ProtectYourself extends StatefulWidget {
  @override
  _ProtectYourselfState createState() => _ProtectYourselfState();
}

class _ProtectYourselfState extends State<ProtectYourself> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      body: Builder(
          builder: (context)=>SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyHeader(
                image: 'assets/images/steps.png',
                textBottom: '',
                textTop: '',
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Protect Yourself',
                      style: kTitleTextstyle,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'The best thing you can do now is plan for how you can adapt your daily routine. Take few steps to protect yourself as Clean your hands often, avoid close contact, cover coughs and sneezes, clean daily used surfaces etc. The best way to prevent illness is to avoid being exposed to this virus.'
                     , style: TextStyle(
                       color: kBodyTextColor.withOpacity(.95),
                     ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '• Use face mask',
                      style: kSubTextStyle
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      'assets/images/protect.png',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Self Care',
                      style: kTitleTextstyle.copyWith(color : Colors.black38),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'If you have mild symptoms, stay at home until you’ve recovered. You can relieve your symptoms if you:'
                      , style: TextStyle(
                       color: kBodyTextColor.withOpacity(.95),
                     ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left : 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          
                          Text(
                            '• Rest and sleep',
                            style: TextStyle(
                              color: kBodyTextColor.withOpacity(.95),
                            ),
                          ),
                          Text(
                            '• Keep warm',
                            style: TextStyle(
                              color: kBodyTextColor.withOpacity(.95),
                            ),
                          ),
                          Text(
                            '• Drink plenty of liquids',
                            style: TextStyle(
                              color: kBodyTextColor.withOpacity(.95),
                            ),
                          ),
                          Text(
                            '• Use a room humidifier or take a hot shower to help ease a sore throat and cough',
                            style: TextStyle(
                              color: kBodyTextColor.withOpacity(.95),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Medical Treatments',
                      style: kTitleTextstyle.copyWith(color : Colors.black38),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'If you develop a fever, cough, and have difficulty breathing, promptly seek medical care. Call in advance and tell your health provider of any recent travel or recent contact with travellers.'
                      , style: TextStyle(
                       color: kBodyTextColor.withOpacity(.95),
                     ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Take Steps to Protect Others',
                      style: kTitleTextstyle,
                    ),
                    SizedBox(height: 10),                    
                    ListTile(
                      leading: Icon(Icons.check_circle , color: Color.fromRGBO(61, 202, 147, 1.0)),
                      title: Text('Stay home if you’re sick'),
                      subtitle: Text('– Stay home if you are sick, except to get medical care.'),
                    ),
                    ListTile(
                      leading: Icon(Icons.check_circle , color: Color.fromRGBO(61, 202, 147, 1.0)),
                      title: Text('Cover your mouth and nose'),
                      subtitle: Text('- with a tissue when you cough or sneeze (throw used tissues in the trash) or use the inside of your elbow.'),
                    ),
                    ListTile(
                      leading: Icon(Icons.check_circle , color: Color.fromRGBO(61, 202, 147, 1.0)),
                      title: Text('Wear a facemask if you are sick'),
                      subtitle: Text('– You should wear a facemask when you are around other people (e.g., sharing a room or vehicle) and before you enter a healthcare provider’s'),
                    ),
                    ListTile(
                      leading: Icon(Icons.check_circle , color: Color.fromRGBO(61, 202, 147, 1.0)),
                      title: Text('Clean and disinfect frequently touched surfaces daily'),
                      subtitle: Text('– This includes phones, tables, light switches, doorknobs, countertops, handles, desks, toilets, faucets, and sinks.'),
                    ),
                    ListTile(
                      leading: Icon(Icons.check_circle , color: Color.fromRGBO(61, 202, 147, 1.0)),
                      title: Text('Clean the dirty surfaces'),
                      subtitle: Text('Use detergent or soap and water prior to disinfection.'),
                    ),
                    ListTile(
                      leading: Icon(Icons.check_circle , color: Color.fromRGBO(61, 202, 147, 1.0)),
                      title: Text('Stay informed about the local COVID-19 situation'),
                      subtitle: Text('– Get up-to-date information about local COVID-19 activity from public health officials.'),
                    ),
                    
                    ListTile(
                      leading: Icon(Icons.check_circle , color: Color.fromRGBO(61, 202, 147, 1.0)),
                      title: Text('Dedicated, lined trash can'),
                      subtitle: Text('– If possible, dedicate a lined trash can for the ill person. Use gloves when removing garbage bags, and handling & disposing of trash.'),
                    ),
                    SizedBox(height: 50),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}