import 'package:flutter/material.dart';

class ImageListScreen extends StatelessWidget {
  final List<String> imageUrls = [
    "https://source.unsplash.com/200x200/?dog",
    "https://source.unsplash.com/200x200/?cat",
    "https://source.unsplash.com/200x200/?rabbit",
    "https://source.unsplash.com/200x200/?hamster",
    "https://source.unsplash.com/200x200/?parrot",
    "https://source.unsplash.com/200x200/?fish",
    "https://source.unsplash.com/200x200/?turtle",
    "https://source.unsplash.com/200x200/?horse",
    "https://source.unsplash.com/200x200/?lion",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5ECE1), // 배경색 적용

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 1줄에 3개씩 배치
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.0, // 정사각형 비율 유지
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  imageUrls[index],
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
