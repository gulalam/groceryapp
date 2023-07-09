import 'package:flutter/material.dart';
import 'homePage/home_page.dart';

// import 'package:grocery_app/variables.dart';
// flutter awesome snipits
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePageState());
  }
}
