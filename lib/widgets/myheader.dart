import 'package:covid_19/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  final double appBarHeight;
  const MyHeader({
    Key key, this.image, this.textTop, this.textBottom, this.appBarHeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: this.appBarHeight + 5, right: 10),
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //NOte : it is not working without Builder
            //https://stackoverflow.com/questions/51957960/how-to-change-the-enddrawer-icon-in-flutter
            // Builder(
            //   builder: (context)=>
                Tooltip(
                    message: MaterialLocalizations.of(context).openAppDrawerTooltip,
                    child: Align(
                    alignment: Alignment.topRight,
                      child: InkWell(
                      onTap: (){
                        // scaffoldContextKey.currentState.openEndDrawer();
                        Scaffold.of(context).openEndDrawer();
                        // print(Scaffold.hasDrawer(context));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal : 20, vertical: 10),
                        decoration: BoxDecoration(color: Colors.brown),
                        child: SvgPicture.asset("assets/icons/menu.svg")
                      )
                    ),
                  ),
                // ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Stack(
                children: <Widget>[
                 image.contains('.svg')==true ?  SvgPicture.asset(
                    image,
                    width: 230,
                    fit: BoxFit.fitWidth,
                    alignment: Alignment.topCenter,
                  ):
                  Image.asset(
                    image,
                    width: 230,
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    top: 15,
                    left: 150,
                    child: Text(
                      "$textTop \n$textBottom" ,
                      style : kHeadingTextStyle.copyWith(color : Colors.white, fontSize: 18)
                      ),
                  ),
                  Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width/2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }

}