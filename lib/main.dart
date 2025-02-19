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
    RankingScreen(),
    ImageListScreen(),
    GrowthScreen(),
    MyPetScreen(),
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
        // ✅ 그라데이션 배경 적용
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.brown.shade300, Colors.brown.shade500 // 하단 컬러 (연한 레드)
              ],
            ),
          ),
          child: Column(
            children: [
              // 🔹 공통 AppBar (PetRank 로고 + 검색 & 알림)
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "🐾 PetRank",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.search, color: Colors.black54),
                        SizedBox(width: 20),
                        Icon(Icons.notifications, color: Colors.black54),
                      ],
                    ),
                  ],
                ),
              ),

              // ✅ 현재 선택된 화면
              Expanded(child: _screens[_selectedIndex]),
            ],
          ),
        ),

        // ✅ 하단 네비게이션 바 (고급스러운 디자인 적용)
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                spreadRadius: 2,
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.brown,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.leaderboard), label: "랭킹"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.photo_library), label: "이미지"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.timeline), label: "성장기록"),
                BottomNavigationBarItem(icon: Icon(Icons.pets), label: "MyPet"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
