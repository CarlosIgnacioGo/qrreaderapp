import 'package:flutter/material.dart';

import 'package:qrreaderapp/scr/pages/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'QRScanner',
      initialRoute: 'home',
      routes: {
        'home' : (BuildContext context) => HomePage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple
      ),
    );
  }
}

