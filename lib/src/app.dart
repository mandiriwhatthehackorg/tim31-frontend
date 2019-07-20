import 'package:flutter/services.dart';
import 'package:hepengta/src/ui/pages/main_page.dart';
import 'package:hepengta/src/ui/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class App extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF003D79)
    ));
    
    return MaterialApp(
      title: 'Diori',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: "Myriad"
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new MainPage()
      },
    );
  }
}