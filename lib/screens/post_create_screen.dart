import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class PostCreateScreen extends StatefulWidget {
  @override
  _PostCreateScreenState createState() => _PostCreateScreenState();
}

class _PostCreateScreenState extends State<PostCreateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  String? selectedPet;
  File? _selectedImage;

  final List<String> pets = ["루루 (골든리트리버)", "초코 (푸들)", "구름이 (스코티시 폴드)"];

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E0), // 따뜻한 배경색 (연한 오렌지톤)
      appBar: AppBar(
        backgroundColor: Colors.brown.shade500,
        title: Text("새 게시글 작성", style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🐾 반려동물 선택 드롭다운
            Text("반려동물 선택", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.brown.shade300),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: selectedPet,
                  hint: Text("반려동물을 선택하세요"),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedPet = newValue;
                    });
                  },
                  items: pets.map<DropdownMenuItem<String>>((String pet) {
                    return DropdownMenuItem<String>(
                      value: pet,
                      child: Text(pet),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(height: 15),

            // 🐾 제목 입력 필드 (말풍선 스타일)
            Text("제목", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            _buildCuteTextField(_titleController, "제목을 입력하세요", 1),

            SizedBox(height: 15),

            // 🐾 내용 입력 필드 (여러 줄, 말풍선 스타일)
            Text("내용", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            _buildCuteTextField(_contentController, "내용을 입력하세요", 5),

            SizedBox(height: 15),

            // 🐾 이미지 업로드 (말풍선 느낌)
            Text("사진 업로드", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.brown.shade300),
                ),
                child: _selectedImage != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          _selectedImage!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      )
                    : Center(
                        child: Icon(Icons.add_a_photo,
                            size: 50, color: Colors.brown.shade500),
                      ),
              ),
            ),

            Spacer(),

            // 🐾 게시 버튼 (하단 고정)
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown.shade700,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  // TODO: 작성한 글 저장 기능 추가 (예: Firebase 연동)
                  Navigator.pop(context); // 작성 완료 후 홈으로 돌아감
                },
                child: Text("게시",
                    style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🐾 귀여운 말풍선 스타일 텍스트 입력 필드
  Widget _buildCuteTextField(
      TextEditingController controller, String hint, int maxLines) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20), // 둥근 말풍선 디자인
        border: Border.all(color: Colors.brown.shade300, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.brown.shade200,
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade500),
        ),
      ),
    );
  }
}
