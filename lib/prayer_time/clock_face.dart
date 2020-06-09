import 'package:flutter/material.dart';

import 'clock_text.dart';

class ClockFace extends StatelessWidget {
  final DateTime dateTime;
  final ClockText clockText;

  ClockFace({this.clockText = ClockText.arabic, this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: new AspectRatio(
              aspectRatio: 0.75,
              child: new Container(
                width: double.infinity,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xfff4f9fd),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(8.0, 0),
                          blurRadius: 13,
                          spreadRadius: 1,
                          color: Color(0xFF43a49))
                    ]),
              ),
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.transparent),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: 120
              ),
              child: ShaderMask(
                child: Text("الله أكبر‎", style: TextStyle(
                    color: Color(0xff2d386b),
                    fontSize: 40,
                    fontWeight: FontWeight.w100,
                    fontFamily: 'AbrilFatface'
                ),

                ),
                shaderCallback: (rect) {
                  return RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1.0,
                    tileMode: TileMode.mirror,
                    colors: [
                      Colors.black,
                      Colors.black,
                      Colors.black,
                    ],
                  ).createShader(rect);
                },
                blendMode: BlendMode.srcATop,
              ),
            ),
          ),
        )
      ],
    );
  }
}
