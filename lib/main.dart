import 'package:flutter/material.dart';
import 'package:petrank/screens/home_screen.dart';

void main() {
  runApp(PetRankApp());
}

class PetRankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PetRank',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
    );
  }
}
