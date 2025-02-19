import 'package:flutter/material.dart';

class MyPetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5ECE1), // 기존 앱 색상과 조정

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 프로필 카드
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black12,
                    child: Icon(Icons.pets, color: Colors.white),
                  ),
                  SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("루루 (2세, 골든리트리버)",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black45)),
                      SizedBox(height: 5),
                      Text("나의 반려동물 프로필", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.arrow_forward_ios, color: Colors.black12),
                ],
              ),
            ),

            // 설정 버튼들 - 서로 가까이 배치
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end, // 중앙 정렬
                children: [
                  _buildSettingButton(Icons.notifications, "알림 설정"),
                  SizedBox(width: 20), // 간격을 줄임
                  _buildSettingButton(Icons.dark_mode, "화면 설정"),
                ],
              ),
            ),

            SizedBox(height: 20),

            // 광고 라인
            Container(
              margin: EdgeInsets.all(15),
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF1E1E1E),
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

            // 공지사항
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("공지사항",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown)),
                  SizedBox(height: 10),
                  _buildNotice("방문해주셔서 감사합니다. 이벤트 안내", true),
                ],
              ),
            ),

            SizedBox(height: 20),

            // 약관 및 정책 + 고객센터
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("약관 및 정책",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45)),
                  SizedBox(height: 10),
                  _buildPolicyItem("개인정보 처리방침"),
                  _buildPolicyItem("광고문의"),
                  SizedBox(height: 20),
                  Center(
                    child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.headset_mic, color: Colors.black45),
                      label:
                          Text("고객센터", style: TextStyle(color: Colors.black45)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 설정 버튼 위젯
  Widget _buildSettingButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.blueGrey[800], shape: BoxShape.circle),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.black)),
      ],
    );
  }

  // 공지사항 위젯
  Widget _buildNotice(String title, bool isPinned) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.blueGrey[800],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          if (isPinned) Icon(Icons.push_pin, color: Colors.orange),
          SizedBox(width: 10),
          Expanded(
            child: Text(title, style: TextStyle(color: Colors.white)),
          ),
          Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
        ],
      ),
    );
  }

  // 정책 항목 위젯
  Widget _buildPolicyItem(String title) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.black26)),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black26, size: 16),
      onTap: () {},
    );
  }
}
