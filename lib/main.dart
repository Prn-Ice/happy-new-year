import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'r.dart';
import 'rotate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Shader goldGradient = LinearGradient(
    colors: <Color>[Color(0xffD2712B), Color(0xffF7983E)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  final Shader silverGradient = LinearGradient(
    colors: <Color>[
      Color(0xff4E4E50),
      Color(0xff989898),
    ],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  var crossFadeState2 = CrossFadeState.showFirst;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 10)).then((value) {
      setState(() {
        print('done');
        crossFadeState2 = CrossFadeState.showSecond;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> names = [
      'mom',
      'dad',
      'rejoice',
      'miracle',
      'ayo',
      'abba',
      'isaac',
      'wale',
      'PG',
      'mayowa',
      'croft baby',
      'ay money',
      'clinto baba',
      'sadam',
      'all my friends and family',
    ];
    for (int i = 0; i < names.length; i++) {
      names[i] = names[i].toUpperCase();
    }

    var preLoader = Center(
      child: Image.asset(R.assetsImgFireworks),
    );

    double fontSize = 50;
    var main = Container(
      child: Stack(
        children: <Widget>[
          SvgPicture.asset(
            R.assetsImgBg,
            fit: BoxFit.fill,
          ),
          Positioned(
            right: 0,
            child: Image.asset(
              R.assetsImg2020,
              height: 500,
            ),
          ),
          Positioned(
            top: 20,
            child: Image.asset(R.assetsImgTwinkleBig),
            height: 90,
          ),
          Positioned(
            top: 20,
            right: 10,
            child: Image.asset(R.assetsImgTwinkleBig),
            height: 90,
          ),
          Positioned(
            left: 25,
            bottom: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ColorizeAnimatedTextKit(
                  text: [
                    'Happy',
                    'Happy',
                    'Happy',
                    'Happy',
                    'Happy',
                    'Happy',
                    'Happy',
                    'Happy',
                  ],
                  textStyle: GoogleFonts.dancingScript(
                      fontSize: fontSize,
                      textStyle: TextStyle(
                          foreground: Paint()..shader = silverGradient)),
                  speed: Duration(seconds: 1),
                  totalRepeatCount: 5,
                  colors: [
                    Color(0xffBDBDBD),
                    Color(0xffEEECED),
                  ],
                ),
                Text(
                  'New\nYear',
                  style: GoogleFonts.workSans(
                      fontSize: fontSize, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Positioned(
            right: 30,
            bottom: -24,
            child: Container(
              width: 150,
              height: 120,
              child: RotateAnimatedText(
                totalRepeatCount: 5,
                transitionHeight: 120,
                onTap: () {
                  print("Tap Event");
                },
                text: names,

                textStyle: GoogleFonts.titilliumWeb(
                    fontSize: fontSize - 14,
                    textStyle:
                        TextStyle(foreground: Paint()..shader = goldGradient),
                    fontWeight: FontWeight.bold),
                alignment:
                    AlignmentDirectional.bottomEnd, // or Alignment.topLeft
              ),
            ),
          ),
        ],
      ),
    );

    var splash = Center(
      child: Image.asset(R.assetsImgTwinkleSmall),
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedCrossFade(
        firstChild: preLoader,
        secondChild: main,
        duration: Duration(seconds: 1),
        crossFadeState: crossFadeState2,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
