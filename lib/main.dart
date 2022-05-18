import 'package:auto_size_text/auto_size_text.dart';
import 'package:fancy_cursor/fancy_cursor.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:show_up_animation/show_up_animation.dart';
import 'dart:js' as js;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'SeriAmigo | A beautiful way to create the memories',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FancyCursor(
          color: Colors.yellow,
          trailColor: Colors.white.withOpacity(0.4),
          child: const MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xff5B16D0),
                  Color(0xff5036D5),
                  Color(0xff4563DB),
                  Color(0xff359DDD)
                ].reversed.toList())),
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 30.0,
                    ),
                    ShowUpAnimation(
                       delayStart: Duration(seconds: 1),
                      animationDuration: Duration(milliseconds: 1100),
                      curve: Curves.elasticInOut,
                      direction: Direction.vertical,
                      offset: 1,
                      child: Image.asset('images/logo.png',
                          scale: 5.5, fit: BoxFit.contain),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        'SeriAmigo',
                        maxLines: 1,
                        style: TextStyle(
                            fontFamily: 'BonaNova',
                            color: Colors.white,
                            fontSize: Theme.of(context)
                                .textTheme
                                .headline2
                                ?.fontSize),
                      ),
                    ),
                    SizedBox(
                      height: 90,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        'Revolutionizing the student\'s college life',
                        maxLines: 1,
                        style: GoogleFonts.caveat(
                            color: Colors.white,
                            fontSize:
                                Theme.of(context).textTheme.headline6?.fontSize,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: SizedBox(
                        width: width /
                            (width < 400
                                ? 1.2
                                : width > 1000
                                    ? 2
                                    : 1.5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.instagram,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                js.context.callMethod('open',
                                    ['https://www.instagram.com/seriamigo/']);
                              },
                            ),
                            IconButton(
                              icon: FaIcon(
                                Icons.facebook,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                js.context.callMethod('open',
                                    ['https://www.facebook.com/seriamigo2']);
                              },
                            ),
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.twitter,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                js.context.callMethod(
                                    'open', ['https://twitter.com/seriamigo']);
                              },
                            ),
                            IconButton(
                              icon: FaIcon(
                                FontAwesomeIcons.youtube,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                js.context.callMethod('open', [
                                  'https://www.youtube.com/channel/UC8DAvp3ZyhpipkGcnzBiO_g'
                                ]);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText(
                        '© SERIAMIGO PRIVATE LIMITED 2022',
                        maxLines: 1,
                        style: Theme.of(context)
                            .textTheme
                            .caption
                            ?.copyWith(color: Colors.grey.shade200),
                      ),
                    ),
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
