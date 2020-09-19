import 'package:covid_19/constant.dart';
import 'package:covid_19/widgets/app_drawer.dart';
import 'package:covid_19/widgets/myheader.dart';
import 'package:flutter/material.dart';
class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  final controller = ScrollController();
  double offset = 0;
  
  @override
  void initState() {
    super.initState();
    controller.addListener(onScroll);
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: AppDrawer(),
      body: Builder(
      builder: (context)=>
      SingleChildScrollView(
          controller: controller,
          child: Column(
          children: <Widget>[
            MyHeader(
              image: "assets/icons/coronadr.svg",
              textTop: "Get to know",
              textBottom: "About COVID-19",
              appBarHeight: MediaQuery.of(context).padding.top,
              // scaffoldContextKey: scaffoldKey,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  
                  Text(
                    "Symptoms",
                    style: kTitleTextstyle,
                  ),
                  SizedBox(height: 10),
                  RichText(
                    text: TextSpan(
                      text: 'The most common symptoms of COVID-19 are ',
                      style: TextStyle(
                        color: kBodyTextColor.withOpacity(.95),
                        fontFamily: "Poppins"
                      ),
                      children: <TextSpan>[
                        TextSpan(text: 'fever, tiredness, and dry cough.', style: TextStyle(fontWeight: FontWeight.w700)),
                        TextSpan(text: ' Some patients may have aches and pains, nasal congestion, runny nose, sore throat or diarrhoea. These symptoms are usually mild and begin gradually. Also the '),
                        TextSpan(text: 'symptoms may appear 2-14 days ' , style: TextStyle(fontWeight: FontWeight.w700)),
                        TextSpan(text: 'after exposure.')
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Image.asset('assets/images/header-a.png'),
                  SizedBox(height: 20),
                  Text(
                    "Major & Common Symptoms",
                    style: kTitleTextstyle.copyWith(color : Colors.black38),
                  ),
                  SizedBox(height: 10),
                  //Symptoms
                  customCard(
                    image: 'assets/images/covid-symptom-fever.png',
                    text: 'This means you feel hot to touch on your chest or back (you do not need to measure your temperature). It is a common sign and also may appear in 2-10 days if you are affected.',
                    title: 'Fever',
                  ),
                  customCard(
                    image: 'assets/images/covid-symptom-cough.png',
                    text: 'This means coughing a lot for more than an hour, or 3 or more coughing episodes in 24 hours (if you usually have a cough, it may be worse than usual).',
                    title: 'Cough',
                  ),
                  customCard(
                    image: 'assets/images/covid-symptom-breath.png',
                    text: 'Around 1 out of every 6 people who gets COVID-19 becomes seriously ill and develops difficulty breathing or shortness of breath.',
                    title: 'Shortness of breath',
                  ),
                  SizedBox(height: 20),
                  //Prevention
                  Text("Prevention" , style: kTitleTextstyle),
                  SizedBox(height: 20),
                  customCard(
                    image: "assets/images/covid-prevent-washing.png",
                    title: "Wash your hands",
                    text: "Regularly and thoroughly clean your hands with an alcohol-based hand rub or wash them with soap and water for at least 20 seconds.",
                  ),
                  customCard(
                    image: "assets/images/covid-prevent-distance.png",
                    title: "Maintain social distancing",
                    text: "Maintain at least 1 metre (3 feet) distance between yourself & anyone who is coughing or sneezing. If you are too close, you get chance to get infected.",
                  ),
                  customCard(
                    image: "assets/images/covid-prevent-touch.png",
                    title: "Avoid touching face",
                    text: "Do not touch your eyes, nose or mouth if your hands are not clean.",
                  ),
                  customCard(
                    image: "assets/images/covid-prevent-hygiene.png",
                    title: "Practice respiratory hygiene",
                    text: "Make sure you & the people around you, follow good respiratory hygiene. This means covering your mouth & nose with tissue when you cough or sneeze.",
                  ),
                  SizedBox(height: 50),
                ]
              )
            )
          ],
        ),
      ),
    )
    );
  }

  Widget customCard({String image , String title , String text} ){
    return Padding(
      padding: const EdgeInsets.only(bottom : 10.0),
        child: SizedBox(
          height: 216,
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              Container(
                height: 196,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 24,
                      color: kShadowColor
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                backgroundImage :AssetImage(image),
                backgroundColor: Colors.transparent,
                  maxRadius: 60,
                ),
              ),
              Positioned(
                left: 130,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:20, vertical: 15),
                  height: 210,
                  width: MediaQuery.of(context).size.width - 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        title, 
                        style: kTitleTextstyle.copyWith(fontSize : 14),
                      ),
                      // Expanded(
                      //   child: 
                        Text(
                          text,
                          maxLines: 8,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      // ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }
}
