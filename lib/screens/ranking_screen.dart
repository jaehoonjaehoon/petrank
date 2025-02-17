import 'package:flutter/material.dart';

class RankingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> pets = [
    {
      "image": "assets/pet1.png",
      "name": "루루 (골든리트리버)",
      "description": "사랑스러운 미소와 따뜻한 성격",
      "likes": 15,
      "comments": 8,
    },
    {
      "image": "assets/pet2.png",
      "name": "초코 (푸들)",
      "description": "활발하고 애교 많은 강아지",
      "likes": 12,
      "comments": 5,
    },
    {
      "image": "assets/pet3.png",
      "name": "구름이 (스코티시 폴드)",
      "description": "똘망똘망한 눈망울을 가진 고양이",
      "likes": 18,
      "comments": 9,
    },
    {
      "image": "assets/pet4.png",
      "name": "보리 (웰시코기)",
      "description": "짧은 다리가 매력적인 친구",
      "likes": 20,
      "comments": 10,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5ECE1), // 부드러운 베이지톤 배경
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Popular Pets",
          style: TextStyle(
              fontSize: 22, fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: ListView.builder(
          itemCount: pets.length,
          itemBuilder: (context, index) {
            return _buildPetCard(pets[index]);
          },
        ),
      ),
    );
  }

  // 개별 애완동물 카드 UI
  Widget _buildPetCard(Map<String, dynamic> pet) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
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
          // 왼쪽 프로필 이미지
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
          // 중앙 텍스트 정보
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
