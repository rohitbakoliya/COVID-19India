
// import 'dart:math';
// import 'package:charts_flutter/src/text_style.dart' as style;
// import 'package:charts_flutter/src/text_element.dart' as textElement;
// import 'package:charts_flutter/flutter.dart' as charts;

// class CustomCircleSymbolRenderer extends charts.CircleSymbolRenderer {
//   String pointerValue;
//   CustomCircleSymbolRenderer({ this.pointerValue });
//   @override
//   void paint(charts.ChartCanvas canvas, Rectangle<num> bounds,{List<int> dashPattern,charts.Color fillColor,charts.FillPatternType fillPattern, charts.Color strokeColor,double strokeWidthPx}) {
//     super.paint(canvas, bounds, dashPattern: dashPattern,fillColor: fillColor,fillPattern: fillPattern, strokeColor: strokeColor,strokeWidthPx: strokeWidthPx);
//     canvas.drawRect(
//     Rectangle(bounds.left - 5, bounds.top - 30, bounds.width + 10,
//     bounds.height + 10),
//     fill: charts.Color.white);
//     var textStyle = style.TextStyle();
//     textStyle.color = charts.Color.black;
//     textStyle.fontSize = 15;
//     canvas.drawText(
//     textElement.TextElement(pointerValue, style: textStyle),
//     (bounds.left).round(),
//     (bounds.top - 28).round());
//   }
// }