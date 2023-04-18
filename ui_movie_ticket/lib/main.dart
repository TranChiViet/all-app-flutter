import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'config/config_export.dart';
import 'screens/home.dart';
import 'screens/select_cinema.dart';
import 'screens/select_seat.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.dark));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'montserrat',
        scaffoldBackgroundColor: DarkTheme.darkerBackground,
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: DarkTheme.white,
              displayColor: DarkTheme.white,
            ),
      ),
      home: const 
      HomeScreen(),
      // SelectCinemaScreen(),
      // SelectSeatScreen()
    );
  }
}
