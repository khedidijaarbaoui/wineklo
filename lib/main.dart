import 'package:flutter/material.dart';
import 'package:wineklo/views/screens/food_managment/restaunavbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: userNavBar(), // Set the navigation bar as the home screen
    );
  }
}
