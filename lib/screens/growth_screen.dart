import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GrowthScreen extends StatefulWidget {
  @override
  _GrowthScreenState createState() => _GrowthScreenState();
}

class _GrowthScreenState extends State<GrowthScreen> {
  // 🔹 반려동물 성장 데이터
  final List<Map<String, dynamic>> growthRecords = [
    {
      "date": "2024-01-01",
      "image": "https://source.unsplash.com/100x100/?dog",
      "weight": 5.0,
      "height": 30.0,
      "healthScore": 80, // 건강 점수 추가
      "note": "처음 집에 온 날!"
    },
    {
      "date": "2024-02-01",
      "image": "https://source.unsplash.com/100x100/?puppy",
      "weight": 7.0,
      "height": 35.0,
      "healthScore": 85,
      "note": "첫 예방접종 완료!"
    },
    {
      "date": "2024-03-01",
      "image": "https://source.unsplash.com/100x100/?goldenretriever",
      "weight": 10.0,
      "height": 40.0,
      "healthScore": 90,
      "note": "산책을 좋아함!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5ECE1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
                    _buildFilterButton("체중"),
                    SizedBox(width: 10),
                    _buildFilterButton("키"),
                    SizedBox(width: 10),
                    _buildFilterButton("건강"),
                  ],
                ),
              ],
            ),
          ),

          // 🔹 성장 그래프
          _buildGrowthChart(),

          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "📌 성장 타임라인",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: growthRecords.length,
              itemBuilder: (context, index) {
                return _buildGrowthCard(growthRecords[index]);
              },
            ),
          ),
        ],
      ),

      // 🔹 성장 기록 추가 버튼
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown.shade500,
        onPressed: () {
          print("새 성장 기록 추가");
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  // 🔹 필터 버튼 UI
  Widget _buildFilterButton(String label) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.brown.shade500,
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
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // 🔹 성장 그래프 UI
  Widget _buildGrowthChart() {
    return Container(
      height: 200,
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: LineChart(
        LineChartData(
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          ),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(1, 5),
                FlSpot(2, 7),
                FlSpot(3, 10),
              ],
              isCurved: true,
              color: Colors.brown,
              barWidth: 3,
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }

  // 🔹 성장 기록 카드 UI
  Widget _buildGrowthCard(Map<String, dynamic> record) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(record["image"]),
        ),
        title: Text(record["date"]),
        subtitle: Text(record["note"]),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("⚖ 체중: ${record["weight"]}kg"),
            Text("📏 키: ${record["height"]}cm"),
            Text(
              "❤️ 건강 점수: ${record["healthScore"]}",
              style: TextStyle(
                color: record["healthScore"] > 80 ? Colors.green : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
