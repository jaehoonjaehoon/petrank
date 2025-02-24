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

  // 📸 이미지 선택 (갤러리 or 카메라)
  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  // 📸 이미지 선택 모달창 (갤러리 or 카메라)
  void _showImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(16),
          height: 150,
          child: Column(
            children: [
              Text("사진 업로드",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 📸 카메라 버튼
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.shade500),
                    onPressed: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.camera);
                    },
                    icon: Icon(Icons.camera_alt, color: Colors.white),
                    label: Text("카메라", style: TextStyle(color: Colors.white)),
                  ),
                  // 🖼 갤러리 버튼
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown.shade700),
                    onPressed: () {
                      Navigator.pop(context);
                      _pickImage(ImageSource.gallery);
                    },
                    icon: Icon(Icons.image, color: Colors.white),
                    label: Text("갤러리", style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF3E0),
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

            // 🐾 제목 입력 필드
            Text("제목", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            _buildCuteTextField(_titleController, "제목을 입력하세요", 1),

            SizedBox(height: 15),

            // 🐾 내용 입력 필드
            Text("내용", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            _buildCuteTextField(_contentController, "내용을 입력하세요", 5),

            SizedBox(height: 15),

            // 🐾 이미지 업로드 버튼 & 미리보기
            Text("사진 업로드", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            GestureDetector(
              onTap: _showImagePicker, // 📸 이미지 선택 모달 띄우기
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

            // 🐾 게시 버튼 (글 작성 완료 후 홈 스크린으로 데이터 전달)
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
                  if (_titleController.text.isEmpty ||
                      _contentController.text.isEmpty ||
                      selectedPet == null ||
                      _selectedImage == null) {
                    return;
                  }

                  // 새 게시글 데이터
                  Map<String, dynamic> newPost = {
                    "user": "나", // 현재 로그인한 유저 (임시)
                    "profilePic": "assets/profile1.png",
                    "petImage": _selectedImage!.path, // 업로드한 이미지
                    "content": _contentController.text,
                    "likes": 0,
                    "comments": 0,
                  };

                  // 홈 화면으로 새 글 데이터 전달
                  Navigator.pop(context, newPost);
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

  // 🐾 말풍선 스타일 텍스트 입력 필드
  Widget _buildCuteTextField(
      TextEditingController controller, String hint, int maxLines) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
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
