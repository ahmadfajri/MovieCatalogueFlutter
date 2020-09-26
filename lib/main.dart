import 'package:flutter/material.dart';
import 'package:movie_catalogue/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Catalogue',
      theme: ThemeData.dark(),
      home: MainScreen(),
    );
  }
}