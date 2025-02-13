import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE0F7FA), // 청록색 계열의 밝은 배경
      body: SafeArea(
        child: Column(
          children: [
            // 상단 프로필 & 제목
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage("assets/profile.png"),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pet Ranking",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.favorite, color: Colors.red, size: 20),
                          SizedBox(width: 5),
                          Text("10", style: TextStyle(fontSize: 16)),
                          SizedBox(width: 10),
                          Icon(Icons.pets, color: Colors.blue, size: 20),
                        ],
                      )
                    ],
                  ),
                  Icon(Icons.notifications, color: Colors.black54, size: 28),
                ],
              ),
            ),
            SizedBox(height: 10),

            // 둥근 버튼 (홈, 업로드, 프로필)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildRoundButton(Icons.home, "Home", true),
                  _buildRoundButton(Icons.upload, "Upload", false),
                  _buildRoundButton(Icons.person, "Profile", false),
                ],
              ),
            ),
            SizedBox(height: 20),

            // 탭 버튼 (Ranking, Upload 등)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTabButton("Home", true),
                  _buildTabButton("Profile", false),
                ],
              ),
            ),
            SizedBox(height: 10),

            // 애완동물 리스트 (GridView)
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2개씩 정렬
                    childAspectRatio: 0.8, // 카드 비율 조정
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return _buildPetCard(index);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 둥근 버튼 위젯
  Widget _buildRoundButton(IconData icon, String label, bool isSelected) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: isSelected ? Colors.cyan : Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
              ),
            ],
          ),
          child: Icon(icon,
              color: isSelected ? Colors.white : Colors.black54, size: 28),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.cyan : Colors.black54,
          ),
        ),
      ],
    );
  }

  // 탭 버튼 위젯
  Widget _buildTabButton(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: isSelected ? Colors.cyan : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.cyan, width: 2),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: isSelected ? Colors.white : Colors.cyan,
        ),
      ),
    );
  }

  // 애완동물 카드 위젯
  Widget _buildPetCard(int index) {
    List<String> petImages = [
      "assets/pet1.png",
      "assets/pet2.png",
      "assets/pet3.png",
      "assets/pet4.png"
    ];
    List<String> petNames = ["Ranking", "Ranking", "Upload", "Upload"];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              petImages[index],
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 5),
          Text(
            petNames[index],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            "Updated 2h ago",
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
