import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> posts = [
    {
      "user": "강아지 주인",
      "profilePic": "assets/profile1.png",
      "petImage": "assets/pet1.png",
      "content": "우리 강아지가 오늘 처음으로 공원에서 친구를 만났어요! 🐶",
      "likes": 20,
      "comments": 5,
    },
    {
      "user": "고양이 집사",
      "profilePic": "assets/profile2.png",
      "petImage": "assets/pet2.png",
      "content": "고양이가 새로 산 캣타워를 너무 좋아해요 😻",
      "likes": 32,
      "comments": 12,
    },
    {
      "user": "햄스터 보호자",
      "profilePic": "assets/profile3.png",
      "petImage": "assets/pet3.png",
      "content": "햄스터가 오늘 새로운 미로를 통과했어요! 🐹✨",
      "likes": 18,
      "comments": 7,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF6EC), // 감성적인 크림색 배경

      body: Column(
        children: [
          // 🔹 상단 바 (고급진 스타일 적용)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.brown.shade300, Colors.brown.shade500],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "🐾 PetRank",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    Icon(Icons.search, color: Colors.white),
                    SizedBox(width: 20),
                    Icon(Icons.notifications, color: Colors.white),
                  ],
                ),
              ],
            ),
          ),

          // 🔹 카테고리 필터
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCategoryButton("전체", true),
                _buildCategoryButton("강아지", false),
                _buildCategoryButton("고양이", false),
                _buildCategoryButton("기타", false),
              ],
            ),
          ),

          // 🔹 커뮤니티 피드 (게시글 리스트)
          Expanded(
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return _buildPostCard(posts[index]);
              },
            ),
          ),
        ],
      ),

      // 🔹 고급진 글 작성 버튼
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown.shade500,
        onPressed: () {
          print("새 게시글 작성하기");
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Icon(Icons.edit, color: Colors.white),
      ),
    );
  }

  // 🔹 카테고리 버튼
  Widget _buildCategoryButton(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        color: isSelected ? Colors.brown.shade500 : Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.brown,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 🔹 게시글 UI (고급스럽게 변경)
  Widget _buildPostCard(Map<String, dynamic> post) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔹 유저 정보 (프로필 + 이름)
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(post["profilePic"]),
                ),
                SizedBox(width: 10),
                Text(
                  post["user"],
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 10),

            // 🔹 게시글 이미지
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(post["petImage"],
                  height: 180, width: double.infinity, fit: BoxFit.cover),
            ),
            SizedBox(height: 10),

            // 🔹 게시글 내용
            Text(
              post["content"],
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500),
            ),

            SizedBox(height: 12),

            // 🔹 좋아요 & 댓글 & 공유
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconText(Icons.favorite_border, post["likes"].toString(),
                    Colors.red),
                _buildIconText(Icons.chat_bubble_outline,
                    post["comments"].toString(), Colors.grey),
                _buildIconText(Icons.share, "공유", Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 좋아요 & 댓글 & 공유 버튼 스타일
  Widget _buildIconText(IconData icon, String text, Color color) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        SizedBox(width: 5),
        Text(text, style: TextStyle(fontSize: 14, color: Colors.black)),
      ],
    );
  }
}
