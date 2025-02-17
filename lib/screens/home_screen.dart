import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5ECE1), // 배경색 적용
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "PetRank",
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
      body: Column(
        children: [
          // 🔹 광고 슬라이드
          Container(
            height: 120,
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    color: Colors.amberAccent,
                    child: Center(child: Text("애드몹 광고")),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.blueAccent,
                    child: Center(child: Text("배너 광고")),
                  ),
                ),
              ],
            ),
          ),

          // 🔹 마이펫 프로필 카드
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: EdgeInsets.all(15),
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
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/my_pet.png"),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "루루 (2세, 골든리트리버)",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "나의 반려동물 프로필",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),

          // 🔹 랭킹 보드
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "🔥 현재 TOP 랭킹 애완동물",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return _buildPetRankCard(index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  // 🔹 애완동물 랭킹 카드 UI
  Widget _buildPetRankCard(int index) {
    List<String> petNames = ["애완동물 1", "애완동물 2", "애완동물 3", "애완동물 4"];
    List<int> scores = [100, 90, 80, 70];
    List<String> petImages = [
      "assets/pet1.png",
      "assets/pet2.png",
      "assets/pet3.png",
      "assets/pet4.png"
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: GestureDetector(
        onTap: () {
          // 상세 페이지로 이동 가능
          print("${petNames[index]} 클릭됨");
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 1,
              ),
            ],
          ),
          padding: EdgeInsets.all(12),
          child: Row(
            children: [
              // 🔹 프로필 이미지
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(petImages[index]),
              ),
              SizedBox(width: 12),

              // 🔹 애완동물 정보 (이름 + 점수)
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      petNames[index],
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text("점수: ${scores[index]}점",
                        style:
                            TextStyle(fontSize: 12, color: Colors.grey[600])),
                  ],
                ),
              ),

              // 🔹 좋아요 & 댓글
              Row(
                children: [
                  Icon(Icons.favorite_border, color: Colors.red, size: 20),
                  SizedBox(width: 5),
                  Text("15",
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                  SizedBox(width: 10),
                  Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 18),
                  SizedBox(width: 5),
                  Text("8",
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 하단 네비게이션 바
  // Widget _buildBottomNavigationBar() {
  //   return BottomNavigationBar(
  //     type: BottomNavigationBarType.fixed,
  //     selectedItemColor: Colors.brown,
  //     unselectedItemColor: Colors.grey,
  //     items: [
  //       BottomNavigationBarItem(icon: Icon(Icons.home), label: "HOME"),
  //       BottomNavigationBarItem(icon: Icon(Icons.leaderboard), label: "랭킹"),
  //       BottomNavigationBarItem(icon: Icon(Icons.photo_library), label: "이미지"),
  //       BottomNavigationBarItem(icon: Icon(Icons.timeline), label: "성장기록"),
  //       BottomNavigationBarItem(icon: Icon(Icons.pets), label: "MyPet"),
  //     ],
  //   );
  // }
}
