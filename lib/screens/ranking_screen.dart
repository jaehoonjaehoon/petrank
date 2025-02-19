import 'package:flutter/material.dart';
import 'dart:math';

class RankingScreen extends StatefulWidget {
  @override
  _RankingScreenState createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen> {
  // 🔹 TOP 10 인기 반려동물 데이터
  final List<Map<String, dynamic>> pets = [
    {
      "image": "assets/pet1.png",
      "name": "루루 (골든리트리버)",
      "description": "사랑스러운 미소와 따뜻한 성격",
      "likes": 150,
      "comments": 30,
    },
    {
      "image": "assets/pet2.png",
      "name": "초코 (푸들)",
      "description": "활발하고 애교 많은 강아지",
      "likes": 120,
      "comments": 25,
    },
    {
      "image": "assets/pet3.png",
      "name": "구름이 (스코티시 폴드)",
      "description": "똘망똘망한 눈망울을 가진 고양이",
      "likes": 180,
      "comments": 40,
    },
    {
      "image": "assets/pet4.png",
      "name": "보리 (웰시코기)",
      "description": "짧은 다리가 매력적인 친구",
      "likes": 200,
      "comments": 50,
    },
  ];

  // 🔹 VS 배틀 모드: 두 마리 랜덤 선택
  late Map<String, dynamic> petA;
  late Map<String, dynamic> petB;

  @override
  void initState() {
    super.initState();
    _selectRandomBattlePets();
  }

  void _selectRandomBattlePets() {
    Random random = Random();
    int firstIndex = random.nextInt(pets.length);
    int secondIndex;
    do {
      secondIndex = random.nextInt(pets.length);
    } while (secondIndex == firstIndex);

    setState(() {
      petA = pets[firstIndex];
      petB = pets[secondIndex];
    });
  }

  void _voteForPet(Map<String, dynamic> pet) {
    setState(() {
      pet["likes"] += 1;
      _selectRandomBattlePets(); // 새로운 배틀 로드
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5ECE1), // 부드러운 베이지톤 배경
      body: SingleChildScrollView(
        child: Column(
          children: [
            // 🔹 VS 배틀 모드
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "🐶 VS 배틀 모드",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  _buildBattleCard(),
                ],
              ),
            ),

            // 🔹 TOP 10 인기 랭킹
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "🏆 TOP 10 인기 반려동물",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Column(
                    children: pets.map((pet) => _buildPetCard(pet)).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 VS 배틀 카드 UI
  Widget _buildBattleCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildBattlePet(petA),
        Text("VS", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        _buildBattlePet(petB),
      ],
    );
  }

  // 🔹 개별 배틀 반려동물 카드 UI
  Widget _buildBattlePet(Map<String, dynamic> pet) {
    return GestureDetector(
      onTap: () => _voteForPet(pet),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(pet["image"],
                width: 120, height: 120, fit: BoxFit.cover),
          ),
          SizedBox(height: 10),
          Text(
            pet["name"],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "❤️ ${pet["likes"]} 좋아요",
            style: TextStyle(fontSize: 14, color: Colors.red),
          ),
        ],
      ),
    );
  }

  // 🔹 개별 반려동물 랭킹 카드 UI
  Widget _buildPetCard(Map<String, dynamic> pet) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 왼쪽 프로필 이미지
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              pet["image"],
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 15),

          // 🔹 중앙 텍스트 정보
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pet["name"],
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  pet["description"],
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.favorite, color: Colors.red, size: 18),
                    SizedBox(width: 4),
                    Text("${pet["likes"]}",
                        style: TextStyle(fontSize: 14, color: Colors.black54)),
                    SizedBox(width: 15),
                    Icon(Icons.comment, color: Colors.black54, size: 18),
                    SizedBox(width: 4),
                    Text("${pet["comments"]}",
                        style: TextStyle(fontSize: 14, color: Colors.black54)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
