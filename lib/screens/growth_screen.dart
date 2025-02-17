import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GrowthScreen extends StatefulWidget {
  @override
  _GrowthScreenState createState() => _GrowthScreenState();
}

class _GrowthScreenState extends State<GrowthScreen> {
  final List<Map<String, dynamic>> growthRecords = [
    {
      "date": "2024-01-01",
      "image": "https://source.unsplash.com/100x100/?dog",
      "weight": 5.0,
      "height": 30.0,
      "note": "처음 집에 온 날!"
    },
    {
      "date": "2024-02-01",
      "image": "https://source.unsplash.com/100x100/?puppy",
      "weight": 7.0,
      "height": 35.0,
      "note": "첫 예방접종 완료!"
    },
    {
      "date": "2024-03-01",
      "image": "https://source.unsplash.com/100x100/?goldenretriever",
      "weight": 10.0,
      "height": 40.0,
      "note": "산책을 좋아함!"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5ECE1),
      appBar: AppBar(
        title: Text(
          "성장 기록",
          style: TextStyle(color: Colors.brown),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.brown),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 성장 그래프
            _buildGrowthChart(),

            SizedBox(height: 10),
            Text(
              "성장 타임라인",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: growthRecords.length,
                itemBuilder: (context, index) {
                  final record = growthRecords[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
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
                          Text("체중: ${record["weight"]}kg"),
                          Text("키: ${record["height"]}cm"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 성장 그래프 위젯
  Widget _buildGrowthChart() {
    return Container(
      height: 200,
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
}
