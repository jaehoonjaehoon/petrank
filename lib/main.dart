import 'package:flutter/material.dart';
import 'package:petrank/screens/home_screen.dart';
import 'package:petrank/screens/ranking_screen.dart';
import 'package:petrank/screens/image_list_screen.dart';
import 'package:petrank/screens/growth_screen.dart';
import 'package:petrank/screens/my_pet_screen.dart';

void main() {
  runApp(PetRankApp());
}

class PetRankApp extends StatefulWidget {
  @override
  _PetRankAppState createState() => _PetRankAppState();
}

class _PetRankAppState extends State<PetRankApp> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    RankingScreen(), // 랭킹 페이지 추가
    ImageListScreen(),
    GrowthScreen(),
    MyPetScreen(),
    Container(),
    Container(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PetRank',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: Scaffold(
        body: _screens[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.brown,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
            BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: "랭킹"),
            BottomNavigationBarItem(
                icon: Icon(Icons.photo_library), label: "이미지"),
            BottomNavigationBarItem(icon: Icon(Icons.timeline), label: "성장기록"),
            BottomNavigationBarItem(icon: Icon(Icons.pets), label: "MyPet"),
          ],
        ),
      ),
    );
  }
}
