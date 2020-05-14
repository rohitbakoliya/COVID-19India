import 'package:flutter/material.dart';
class Dots extends StatelessWidget {
  final double radius;
  final double opaticy;
  const Dots({Key key, this.radius, this.opaticy}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: radius,
      height: radius,
      decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.red.withOpacity(opaticy)
      )
    );
  }
}