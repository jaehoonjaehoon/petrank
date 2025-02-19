import 'package:flutter/material.dart';

class ImageListScreen extends StatefulWidget {
  @override
  _ImageListScreenState createState() => _ImageListScreenState();
}

class _ImageListScreenState extends State<ImageListScreen> {
  // 🔹 반려동물 사진 리스트 (날짜별 정렬)
  final List<Map<String, dynamic>> petImages = [
    {
      "url": "https://source.unsplash.com/200x200/?dog",
      "tag": "강아지",
      "date": "2024-02-15"
    },
    {
      "url": "https://source.unsplash.com/200x200/?cat",
      "tag": "고양이",
      "date": "2024-02-14"
    },
    {
      "url": "https://source.unsplash.com/200x200/?rabbit",
      "tag": "기타",
      "date": "2024-02-13"
    },
    {
      "url": "https://source.unsplash.com/200x200/?hamster",
      "tag": "기타",
      "date": "2024-02-12"
    },
    {
      "url": "https://source.unsplash.com/200x200/?parrot",
      "tag": "기타",
      "date": "2024-02-11"
    },
    {
      "url": "https://source.unsplash.com/200x200/?fish",
      "tag": "기타",
      "date": "2024-02-10"
    },
    {
      "url": "https://source.unsplash.com/200x200/?turtle",
      "tag": "기타",
      "date": "2024-02-09"
    },
    {
      "url": "https://source.unsplash.com/200x200/?horse",
      "tag": "기타",
      "date": "2024-02-08"
    },
    {
      "url": "https://source.unsplash.com/200x200/?lion",
      "tag": "기타",
      "date": "2024-02-07"
    },
  ];

  // 🔹 선택된 필터 (기본: 전체)
  String selectedTag = "전체";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5ECE1), // 배경색

      body: Column(
        children: [
          // 🔹 필터 버튼 (전체 - 왼쪽 정렬 / 나머지 - 오른쪽 정렬)
          Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildFilterButton("전체"), // 왼쪽 정렬
                Row(
                  children: [
                    _buildFilterButton("강아지"),
                    SizedBox(width: 10),
                    _buildFilterButton("고양이"),
                    SizedBox(width: 10),
                    _buildFilterButton("기타"),
                  ],
                ),
              ],
            ),
          ),

          // 🔹 이미지 갤러리 (선택된 필터 적용)
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 1줄에 3개씩
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.0, // 정사각형 비율 유지
                ),
                itemCount: petImages
                    .where((img) =>
                        selectedTag == "전체" || img["tag"] == selectedTag)
                    .length,
                itemBuilder: (context, index) {
                  var filteredImages = petImages
                      .where((img) =>
                          selectedTag == "전체" || img["tag"] == selectedTag)
                      .toList();
                  return _buildImageCard(filteredImages[index]);
                },
              ),
            ),
          ),
        ],
      ),

      // 🔹 업로드 버튼 (반려동물 사진 추가)
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown.shade500,
        onPressed: () {
          print("새 사진 업로드");
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Icon(Icons.camera_alt, color: Colors.white),
      ),
    );
  }

  // 🔹 필터 버튼 UI
  Widget _buildFilterButton(String tag) {
    bool isSelected = selectedTag == tag;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTag = tag;
        });
      },
      child: Container(
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
          tag,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.brown,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // 🔹 개별 이미지 카드 UI
  Widget _buildImageCard(Map<String, dynamic> petImage) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Stack(
          children: [
            // 🔹 반려동물 이미지
            Image.network(
              petImage["url"],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Center(
                    child:
                        Icon(Icons.broken_image, size: 40, color: Colors.grey));
              },
            ),

            // 🔹 날짜 오버레이
            Positioned(
              bottom: 5,
              left: 5,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  petImage["date"],
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
